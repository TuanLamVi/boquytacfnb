# F&B SMART V5 - FIRESTORE QUERY, INDEX & COST BUDGET

## 0. Kiểm soát tài liệu

| Thuộc tính | Giá trị |
|---|---|
| Phiên bản | V0.1 |
| Trạng thái | Baseline chính thức tại G0 |
| Ngày định giá | 2026-08-12 |
| Location baseline | `asia-southeast1` - Singapore |
| Edition | Firestore Standard |
| Planning budget cap | 509,01 USD/tháng tại 1.000 Store |

Budget là kế hoạch, không phải hóa đơn hoặc benchmark thực tế. Query Explain, Emulator và billing export tại G0/G1 phải thay thế các giả định.

## 1. Pricing baseline

Nguồn chính thức:

- Firestore pricing: <https://cloud.google.com/firestore/pricing>
- Firestore billing/index-entry/listener rules: <https://firebase.google.com/docs/firestore/pricing>
- Cloud Scheduler pricing: <https://cloud.google.com/scheduler/pricing>
- Cloud Run functions pricing: <https://cloud.google.com/functions/pricing-1stgen>

| SKU | Giá baseline |
|---|---:|
| Document reads | 0,03 USD/100.000 |
| Document writes | 0,09 USD/100.000 |
| Document deletes | 0,01 USD/100.000 |
| Stored data | xấp xỉ 0,15 USD/GiB-tháng |

Free quota chỉ áp dụng cho một database đủ điều kiện trong Project và reset hằng ngày theo Pacific time:

- 50.000 reads/ngày.
- 20.000 writes/ngày.
- 20.000 deletes/ngày.
- 1 GiB stored data.
- 10 GiB outbound data/tháng.

Khi lập bảng tháng 30 ngày, chỉ được trừ tối đa 1,5 triệu reads và 0,6 triệu writes cho toàn Project, với điều kiện usage phân bố đủ các ngày. Không nhân free quota theo số Store.

## 2. Query contract chung

Mọi list/query phải có:

- Store boundary rõ ràng.
- Exact field names và enum values.
- Limit cứng.
- Cursor dựa trên toàn bộ order fields + `__name__`; không dùng offset.
- Principal/consumer và execution mode.
- Listener lifecycle và reconnect assumption nếu realtime.
- Composite index hoặc xác nhận single-field automatic.
- Estimate documents/query và executions/ngày.
- Rule-dependent reads chỉ áp dụng cho mobile/web SDK; Admin SDK backend tự đọc authorization docs và không đi qua Firestore Security Rules.

Receipt không có list/query. Client chỉ point-get bằng `mutationId`.

## 3. Canonical query inventory

### 3.1 Operational queries

| ID | Consumer | Scope | Exact filter/order | Limit/cursor | Mode | Index |
|---|---|---|---|---|---|---|
| Q01 | Table map | `stores/{s}/tableStates` | `layoutStatusSnapshot == active` | 200; cursor `__name__` nếu cần | Listener | Single-field automatic |
| Q02 | Active orders | `stores/{s}/orders` | `businessDate == D`, `status == active`, order `updatedAt DESC`, `__name__ DESC` | 100 | Listener/list | Composite: businessDate ASC, status ASC, updatedAt DESC |
| Q03 | Order lines | `stores/{s}/orders/{o}/lines` | order `createdAt ASC`, `__name__ ASC` | 200 | Listener khi mở Order | Single-field createdAt |
| Q04 | KDS board | `stores/{s}/kitchenTickets` | `stationId == X`, `status IN [queued, acknowledged, preparing, ready]`, order `queuedAt ASC`, `__name__ ASC` | 50 | Listener | Composite: stationId ASC, status ASC, queuedAt ASC |
| Q05 | Recent invoices | `stores/{s}/invoices` | `businessDate == D`, order `postedAt DESC`, `__name__ DESC` | 50 | Pagination | Composite: businessDate ASC, postedAt DESC |
| Q06 | Shift pending attempts | `stores/{s}/paymentAttempts` | `shiftId == X`, `status == pending_confirmation`, order `createdAt ASC`, `__name__ ASC` | 20 | One-time/list | Composite: shiftId ASC, status ASC, createdAt ASC |
| Q06A | Shift history | `stores/{s}/shifts` | `businessDate == D`, order `openedAt DESC`, `__name__ DESC` | 20 | One-time/list | Composite: businessDate ASC, openedAt DESC |

