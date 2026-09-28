# F&B SMART V5 - STATE MACHINES

## 0. Kiểm soát tài liệu

| Thuộc tính | Giá trị |
|---|---|
| Phiên bản | V0.1 |
| Trạng thái | Baseline chính thức tại G0 |
| Ngày | 2026-08-12 |
| Phạm vi | Operational, Financial, Recovery, Jobs và Projectors |

Tài liệu mô tả command contract và state transitions. Nó không xác nhận đã có code hoặc test PASS.

## 1. Common mutation contract

### 1.1 User principal

Trước transaction nghiệp vụ, backend kiểm tra Firebase Auth, App Check, Store, Device, Membership, Role và Permission. Security failure trả 401/403; không ghi Receipt hoặc Audit nghiệp vụ.

### 1.2 System principal

Chỉ service identity và actor allowlist: `DAILY_SUMMARY_PROJECTOR`, `PAYMENT_EXPIRER`, `CATALOG_RECONCILER`, `FINANCIAL_RECONCILER`. System Receipt/Audit không chứa PII.

### 1.3 Idempotency và result classes

Mọi command đọc Receipt document trước business documents trong transaction. Backend tự canonicalize plaintext envelope và tính `requestHash`.

| Trường hợp | Receipt | Business writes |
|---|---|---|
| Cùng mutationId + cùng hash | Trả canonical result | Không chạy lại |
| Cùng mutationId + khác hash | `permanent_rejection/IDEMPOTENCY_PAYLOAD_MISMATCH` | Không |
| Success | `success` | Atomically cùng Receipt/Audit |
| Business no-op | `business_no_op` | Không tăng revision/counter |
| Revision/business conflict | `business_conflict` | Không |
| Permanent invariant rejection | `permanent_rejection` | Không |
| Technical contention/timeout trước commit | Không Receipt | Rollback và retry/reconcile |

### 1.4 Revision và linking

- Revision mismatch là terminal cho mutationId hiện tại; client refresh và tạo mutation mới nếu nhập lại.
- Cross-ID drift trả invariant error; backend không tự vá.
- Technical `ABORTED/UNAVAILABLE/DEADLINE_EXCEEDED/5xx` mới retry với backoff.

### 1.5 Contribution boundary

- Operational commands không tạo DailySummary Contribution.
- Financial ledger command tạo Contribution trong cùng transaction với ledger.
- Begin/cancel/expire reservation không tạo Contribution.
- Dual-write active/target version áp dụng khi rebuild flag được bật.

## 2. Table State Machine

States: `available`, `occupied`, `cleaning`.

| ID | Source | Command/Permission | Guards chính | Target | Atomic business writes |
|---|---|---|---|---|---|
| T1 | available | `openTableOrder/create_order` | Table+Zone active; currentOrderId absent; candidate Order absent; expected TableState revision | occupied | TableState + Order |
| T2 | occupied | Side effect `cancelDraftOrder/edit_draft_order` | Link hai chiều; Order active/unfenced; chưa submit/ticket/invoice/return pending | cleaning | TableState + Order + draft Lines cancelled |
| T3A | occupied | Side effect `postInvoice/post_invoice`, faceValue=0 | Checkout link; exact lines; ShiftLock+Shift open | cleaning | Invoice/Lines/Counter + Order closed + TableState + Contribution |
| T3B | occupied | Side effect `confirmPayment/confirm_payment`, paid | Attempt/Invoice/Shift/link/counter guards | cleaning | Financial writes + Order closed + TableState |
| T4 | cleaning | `markTableClean/create_order` | Table active; currentOrderId absent; expected revision | available | TableState |

T4 khi đã available là `business_no_op`; khi occupied trả `TABLE_NOT_CLEANING`. Takeaway không đọc/ghi TableState.

## 3. Order và Checkout Fence Machine