Listener Q01-Q04 mở theo màn hình và đóng khi rời màn hình, logout, Store switch hoặc Device revoke. KDS hiển thị cảnh báo nếu đạt limit 50; cursor tải phần tiếp theo hoặc lọc station/status hẹp hơn.

### 3.2 Catalog queries

| ID | Consumer | Exact filter/order | Limit | Index |
|---|---|---|---:|---|
| Q07 | Product member | `categoryId == C`, `lifecycleStatus == active`, `saleStatus == available`, order `sortOrder ASC`, `__name__ ASC` | 50/page | Composite 4 fields |
| Q08 | Product manage | `lifecycleStatus == X`, order `normalizedName ASC`, `__name__ ASC` | 50/page | Composite: lifecycleStatus, normalizedName |
| Q09 | Categories | `status == active`, order `sortOrder ASC`, `__name__ ASC` | 100 | Composite: status, sortOrder |
| Q10 | Modifier groups manage | `status == X`, order `normalizedName ASC`, `__name__ ASC` | 50/page | Composite: status, normalizedName |
| Q11 | Kitchen stations | `status == active`, order `sortOrder ASC`, `__name__ ASC` | 50 | Composite: status, sortOrder |

Barcode/station code lookup là point-get deterministic hash, không query.

### 3.3 Debt, fund và refund queries

| ID | Consumer | Scope/filter/order | Limit | Index |
|---|---|---|---:|---|
| Q12 | Debt account list | DebtAccounts, `balanceStatus IN [outstanding, overdue]`, order `oldestDueDate ASC`, `__name__ ASC` | 50 | Composite: balanceStatus, oldestDueDate |
| Q13 | Debt FIFO | DebtOriginations, `customerId == C`, `status == open`, order `dueDate ASC`, `createdAt ASC`, `__name__ ASC` | 50 | Composite: customerId, status, dueDate, createdAt |
| Q14 | Invoice debt allocations | DebtCollectionAllocations, `invoiceId == I`, order `createdAt ASC`, `__name__ ASC` | 50 | Composite: invoiceId, createdAt |
| Q15 | Debt history | DebtEntries, `customerId == C`, order `createdAt DESC`, `__name__ DESC` | 50/page | Composite: customerId, createdAt DESC |
| Q16 | Unallocated funds | Funds, `status IN [unallocated, partially_allocated, refund_pending]`, order `updatedAt ASC`, `__name__ ASC` | 50 | Composite: status, updatedAt |
| Q17 | Refund obligations | Obligations, `reversalInvoiceId == R`, `status IN [pending, partially_completed]`, order `createdAt ASC`, `__name__ ASC` | 20 | Composite: reversalInvoiceId, status, createdAt |
| Q18 | Pending refund attempts | Attempts, `refundObligationId == O`, `status == pending`, order `createdAt ASC`, `__name__ ASC` | 20 | Composite: refundObligationId, status, createdAt |

Customer search MVP:

| ID | Consumer | Scope/filter/order | Limit | Index |
|---|---|---|---:|---|
| Q18A | Debt/customer search | Customers, `normalizedDisplayName >= prefix`, `< prefix + U+F8FF`, order `normalizedDisplayName ASC`, `__name__ ASC` | 20 | Single-field/range; kiểm index-entry reads bằng Query Explain |

Q18A chỉ dành cho quyền debt/customer phù hợp. Không quét phone/name toàn collection. Nếu cần full-text/fuzzy hoặc phone search phải có Scope Expansion Request và PII review.

### 3.4 Financial/reversal queries

| ID | Consumer | Exact filter/order | Limit | Ghi chú/index |
|---|---|---|---:|---|
| Q19 | Active Settlement candidates | `invoiceId == I`, `entryType IN [allocation, replacement]`, order `createdAt ASC`, `__name__ ASC` | 20 | Composite: invoiceId, entryType, createdAt |
| Q20 | Settlement history | `invoiceId == I`, order `createdAt ASC`, `__name__ ASC` | 20 | Composite: invoiceId, createdAt |
| Q21 | Payment adjustments | `invoiceId == I`, order `createdAt ASC`, `__name__ ASC` | 20 | Composite: invoiceId, createdAt |

Q19 chỉ trả candidate. Transaction phải point-get `settlementConsumptions/{settlementId}` cho từng candidate; các reads này thuộc budget reverse/adjust.

### 3.5 Jobs, audit và summaries