Logical states: `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.

| ID | Source | Command | Guards | Target | Writes/Result |
|---|---|---|---|---|---|
| O1 | active_unfenced | `beginCheckout` | draftLineCount=0; pendingReturnLineCount=0; activeLineCount>0; session absent | active_fenced | Order fence metadata |
| O2 | active_fenced | `cancelCheckout` | invoiceId absent; session khớp; reasonCode | active_unfenced | Clear fence fields |
| O3 | active_fenced | `postInvoice`, faceValue>0 | ShiftLock/Shift open; exact submitted/preparing/ready/served SaleLines; applied Returns; sums equal | finalized | Invoice unpaid + Lines + Counter + Order + Revenue Contribution |
| O4 | finalized | Side effect `confirmPayment` | newAllocated=faceValue và newPending=0; links hợp lệ | closed | Financial ledger + Order; dine-in Table cleaning |
| O5 | active_unfenced | `cancelDraftOrder` | chưa submit/ticket/invoice/return pending; reasonCode | cancelled | Order + draft Lines + optional Table cleaning |
| O6 | active_fenced | `postInvoice`, faceValue=0 | exact line set/sums; Shift open; session/revisions/links | closed | Invoice paid 0 + Lines + Counter + Order + optional Table + Revenue Contribution |

Order closed/cancelled là terminal. O3 tạo `allocated=0`, `pending=0`, `status=unpaid`. O6 tạo `status=paid`, tiền bằng 0 và `paidAt` server.

## 4. Sale Line Machine

States: `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.

| ID | Command | Source -> Target | Guards | Atomic writes |
|---|---|---|---|---|
| L1 | `addLine` | N/A -> draft | Order active/unfenced; UUID absent; quantity 1-999; catalog active/available; modifier valid; overflow safe | Line + Order totals/counts |
| L2 | `submitKitchen` | all current draft -> submitted/served | Expected Order revision; backend tự lấy all draft | Lines + Tickets + Order revision/counters |
| L3A | `adjustDraftQuantity` | draft -> draft | Expected Line revision; quantity 1-999 | Line + Order amount delta |
| L3B | `cancelDraftLine` | draft -> draft_cancelled | Expected Line revision; reasonCode | Line + Order totals/counts |
| L4 | Ticket transition | submitted -> preparing -> ready -> served | Exact Ticket-Line linkage và source states | Ticket + exact Lines |

L1 chỉ đọc Catalog và lưu immutable snapshots; không sửa Catalog. L2 dùng `submissionRevision=Order.revision+1`, nhóm station, tối đa 50 items và 500 KiB/ticket; `preparationMode=none` chuyển trực tiếp served.

## 5. Return Line Machine

States: `pending_approval`, `applied`, `rejected`.

| ID | Command/Permission | Guards | Target | Atomic writes |
|---|---|---|---|---|
| R1 | `requestReturn/return_submitted_item` | Order active/unfenced, invoice absent; original status submitted..served; available qty; reason | pending_approval | ReturnLine + original pending qty + Order counts |
| R2 | `approveReturn/approve_return` | Expected Return+Original revisions; links; order unfenced | applied | ReturnLine negative amount + original quantities + Order totals + ReturnTicket if station |
| R3 | `rejectReturn/approve_return` | Expected revisions; reason; order unfenced | rejected | ReturnLine + release pending qty + Order counts |

Amount effect khi applied bằng `-(OriginalLine.unitPrice * quantity)` với overflow guard.

## 6. Kitchen Ticket Machines

### 6.1 Normal Ticket

States: `queued -> acknowledged -> preparing -> ready -> served`.

| ID | Command | Ticket transition | Line transition |
|---|---|---|---|
| KT1 | `acknowledgeTicket` | queued -> acknowledged | Read/validate, giữ submitted |
| KT2 | `startPreparing` | acknowledged -> preparing | submitted -> preparing |
| KT3 | `markReady` | preparing -> ready | preparing -> ready |
| KT4 | `markServed` | ready -> served | ready -> served |

Guard chung: `update_kds`, expected Ticket revision, ticketType normal, exact lineIds, Line.ticketId/orderId/submissionRevision/station khớp. Mismatch trả `TICKET_LINE_STATE_MISMATCH`. KT2-4 không sửa Order Header.

### 6.2 Return Adjustment Ticket

States: `queued -> acknowledged -> served`.

Commands `acknowledgeReturnTicket`, `markReturnServed`; guard `update_kds`, ticket type, expected revision, ReturnLine applied, link Ticket-ReturnLine-Original station. Không thay đổi ReturnLine hoặc SaleLine.

## 7. Shift và ShiftLock Machine

States: `open -> closing -> closed`.

| ID | Command/Permission | Guards | Target | Writes |
|---|---|---|---|---|
| S1 | `openShift/open_shift` | openingCash>=0; Shift ID absent; device Lock không active | open | Shift zero projections + active ShiftLock + opening CashEntry |
| S2 | `startClosingShift/close_shift` | expected revision; Lock active/link; pendingAttemptCount=0; countedCash>=0 | closing | Shift expectedClosingCash, variance, closing metadata |
| S3 | `closeShift/close_shift` | expected revision; Lock active/link; pending=0 | closed | Shift closed + Lock released |

Closing chặn mọi biến động tiền mặt mới. Closed terminal, không reopen và không repair totals.

## 8. PaymentAttempt và Invoice Payment Machine

Attempt states: `pending_confirmation`, `success`, `expired`, `cancelled`.

| ID | Command | Source -> Target | Guards | Atomic actions |
|---|---|---|---|---|
| P1 | `beginPayment` | N/A -> pending_confirmation | Shift từ Lock open; Invoice sale unpaid/partial; method allowlist; amount/capacity; ID absent | Attempt + Invoice pending reserve + Shift pending count |
| P2 | `confirmPayment` | pending -> success | Attempt/Invoice/Shift links; Shift open; counter/reserve; deterministic Settlement absent; cash lock/claim rules | Release reserve/count; create Settlement; allocate Invoice; Shift totals; CashEntry/Claim; Contribution; optional close Order/Table |
| P3 | `cancelPaymentAttempt` | pending -> cancelled | User permission; reason; Shift open; reserve/count guards | Release reserve/count |
| P4 | `expirePaymentAttempt` | pending -> expired | System; server time>=expiresAt; Settlement absent; revision/link guards | Release reserve/count |

Terminal cùng target là no-op; target khác conflict. Nếu Settlement tồn tại khi Attempt pending, trả `PAYMENT_LEDGER_INVARIANT_BROKEN`, không giải phóng counter.

Invoice projection:

- `unpaid`: faceValue>0 và allocated=0.
- `partially_paid`: 0<allocated<faceValue.
- `paid`: faceValue=0 hoặc allocated=faceValue và pending=0.
- `reversed`: paid -> reversed chỉ bởi reverseInvoice.

## 9. Settlement lifecycle

Settlement được tạo một lần và bất biến:

- Payment success: `SET_PAY_{attemptId}`, entryType allocation.
- Debt allocation: `SET_DEBT_{mutationId}`.
- Fund allocation: `SET_FUND_{mutationId}`.
- Adjustment: reversal âm và replacement dương.

Active Settlement = allocation/replacement chưa có SettlementConsumption. Không update/hard-delete.

## 10. Debt Machines

### 10.1 Allocate Debt

`allocateDebt/manage_debt`: Invoice sale unpaid/partial, Customer debt enabled, DebtAccount active, open count<50, amount/capacity, ShiftLock+Shift open.

Atomically tạo Settlement debt, Origination open, DebtEntry dương; cập nhật DebtAccount, Invoice, Shift debt originated; tạo hai Contributions theo hai business dates; đóng Order/Table nếu paid. Không CashEntry.

### 10.2 Collect Debt

`collectDebt/manage_debt`: Shift open, account active, balance và open outstanding đủ. Backend đọc tối đa 50 Originations theo dueDate/createdAt/documentId FIFO.

Atomically tạo DebtCollection, Allocations, từng DebtEntry âm, update Originations, DebtAccount, từng Invoice `debtCollectionAllocationCount`, Shift totals, CashEntry hoặc Claim, Contribution, Receipt/Audit. Settled Origination giảm open count đúng một lần.

Invariant: Collection total bằng tổng Allocations; Account balance bằng tổng open outstanding.

## 11. Unallocated Fund Machine

States: `unallocated -> partially_allocated -> allocated`; refund branch `unallocated|partially_allocated -> refund_pending -> refunded`.

| ID | Command | Guards | Actions |
|---|---|---|---|
| F1 | `createUnallocatedFund` | Bank/QR; Shift/PaymentAccount active; raw ref unique; amount>0 VND | Fund + incoming Claim + received Contribution |
| F2 | `allocateUnallocatedFund` | Fund/Claim link; Invoice sale unpaid/partial; capacity/store/currency | Settlement + FundEntry + reduce Fund + allocate Invoice + allocation Contribution; no Shift/Claim/CashEntry |
| F3 | `requestUnallocatedFundRefund` | Full remaining amount; unallocated/partial | Fund refund_pending + RefundObligation |