| ID | Consumer | Scope/filter/order | Limit | Index/billing note |
|---|---|---|---:|---|
| Q22 | Payment Expirer | Collection-group `paymentAttempts`: `status == pending_confirmation`, `expiresAt <= T`, order `expiresAt ASC`, `__name__ ASC` | 50/batch | Collection-group composite status+expiresAt; `__name__` là range field bổ sung nên theo dõi index-entry reads |
| Q23 | Date projector | `dailySummaries/{D}/contributions`: `projectionVersion == V`, `status == pending`, order `createdAt ASC`, `__name__ ASC` | 50 | Composite: projectionVersion, status, createdAt |
| Q24 | Contribution errors | Same date path: `projectionVersion == V`, `status == error`, order `createdAt ASC` | 50 | Composite tương ứng |
| Q25 | Job runs | `jobType == J`, `status IN [queued, running, paused]`, order `startedAt DESC`, `__name__ DESC` | 20 | Composite: jobType, status, startedAt DESC |
| Q26 | Work items | Scoped `jobRuns/{runId}/workItems`: `status == queued`, order `createdAt ASC`, `__name__ ASC` | 10 | Composite: status, createdAt; không cần field jobRunId |
| Q27 | Reconciliation reports | `aggregateType == T`, `aggregateId == I`, order `createdAt DESC` | 20 | Composite: aggregateType, aggregateId, createdAt DESC |
| Q28 | Audit by aggregate | `aggregateId == I`, order `createdAt DESC`, `__name__ DESC` | 50 | Composite |
| Q29 | Audit by actor | `actorId == U`, order `createdAt DESC`, `__name__ DESC` | 50 | Composite |
| Q30 | Audit by operation | `operationType == O`, order `createdAt DESC`, `__name__ DESC` | 50 | Composite |
| Q31 | Daily summary range | `businessDate >= from`, `businessDate <= to`, order `businessDate DESC`, `__name__ DESC` | 31/93 | Single-field; index-entry billing kiểm bằng Query Explain |
| Q32 | User Store list | Collection-group `members`: `uid == U`, `status IN [active, pending, suspended]` | 20 | Collection-group composite uid+status |

Projector không quét tất cả dates tùy tiện. JobRun tạo WorkItems theo businessDate, sau đó Q23/Q24 chạy trong subcollection date cụ thể.

## 4. Composite index manifest

Các index bắt buộc chính là index ghi trong Q02-Q32. Hướng `__name__` mặc định phải khớp order cuối; khi Firestore tự thêm document name cùng hướng, cấu hình deploy phải được xác nhận bằng Query Explain/Emulator.

Không tạo index “dự phòng” không có Query ID. Index mới cần ghi consumer, query và budget fanout trước phê duyệt.

## 5. Single-field index exemptions

Miễn index:

- `productSnapshot`, `modifierSnapshots`, `routingSnapshot`, `itemsSnapshot`, `lineIds` nếu không dùng array query.
- Description, note, imageUrl, reason text không query.
- Payment provider config, VietQR config, account fingerprint.
- Raw/reference hashes không dùng lookup; riêng claimHash là document ID.
- Audit `safeMetadata`.
- Encrypted Outbox payload không nằm Firestore.
- Large maps/arrays trong InvoiceLine/KitchenTicket.

Exemption phải được triển khai từ manifest; Emulator đo index fanout cho 200 Lines.

## 6. Core sale command write budget

Ký hiệu:

- `L`: số Sale/Invoice Lines.
- `T = sum(ceil(stationLineCount/50))`.
- KDS lifecycle gồm acknowledge, prepare, ready, serve: `3L + 12T` writes.

| Thành phần | Công thức | Typical L=6,T=1 | Modeled high-line case L=200,T=23 |
|---|---:|---:|---:|
| addLine | `4L` | 24 | 800 |
| submitKitchen | `L + T + 3` | 10 | 226 |
| postInvoice | `L + 6` | 12 | 206 |
| beginPayment | 5 | 5 | 5 |
| confirmPayment dine-in | 10 | 10 | 10 |
| KDS lifecycle | `3L + 12T` | 30 | 876 |
| Projector for 2 Contributions | 6 | 6 | 6 |
| Tổng |  | **97** | **2.129** |

Typical giả định: một lần thanh toán đủ, không return/debt/adjustment/rebuild. Cột L=200/T=23 là stress shape đang dùng để lập ngân sách, không phải hard maximum của số Ticket. `T` luôn phải tính từ phân bố Lines theo station; G0 phải khóa giới hạn station hoặc kiểm thử trường hợp `T` lớn hơn 23.

## 7. Advanced command resource formulas

### 7.1 Collect Debt

`A`: allocations; `I`: distinct Invoices tăng allocation counter.

```text
Writes = 3A + I + 7
```