F3 completion diễn ra trong completeBankRefund và tạo FundEntry refund cùng hai Contributions. Không gộp ba pha thành một command.

## 12. Payment Adjustment Machines

### 12.1 Adjust payment

`adjustPayment/adjust_payment` tiêu thụ một Active Settlement và tạo PaymentAdjustment, reversal Settlement âm, replacement dương.

Guards: Invoice sale paid; amount không đổi; method matrix cash/bank/QR; consumption absent; active sum bằng Invoice allocated.

Original Shift branching:

- Open: cập nhật ba adjustment nets; tạo correction CashEntry nếu cash delta khác 0.
- Closing: `SHIFT_CLOSING_RETRY_LATER`.
- Closed: chỉ reclassification ledger; không sửa Shift/CashEntry.

Cash->bank/QR cần Claim mới. Bank/QR->cash không tạo Claim. Bank<->QR kế thừa sourceClaimHash. Contribution theo effectiveBusinessDate với signed method deltas; revenue không đổi.

### 12.2 Physical cash movement

`recordAdjustmentCashMovement/adjust_payment`: chỉ khi original Shift thực tế và snapshot đều closed, current ShiftLock+Shift open, cash delta khác 0 và Movement absent.

Tạo AdjustmentCashMovement, CashEntry, tăng current Shift cashAdjustmentNet, Contribution ngày current Shift. PaymentAdjustment giữ bất biến.

## 13. Full Invoice Reversal

`reverseInvoice/adjust_payment`: Sale Invoice paid, reversal link absent, Lines<=200, Settlements<=20, debt allocations actual count khớp counter<=50, preflight request-size.

Atomically:

1. Tạo Reversal Invoice và Lines âm.
2. Original paid -> reversed và ghi linkage/reason.
3. Consume toàn bộ Active Settlements; active sum phải bằng faceValue.
4. Monetary settlements tạo RefundObligations.
5. Debt outstanding tạo DebtEntry reversal, update Originations/Accounts.
6. Debt Allocations chưa consume tạo AllocationConsumptions và RefundObligations.
7. Tạo revenue reversal và debt released Contributions tương ứng.
8. Không sửa Order closed hoặc TableState.

Resource write formula:

```text
L + S + F + D + 2R + 2A + U + 5
```

`L` lines, `S` active settlement consumptions, `F` monetary obligations, `D` originations updated, `R` outstanding reversals (DebtEntry + Contribution), `A` allocation consumption+obligation, `U` DebtAccounts, `+5` two invoices + revenue Contribution + Receipt + Audit.

## 14. Refund Machines

Obligation capacity: `completed + pending + requested <= total`.

| ID | Command | Transition | Actions |
|---|---|---|---|
| RF1 | `completeCashRefund` | Direct completed Attempt | Read open ShiftLock; RefundAttempt+RefundEntry+CashEntry; Shift cashRefund; Obligation completed; cash Contribution |
| RF2 | `beginBankRefundAttempt` | N/A -> pending | Reserve Obligation + create Attempt |
| RF3 | `completeBankRefund` | pending -> completed | Release reserve; increase completed; RefundEntry + OutgoingClaim + bank Contribution; optional Fund finalization |
| RF4 | `cancelBankRefund` | pending -> cancelled | Release reserve once |
| RF5 | `failBankRefund` | pending -> failed | Release reserve once; failure reason |

Terminal Attempt không đổi. Refund method phải bằng Obligation originalMethod. Cash không có pending phase.

## 15. Local Outbox Machine

Statuses: `pending`, `syncing`, `synced`, `conflict`, `rejected`, `blocked`, `abandoned`, `paused_auth`, `quarantined`.

### 15.1 Dispatch

1. Current user phải bằng immutable actorId.
2. Dependencies phải resolved success/no-op.
3. Row có deviceSequence nhỏ nhất trong mọi unresolved row chia sẻ bất kỳ serialization key.
4. SQLite transaction lấy tất cả keys theo ASC, cấp lease và chuyển pending->syncing.
5. Gửi backend sau commit local lease.

### 15.2 Reconciliation

- Syncing sau crash/lease expiry bắt buộc point-get Receipt.
- Hash mismatch -> quarantined/rejected và block keys.
- Success/no-op -> synced; conflict/rejection -> terminal tương ứng.
- Missing Receipt -> pending để dispatch lại.
- Ambiguous timeout/5xx luôn reconcile trước resend.

### 15.3 Local apply

`localApplyStatus: pending/applied/refetch_required/failed` độc lập server status. Server success nhưng local apply fail vẫn giữ synced và refetch; không resend.

### 15.4 Abandon

Chỉ local-abandon nếu chưa từng dispatch. Nếu đã dispatch/ambiguous, gọi `abandonMutation`; lệnh abandon và lệnh gốc tranh chấp cùng Receipt. Cascade chỉ descendants.

## 16. Daily Summary Projector

Contribution status: `pending -> applied|error`, không reset.

Transaction:

1. Đọc Contribution; applied/error là no-op.
2. Kiểm path/ID/version/allowlist/overflow.
3. Cập nhật đúng version Summary; main chỉ khi version đang active.
4. Tăng Summary revision và chuyển Contribution applied atomically.

Invalid contribution chuyển error và alert ngay.

## 17. Shadow rebuild và cutover

1. Tạo JobRun target version và bật rebuild target setting.
2. Financial commands dual-write Active + Target Contributions.
3. Backfill ledger trước thời điểm T thành target Contributions deterministic.
4. Shadow Projector cập nhật version docs.
5. Manifest theo date đếm expected contribution tuples và digests.
6. Per-date cutover transaction đọc Shadow/Main/WorkItem/fencing; pending/error=0 và digests khớp.
7. Copy shadow totals, set main active version, complete WorkItem.
8. Khi mọi date gồm date phát sinh trong rebuild đã cutover, final switch settings và tắt dual-write.

Không xóa main hoặc version cũ.

## 18. Payment Expirer Job

Query collection-group pending attempts hết hạn theo `expiresAt, __name__`, limit 50. Lease/fencing ở WorkItem, không ghi Attempt.

Per-Attempt transaction dùng mutation `EXP_{attemptId}_{revision}`; đọc Receipt, Attempt, Invoice, Shift và deterministic Settlement. Guard server time, links, Shift open, counter/reserve và Settlement absent. Expired -> no-op; success/cancelled -> business conflict. Không Settlement/CashEntry/Contribution.

## 19. JobRun/WorkItem fencing

- Token chỉ tăng khi lease mới hoặc tái chiếm.
- Worker ghi progress chỉ khi token khớp, status running và lease còn hạn.
- `heartbeatAt` chứng minh sống; `lastProgressAt` chứng minh tiến triển.
- Lease hết hạn phải reconcile target trước retry.
- Tối đa một worker/store/date/version và một repair worker/aggregate.

## 20. Reconciliation Detect/Repair

| Aggregate | Source of truth | Repair policy |
|---|---|---|
| Catalog | Catalog docs | Repair counters khi revision fence không đổi |
| Active Order | Current Lines | Repair header projections trước post |
| Finalized/Closed Order | Invoice + Lines | Detect-only |
| Invoice | Settlements + pending Attempts | Detect-only |
| Open Shift | Ledger theo công thức khóa | Repair projections |
| Closing Shift | Ledger | Repair bị chặn |
| Closed Shift | N/A | Report/compensation only |
| DebtAccount | Open Originations | Repair balance/count/due date |
| Fund/Refund | Immutable entries/attempts | Repair projection nếu entries hợp lệ |

Repair yêu cầu reportId, repairPlanHash, expected revisions, permission System/Primary Owner; không sửa immutable ledger.

## 21. Recovery/error map

| Class | Client/System action |
|---|---|
| Security failure | Dừng; refresh auth hoặc quản lý quyền; không Receipt nghiệp vụ |
| Business conflict | Receipt terminal; refresh/re-enter với mutation mới |
| Permanent rejection | Receipt terminal; không retry tự động |
| Technical retryable | Backoff; ambiguous result phải reconcile |
| Link invariant broken | Rollback, P0 alert, manual investigation |
| Response dropped after commit | Retry same mutationId hoặc point-get Receipt |

## 22. Trạng thái

```text
STATE MACHINE BASELINE: APPROVED AT G0
STATE MACHINE CODE IMPLEMENTED: NO
EMULATOR TESTS EXECUTED: NO
PRODUCTION PASS CLAIMED: NO
```