Với `A=50, I=50`: 207 writes. Fixed seven: Collection, DebtAccount, Shift, CashEntry/Claim, Contribution, Receipt, Audit. Business document read lower bound `A + I + 5`; bank/QR và deterministic target checks có thể tăng reads.

### 7.2 Allocate Debt

- Invoice chưa paid: 10 writes.
- Paid takeaway: 11 writes.
- Paid dine-in: 12 writes.

Base gồm Settlement, Origination, DebtEntry, DebtAccount, Invoice, Shift, hai Contributions, Receipt, Audit.

### 7.3 Reverse Invoice

Ký hiệu:

- `L`: reversal lines.
- `S`: active SettlementConsumptions.
- `F`: monetary Settlement RefundObligations.
- `D`: DebtOriginations cập nhật reversed.
- `R`: Originations có outstanding, mỗi cái tạo DebtEntry + Contribution.
- `A`: collected Debt Allocations, mỗi cái tạo Consumption + Obligation.
- `U`: distinct DebtAccounts cập nhật.

```text
Writes = L + S + F + D + 2R + 2A + U + 5
```

Fixed five: Reversal Invoice, Original Invoice, revenue Contribution, Receipt, Audit. Không ghi một “max 345” cố định nếu chưa khóa phân bố debt/monetary. Preflight phải chứng minh dưới 500 writes và safety target 8 MiB.

### 7.4 Fund Refund lifecycle

| Phase | Command | Writes planning |
|---|---|---:|
| 1 | `requestUnallocatedFundRefund` | 4 |
| 2 | `beginBankRefundAttempt` | 4 |
| 3 | `completeBankRefund` nguồn Fund | 10 |
| Tổng lifecycle | Ba transactions độc lập | 18 |

Không gộp ba pha do xác nhận ngân hàng bất đồng bộ.

### 7.5 Other commands

| Command | Planning writes | Ghi chú |
|---|---:|---|
| openShift | 5 | Shift, Lock, CashEntry, Receipt, Audit |
| requestReturn | 5 | Return, Original, Order, Receipt, Audit |
| cancelCheckout | 3 | Order, Receipt, Audit |
| reconcileOrder repair | 3 | Order projection, Receipt, Audit; reads gồm Lines+Order+Report/fence |

## 8. Read budget model

### 8.1 Typical planning assumptions/store/day

- 50 Orders/ngày.
- 5 devices.
- Typical 6 Lines/Order, 1 Ticket, 14 core command invocations/Order.
- Listener chỉ mở khi màn hình hoạt động.
- Admin/reconciliation không chạy liên tục.

| Nguồn | Planning formula | Reads/ngày |
|---|---|---:|
| Command transactions | 50 Orders x command mix; average có authorization/target reads | 7.000 |
| Initial operational listeners | 5 devices x active query scopes/result sets | 1.000 |
| Listener updates/reconnect | Delivered changes + planning reconnect allowance | 1.500 |
| Rule-dependent reads | Chỉ mobile/web direct reads/listeners | 500 |
| Projector/Expirer/Detect | Contribution + Summary transactions, query batches | 2.000 |
| **Expected Typical** |  | **12.000** |
| Conservative planning envelope | Headroom cho reconnect/query variance | **20.000** |
| Stress read envelope | Không dùng làm typical cost | **48.000** |

Average command reads là giả định cần thay bằng telemetry. G0 phải đo riêng từng command; không dùng phần trăm Rules cố định. Listener billing phải gồm initial snapshots, changed documents và full re-read sau reconnect theo chính sách SDK.

## 9. Write volume assumptions

Typical cost model dùng 200.000 writes/store/tháng làm envelope tổng hợp, cao hơn core 97 writes x 50 Orders x 30 = 145.500 để dành cho Shift, Admin, Return, Debt, Jobs và variance. Shadow rebuild không thuộc tháng bình thường và được forecast riêng.

## 10. Cost by scale - expected typical

Giả định 30 ngày, 12.000 reads/store/day và 200.000 writes/store/month.

| Quy mô | Gross reads/tháng | Gross writes/tháng | Read cost sau Project free quota | Write cost sau Project free quota | Document ops |
|---:|---:|---:|---:|---:|---:|
| 1 Store | 360.000 | 200.000 | 0,00* | 0,00* | **0,00*** |
| 100 Store | 36.000.000 | 20.000.000 | 10,35 | 17,46 | **27,81** |
| 1.000 Store | 360.000.000 | 200.000.000 | 107,55 | 179,46 | **287,01** |

`*` Khi daily usage phân bố dưới 50k reads/20k writes của database miễn phí. Storage, network và service khác vẫn có thể tính phí.

## 11. Owner-approved planning budget cap

Chủ đầu tư khóa budget cap dùng conservative read envelope 20.000/store/day:

```text
Gross reads = 20.000 x 1.000 x 30 = 600.000.000
Billable reads = 600.000.000 - 1.500.000
Read cost = 179,55 USD

Gross writes = 200.000.000
Billable writes = 200.000.000 - 600.000
Write cost = 179,46 USD

Firestore document operations = 359,01 USD
Cloud service reserve = 150,00 USD
Approved planning cap = 509,01 USD/tháng
```

Expected Typical estimate là 437,01 USD/tháng gồm 287,01 document ops + 150 reserve. Chênh 72 USD là planning headroom. Không gọi 150 USD là chi phí thực đo.

## 12. Cloud service reserve

Reserve 150 USD bao phủ Functions compute/invocations, Scheduler, storage+indexes, egress, logs/build artifacts và variance. G0 phải thay reserve bằng model có:

- Function generation, region, memory, CPU, concurrency, duration và invocation count.
- Scheduler jobs; 3 free jobs tính theo billing account, không mặc định theo Project.
- Average GiB-month gồm documents, metadata, automatic/composite indexes.
- Firestore/app/function egress sau free allowances.
- Logging retention và volume.

## 13. Hot documents và contention

| Document | Rủi ro | Kiểm soát |
|---|---|---|
| DailySummary/date | Nhiều Contribution cùng ngày | Projector concurrency 1/store/date/version, batch/cursor, contention metric |
| InvoiceCounter/date | Post đồng thời | Transaction, backoff technical ABORTED, load-test; không backoff revision conflict |
| MenuMetadata/current | Mọi catalog mutation | Throttle/admin UX, telemetry, cân nhắc sharding nếu đo thấy cần |
| Shift | Nhiều payment/debt/refund | Một Shift/device, short transactions, pending guards |
| DebtAccount | Thu nợ đồng thời | FIFO transaction, revision và open cap 50 |

Không áp dụng tuyên bố cố định “1 write/giây/document”; giới hạn thực tế phụ thuộc contention, index fanout và workload, phải đo.

## 14. Transaction budget

- Firestore hard write limit và 10 MiB request không được dùng sát ngưỡng; safety target dự án là < 8 MiB.
- 200 Lines, 23 Tickets, collectDebt 50 allocations và reverse worst-case phải đo bằng Emulator/API request.
- Transaction đọc tất cả source/target deterministic docs trước khi write.
- Query result count không đồng nghĩa transaction write count; preflight phải tính toàn bộ Consumptions, Obligations, Entries, Contributions, Receipt và Audit.

## 15. Monitoring và alerts

| Alert | Ngưỡng |
|---|---|
| Monthly planning budget | 50%, 80%, 100% của 509,01 USD |
| Free quota usage | Theo daily database usage, tách khỏi monthly budget |
| Business revision conflict | >5% mutations |
| Firestore aborted retry rate | >10% hoặc tăng bất thường |
| Contribution error | >=1 |
| Projector pending age | >10 phút |
| Payment expiration lag | >5 phút |
| Job lastProgressAt stale | Theo runbook từng job |
| Rebuild digest mismatch | Bất kỳ mismatch trước cutover |
| Financial invariant drift | Bất kỳ P0 finding |

Alert có `deduplicationKey`, severity, timeWindow và runbookCode; không log PII.

## 16. Validation checklist tại G0/G1

- Deploy index manifest vào Emulator trước Cloud.
- Chạy Query Explain cho Q02, Q04, Q07, Q13, Q19, Q22, Q23 và Q31.
- Đo documents returned và index entries scanned.
- Kiểm listener reconnect >30 phút và Store/Device revoke.
- Load-test InvoiceCounter, DailySummary và Shift contention.
- Đo request bytes cho 200 Lines, collectDebt A=50/I=50 và reverse formula worst-case.
- Export billing theo SKU; so expected 12k và cap 20k reads/store/day.
- Tách business conflicts khỏi technical retries trong metrics.

## 17. Trạng thái

```text
QUERY/INDEX/COST BASELINE: APPROVED AT G0
OWNER PLANNING BUDGET CAP: 509.01 USD/MONTH
INDEXES DEPLOYED: NO
QUERY EXPLAIN EXECUTED: NO
LOAD TEST EXECUTED: NO
BILLING TELEMETRY COLLECTED: NO
```
