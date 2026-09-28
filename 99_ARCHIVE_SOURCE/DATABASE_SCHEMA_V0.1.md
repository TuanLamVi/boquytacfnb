# F&B SMART V5 - DATABASE SCHEMA

## 0. Kiểm soát tài liệu

| Thuộc tính | Giá trị |
|---|---|
| Phiên bản | V0.1 |
| Trạng thái | Baseline chính thức tại G0 |
| Ngày | 2026-08-12 |
| Nguồn phê duyệt | PRE-G0 Rounds 3B-2C đến 3B-3.2 và quyết định Owner |
| Database | Cloud Firestore Standard, multi-tenant theo `storeId` |

Tài liệu này khóa schema logic. Việc tạo Firebase project, Rules, Index hoặc dữ liệu thật chưa được thực hiện.

## 1. Quy ước dữ liệu chung

### 1.1 Kiểu và thời gian

- Tiền VNĐ: `Int64`, không dùng float/double.
- Revision/counter: `Int64 >= 0`.
- Thời gian authoritative: Firestore `Timestamp` từ server.
- Business date: `String` định dạng `YYYY-MM-DD`, backend tính từ server time và Store config.
- Enum lưu dưới dạng `String` thuộc allowlist.
- Field absent khác `null`; schema ưu tiên absent cho optional field.
- Mọi phép cộng/nhân tiền phải kiểm tra Int64 overflow.

### 1.2 Metadata chuẩn

Document mutable thường có: `revision`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`. Ledger immutable chỉ có metadata tạo; không update hoặc hard-delete.

### 1.3 Phân lớp dữ liệu

| Lớp | Ví dụ | Chính sách |
|---|---|---|
| NONE | enum, counter, businessDate | Có thể index khi query cần |
| PROFILE_PII | displayName, phoneE164 | Hạn chế quyền; không sao chép không cần thiết |
| FINANCIAL_PII | provider reference, bank details | Backend-only hoặc DTO che dữ liệu; miễn index |
| SECURITY_SENSITIVE | actorId, deviceId, accountFingerprint | Backend/permission hạn chế; audit dùng safe metadata |

### 1.4 Quyền ghi

- Client không ghi trực tiếp business aggregates hoặc financial ledger.
- User command gọi backend; backend xác thực Auth, App Check, Store, Device, Membership, Role và Permission.
- System command chỉ dùng service identity/actor allowlist.
- Security failure không tạo Receipt/Audit nghiệp vụ.

## 2. Canonical collection inventory

### 2.1 Global identity và registry

```text
/users/{uid}
/users/{uid}/commandReceipts/{mutationId}
/storeJoinCodes/{normalizedCode}
/paymentReferenceClaims/{claimHash}
/outgoingPaymentClaims/{claimHash}
```

### 2.2 Store core và cấu hình

```text
/stores/{storeId}
/stores/{storeId}/members/{uid}
/stores/{storeId}/roles/{roleId}
/stores/{storeId}/devices/{deviceId}
/stores/{storeId}/commandReceipts/{mutationId}
/stores/{storeId}/privateSettings/joinAccess
/stores/{storeId}/privateSettings/layoutLimits
/stores/{storeId}/privateSettings/menuLimits
/stores/{storeId}/privateSettings/financialSettings
/stores/{storeId}/paymentAccounts/{accountId}
```

### 2.3 Layout, menu và lookup

```text
/stores/{storeId}/zones/{zoneId}
/stores/{storeId}/tables/{tableId}
/stores/{storeId}/tableStates/{tableId}
/stores/{storeId}/shiftLocks/{deviceId}
/stores/{storeId}/menuMetadata/current
/stores/{storeId}/categories/{categoryId}
/stores/{storeId}/kitchenStations/{stationId}
/stores/{storeId}/stationCodes/{stationCodeHash}
/stores/{storeId}/products/{productId}
/stores/{storeId}/modifierGroups/{groupId}
/stores/{storeId}/productBarcodes/{barcodeHash}
```

### 2.4 Operational aggregates

```text
/stores/{storeId}/orders/{orderId}
/stores/{storeId}/orders/{orderId}/lines/{lineId}
/stores/{storeId}/kitchenTickets/{ticketId}
```

### 2.5 Financial ledger

```text
/stores/{storeId}/invoices/{invoiceId}
/stores/{storeId}/invoices/{invoiceId}/lines/{invoiceLineId}
/stores/{storeId}/invoiceCounters/{businessDate}
/stores/{storeId}/paymentAttempts/{paymentAttemptId}
/stores/{storeId}/settlements/{settlementId}
/stores/{storeId}/settlementConsumptions/{settlementId}
/stores/{storeId}/paymentAdjustments/{adjustmentId}
/stores/{storeId}/adjustmentCashMovements/{movementId}
```

### 2.6 Debt, fund và refund ledger

```text
/stores/{storeId}/customers/{customerId}
/stores/{storeId}/debtAccounts/{customerId}
/stores/{storeId}/debtOriginations/{originationId}
/stores/{storeId}/debtCollections/{collectionId}
/stores/{storeId}/debtCollectionAllocations/{allocationId}
/stores/{storeId}/debtEntries/{debtEntryId}
/stores/{storeId}/debtAllocationConsumptions/{allocationId}
/stores/{storeId}/unallocatedFunds/{fundId}
/stores/{storeId}/unallocatedFundEntries/{entryId}
/stores/{storeId}/refundObligations/{obligationId}
/stores/{storeId}/refundAttempts/{attemptId}
/stores/{storeId}/refundEntries/{refundEntryId}
```

### 2.7 Shift, audit, summaries và jobs

```text
/stores/{storeId}/shifts/{shiftId}
/stores/{storeId}/cashEntries/{cashEntryId}
/stores/{storeId}/auditLogs/{auditId}
/stores/{storeId}/dailySummaries/{businessDate}
/stores/{storeId}/dailySummaries/{businessDate}/contributions/{contributionId}
/stores/{storeId}/dailySummaries/{businessDate}/versions/{projectionVersion}
/stores/{storeId}/jobRuns/{runId}
/stores/{storeId}/jobRuns/{runId}/workItems/{itemId}
/stores/{storeId}/reconciliationReports/{reportId}
```

## 3. Identity, tenancy và command receipts

### 3.1 User

Path: `/users/{uid}`. Mutable profile, không hard-delete trong MVP.

| Field | Type | Req | Ghi chú |
|---|---|---:|---|
| uid | String | Có | Khớp document ID |
| displayName | String | Có | PROFILE_PII, 2-100 ký tự |
| phoneE164 | String | Tùy | PROFILE_PII |
| profileStatus | String | Có | `setup_required/active/suspended` |
| createdAt, updatedAt | Timestamp | Có | Server |
| revision | Int64 | Có | Mutable projection |

Đọc: chính user và backend theo use case. Ghi: backend profile command. Receipt user-scope dùng cho command chưa gắn Store.

### 3.2 Store

Path: `/stores/{storeId}`.

| Field | Type | Req | Ghi chú |
|---|---|---:|---|
| storeId | String | Có | Document ID |
| displayName | String | Có | PROFILE_PII mức tổ chức |
| status | String | Có | `active/suspended/archived` |
| timezone | String | Có | IANA timezone |
| businessDateCutoff | String/Map | Có | Cấu hình tính ngày kinh doanh |
| activeProjectionVersion | Int64 | Có | Version main read model |
| createdBy, createdAt, updatedAt | mixed | Có | Server metadata |
| revision | Int64 | Có | CAS |

### 3.3 Member, Role, Device

| Document | Field chính | Ownership/PII | Vòng đời và invariant |
|---|---|---|---|
| `members/{uid}` | `uid`, `storeId`, `roleId`, `status`, `joinedAt`, `revision` | Backend; actorId SECURITY_SENSITIVE | `active/pending/suspended/revoked`; không hard-delete |
| `roles/{roleId}` | `name`, `permissions[]`, `status`, `revision` | Backend manage_store | Permission enum allowlist; role inactive chặn command |
| `devices/{deviceId}` | `deviceId`, `label`, `platform`, `status`, `registeredBy`, `lastSeenAt`, `revision` | Backend; SECURITY_SENSITIVE | `active/revoked`; heartbeat throttled |

`members` lưu field `uid` để hỗ trợ collection-group membership lookup. Client không được query Receipt theo actor/device.

### 3.4 CommandReceipt

Path user/store scope theo command. Immutable sau khi tạo.

| Field | Type | Req | Ghi chú |
|---|---|---:|---|
| mutationId | String | Có | Document ID |
| scopeType, scopeId | String | Có | `user/store` |
| operationType | String | Có | Command enum |
| requestHash | String | Có | Backend canonical SHA-256 |
| resultClass | String | Có | `success/business_no_op/business_conflict/permanent_rejection` |
| resultCode | String | Có | Safe enum |
| safeResultData | Map | Tùy | Không chứa raw PII |
| actorId, deviceId | String | Có với User | SECURITY_SENSITIVE |
| principalType | String | Có | `user/system` |
| createdAt | Timestamp | Có | Server |

Client chỉ point-get bằng `mutationId`. Recovery API sau thu hồi quyền chỉ trả trường tối giản khi `auth.uid == receipt.actorId`; cấm list/query.

## 4. Private settings và payment accounts

### 4.1 Financial settings

Path: `/stores/{storeId}/privateSettings/financialSettings`.

| Field | Type | Default/Range |
|---|---|---|
| vietqrAttemptTtlMinutes | Int64 | 15, range 5-30 |
| cashAttemptTtlMinutes | Int64 | 10 cố định MVP |
| defaultDebtDueDays | Int64 | 7 |
| maxSettlementsPerInvoice | Int64 | 20 |
| maxAllocationsPerCollection | Int64 | 50 |
| projectionVersion | Int64 | 1 |
| rebuildTargetProjectionVersion | Int64 | Tùy |
| updatedBy, updatedAt, revision | mixed | Bắt buộc |

Backend-only read/write ngoại trừ DTO cấu hình an toàn. Mọi financial command tạo Contribution phải đọc setting trong transaction để hỗ trợ dual-write.

### 4.2 PaymentAccount

Path: `/stores/{storeId}/paymentAccounts/{accountId}`.

| Field | Type | Req | Ghi chú |
|---|---|---:|---|
| accountId | String | Có | UUID v4 |
| providerNamespace | String | Có | Ví dụ `vcb_personal`, `napas` |
| accountFingerprint | String | Có | SECURITY_SENSITIVE, backend-only, no index |
| label | String | Có | Tên gợi nhớ |
| capabilities | Array<String> | Có | `receiving/sending` |
| providerConfig/vietqrConfig | Map | Tùy | FINANCIAL_PII, backend-only, no index |
| status | String | Có | `active/archived` |
| createdBy, createdAt, updatedAt, revision | mixed | Có | Metadata |

Client chỉ nhận QR DTO đã che thông tin. Không hard-delete tài khoản đã được ledger tham chiếu.

## 5. Layout và menu

### 5.1 Zone, Table, TableState

| Document | Fields bắt buộc | Ghi chú |
|---|---|---|
| Zone | `zoneId`, `name`, `status`, `sortOrder`, `revision` | `active/archived` |
| Table | `tableId`, `zoneId`, `name`, `status`, `sortOrder`, `revision` | Metadata vật lý |
| TableState | `tableId`, `state`, `layoutStatusSnapshot`, `currentOrderId?`, `lastOrderId?`, `cleaningStartedAt?`, `lastReleasedAt?`, `revision` | `available/occupied/cleaning`; backend-only write |

TableState snapshot `layoutStatusSnapshot: active|archived` phục vụ query sơ đồ bàn. Snapshot được backend cập nhật cùng Table lifecycle. Khi occupied, `currentOrderId` bắt buộc; cleaning/available phải absent.

### 5.2 ShiftLock

Path: `/stores/{storeId}/shiftLocks/{deviceId}`.

Fields: `deviceId`, `status: active|released`, `shiftId?`, `lockedBy`, `lockedAt`, `releasedAt?`, `revision`.

Backend-only. Lock active phải trỏ tới Shift open/closing hợp lệ. Payment/shift command không tin `shiftId` client.

### 5.3 Catalog

| Document | Field chính | Trạng thái/validation |
|---|---|---|
| Category | `categoryId`, `name`, `normalizedName`, `status`, `sortOrder`, `revision` | `active/archived` |
| KitchenStation | `stationId`, `name`, `status`, `sortOrder`, `revision` | `active/archived` |
| Product | `productId`, `categoryId`, `name`, `normalizedName`, `unitPrice`, `lifecycleStatus`, `saleStatus`, `preparationMode`, `stationId?`, `sortOrder`, `revision` | active + available mới bán |
| ModifierGroup | `groupId`, `name`, `status`, `minSelect`, `maxSelect`, `options[]`, `revision` | Options active; array nhỏ, no index |
| ProductBarcode | `barcodeHash`, `productId`, `status` | Lookup deterministic |
| StationCode | `stationCodeHash`, `stationId`, `status` | Lookup deterministic |
| MenuMetadata | `catalogRevision`, counters, `updatedAt` | Có nguy cơ hotspot; telemetry bắt buộc |

Product/Modifier snapshots trên OrderLine là immutable, miễn index. Catalog không được tăng revision khi addLine chỉ đọc snapshot.

## 6. Order, Line và Kitchen Ticket

### 6.1 Order Header

Path: `/stores/{storeId}/orders/{orderId}`.

| Field | Type | Req | Mutable |
|---|---|---:|---:|
| orderId, storeId | String | Có | Không |
| orderType | String | Có | Không (`dine_in/takeaway`) |
| tableId | String | Dine-in | Không |
| businessDate | String | Có | Không |
| status | String | Có | Có theo machine |
| isFenced | Boolean | Có | Có |
| checkoutSessionId | String | Khi fenced | Có/clear |
| invoiceId | String | Khi post | Link bất biến sau post |
| activeLineCount, draftLineCount, pendingReturnLineCount | Int64 | Có | Projection |
| grossAmount, returnAmount, netAmount | Int64 | Có | Projection |
| revision, lastSubmissionRevision | Int64 | Có | Monotonic |
| createdBy/At, updatedBy/At, fencedBy/At | mixed | Theo trạng thái | Metadata |

States: `active/finalized/closed/cancelled`. Không array Lines. Dine-in link hai chiều với TableState; takeaway bắt buộc absent `tableId`.

### 6.2 Order Line

Path: `/stores/{storeId}/orders/{orderId}/lines/{lineId}`. `lineType: sale|return`.

SaleLine fields: `lineId`, `orderId`, `productId`, `quantity`, `unitPrice`, `amountEffect`, `status`, `productSnapshot`, `modifierSnapshots`, `routingSnapshot`, `ticketId?`, `submissionRevision?`, `pendingReturnQuantity`, `appliedReturnQuantity`, metadata và `revision`.

ReturnLine fields: `returnLineId`, `orderId`, `originalLineId`, `quantity`, `amountEffect`, `status`, `reasonCode`, `rejectionReasonCode?`, `ticketId?`, metadata và `revision`.

Snapshots Map/Array là immutable, không index. Sale states: `draft/submitted/preparing/ready/served/draft_cancelled`. Return states: `pending_approval/applied/rejected`.

### 6.3 KitchenTicket

Path: `/stores/{storeId}/kitchenTickets/{ticketId}`.

| Field | Type | Req | Ghi chú |
|---|---|---:|---|
| ticketId, storeId, orderId, stationId | String | Có | Link bắt buộc |
| ticketType | String | Có | `normal/return_adjustment` |
| businessDate | String | Có | Từ Order |
| submissionRevision | Int64 | Normal | Khớp Lines |
| lineIds | Array<String> | Có | <= 50 items, exact set, no index |
| itemsSnapshot | Array<Map> | Có | <= 500 KiB/ticket, no index |
| status | String | Có | Theo ticket type |
| queuedAt, acknowledgedAt?, readyAt?, servedAt? | Timestamp | Theo state | Server |
| acknowledgedBy?, servedBy? | String | Theo state | SECURITY_SENSITIVE |
| revision | Int64 | Có | Monotonic |

Normal ID deterministic theo Store, Order, submissionRevision, station và chunk. Return Ticket theo ReturnLine/station. Không hard-delete.

## 7. Invoice, PaymentAttempt và Settlement

### 7.1 Invoice

Path: `/stores/{storeId}/invoices/{invoiceId}`.

Immutable core: `invoiceId`, `storeId`, `orderId`, `checkoutSessionId`, `invoiceType`, `internalReceiptNumber`, `businessDate`, `postedShiftId`, `currencyCode`, `lineCount`, `grossAmount`, `returnAmount`, `faceValue`, `postedBy`, `postedAt`.

Mutable projections: `allocatedAmount`, `pendingReservedAmount`, `status`, `paidAt?`, `reversalInvoiceId?`, `reversedBy/At?`, `reversalReasonCode?`, `debtCollectionAllocationCount`, `revision`, `updatedAt`.

States: Sale `unpaid/partially_paid/paid/reversed`; Reversal Invoice dùng `invoiceType=reversal`, `faceValue<0`, `status=posted`. Golden invariant: `allocated >= 0`, `pending >= 0`, `allocated + pending <= faceValue` cho Sale.

InvoiceLines: immutable one-to-one snapshot; reversal lines có số âm đối ứng. Snapshot maps/arrays no index.

### 7.2 InvoiceCounter

Path: `/stores/{storeId}/invoiceCounters/{businessDate}`. Fields: `businessDate`, `nextNumber`, `revision`, `updatedAt`. Chỉ backend transaction; hotspot phải load-test.

### 7.3 PaymentAttempt

| Field | Type | Req | Mutable |
|---|---|---:|---:|
| paymentAttemptId, storeId, invoiceId | String | Có | Không |
| settlementId | String | Có | Không; `SET_PAY_{id}` |
| shiftId, originDeviceId | String | Có | Không |
| method | String | Có | Không; `cash/bank_transfer/vietqr` |
| amount, currencyCode | Int64/String | Có | Không |
| status | String | Có | Có, monotonic |
| expiresAt | Timestamp | Có | Không |
| revision, createdAt, updatedAt | mixed | Có | Revision tăng |

States chỉ gồm `pending_confirmation/success/expired/cancelled`. Terminal không được quay lại pending.

### 7.4 Settlement

Path: `/stores/{storeId}/settlements/{settlementId}`. Immutable.

Fields: `settlementId`, `storeId`, `invoiceId`, `paymentAttemptId?`, `entryType`, `method`, `amount`, `currencyCode`, `shiftId?`, `businessDate`, `sourceType`, `sourceFundId?`, `sourceClaimHash?`, `originalSettlementId?`, `adjustmentId?`, `createdBy`, `createdAt`.

Entry types: `allocation/replacement/reversal`. Refund dòng tiền dùng RefundEntry, không sửa Settlement. Active Settlement là `allocation|replacement` chưa có SettlementConsumption.

## 8. Payment claims

### 8.1 Incoming claim

Path global: `/paymentReferenceClaims/{claimHash}`. Immutable, backend-only.

Hash: `SHA256(canonical(keyVersion, providerNamespace, receivingAccountFingerprint, normalizedProviderReference))`; không chứa channel.

Fields: `claimHash`, `claimKeyVersion`, `normalizationVersion`, `hashAlgorithmVersion`, `providerNamespace`, `storeId`, `receivingAccountFingerprint`, `observedChannel`, `providerReferenceHash`, `amount`, `currencyCode`, `claimOwnerType`, `claimOwnerId`, `ledgerReferenceType`, `ledgerReferenceId`, `claimedBy`, `claimedAt`.

Owner types: `payment_attempt/debt_collection/unallocated_fund/payment_adjustment`. Existing claim chỉ là retry hợp lệ khi toàn bộ invariant ID, amount, currency, Store và account khớp.

### 8.2 Outgoing claim

Path: `/outgoingPaymentClaims/{claimHash}`. Hash dùng sending account fingerprint. Fields: `storeId`, `refundAttemptId`, `refundEntryId`, `amount`, `currencyCode`, `sendingAccountFingerprint`, versions, `claimedAt`. Một claim chỉ thuộc một Attempt/Entry.

## 9. Shift và CashEntry

### 9.1 Shift

Fields chính: `shiftId`, `storeId`, `deviceId`, `businessDate`, `status`, `openingCash`, `countedClosingCash?`, `expectedClosingCash`, `variance?`, `pendingPaymentAttemptCount`, original totals, adjustment nets, `openedBy`, `openedAt`, `closingStartedBy/At?`, `closedBy/At?` và `revision`.

Original totals: `cashSettlementTotal`, `bankTransferSettlementTotal`, `vietqrSettlementTotal`, `debtOriginatedTotal`, `debtCollectionCashTotal`, `debtCollectionBankTotal`, `cashRefundTotal`, `manualCashInTotal`, `manualCashOutTotal`.

Adjustment nets: `cashAdjustmentNet`, `bankTransferAdjustmentNet`, `vietqrAdjustmentNet`.

Adjusted total = original total + adjustment net. States: `open/closing/closed`; closed terminal và totals bất biến.

Expected closing cash:

```text
openingCash
+ cashSettlementTotal
+ debtCollectionCashTotal
+ manualCashInTotal
- cashRefundTotal
- manualCashOutTotal
+ cashAdjustmentNet
```

### 9.2 CashEntry

Immutable fields: `cashEntryId`, `storeId`, `shiftId`, `businessDate`, `entryType`, `amount` có dấu, `settlementId?`, `debtCollectionId?`, `refundAttemptId?`, `adjustmentId?`, `createdBy`, `createdAt`.

Entry types: `opening_float`, `settlement`, `debt_collection`, `refund`, `manual_cash_in`, `manual_cash_out`, `payment_adjustment`.

## 10. Debt ledger

### 10.1 Customer và DebtAccount

Customer fields: `customerId`, `customerCode?`, `displayName`, `normalizedDisplayName`, `phoneE164?`, `isDebtEnabled`, `debtAccountId=customerId`, metadata/revision. PROFILE_PII; không hard-delete. `normalizedDisplayName` chỉ phục vụ prefix search cho user có quyền debt/customer và được xem là PROFILE_PII có index có chủ đích.

DebtAccount fields: `customerId`, `accessStatus: active|blocked`, `balanceStatus: no_debt|outstanding|overdue`, `balance`, `openOriginationCount`, `oldestDueDate?`, `lastOriginationAt?`, `lastEntryAt?`, metadata/revision.

Invariant: balance bằng tổng outstanding của Originations open; open count <= 50.

### 10.2 DebtOrigination

Immutable identity/source: `originationId`, `invoiceId`, `settlementId`, `customerId`, `originalAmount`, `dueDate`, `businessDate`, `createdAt`.

Mutable projection: `outstandingAmount`, `status: open|settled|reversed`, `updatedAt`, `revision`. Origination ID `OR_{settlementId}`.

### 10.3 DebtCollection và Allocation

DebtCollection immutable: `collectionId`, `customerId`, `method`, `totalAmount`, `unallocatedAmount=0` trong MVP, `shiftId`, `claimHash?`, `businessDate`, `createdBy`, `createdAt`.

Allocation immutable: `allocationId`, `collectionId`, `originationId`, `invoiceId`, `amount`, `createdAt`. ID deterministic từ collection + origination. Một Collection tối đa 50 Allocations.

### 10.4 DebtEntry và consumption

DebtEntry immutable: `debtEntryId`, `entryType: origination|collection|reversal`, `customerId`, `originationId`, `collectionId?`, `allocationId?`, `balanceDelta`, `businessDate`, metadata.

DebtAllocationConsumption ID bằng allocationId, fields: `allocationId`, `consumptionType=invoice_reversal`, `consumptionId`, `consumedBy`, `consumedAt`. Chống refund hai lần.

## 11. Unallocated Funds

### 11.1 Fund

Path: `/stores/{storeId}/unallocatedFunds/{fundId}`, ID `UF_{claimHash}`.

Fields: `fundId`, `storeId`, `customerId?`, `originalAmount`, `remainingAmount`, `currencyCode`, `method`, `claimHash`, `status`, `businessDate`, `receivedShiftId`, `receivingAccountId`, `originalClaimOwnerSnapshot`, metadata/revision.

States: `unallocated/partially_allocated/allocated/refund_pending/refunded`. Invariant `0 <= remaining <= original`; remaining zero iff allocated/refunded theo branch.

### 11.2 FundEntry

Immutable fields: `entryId`, `fundId`, `entryType: invoice_allocation|refund`, `amount`, `remainingDelta`, `invoiceId?`, `settlementId?`, `refundId?`, `businessDate`, metadata. Allocation không tạo Claim mới và không cập nhật Shift.

## 12. Adjustments và consumptions

### 12.1 SettlementConsumption

ID bằng settlementId. Fields: `settlementId`, `consumptionType: payment_adjustment|invoice_reversal`, `consumptionId`, `consumedBy`, `consumedAt`. Immutable registry; xung đột giữa adjust và reverse trên cùng document.

### 12.2 PaymentAdjustment

Immutable fields: `adjustmentId`, `storeId`, `invoiceId`, `originalSettlementId`, `reversalSettlementId`, `replacementSettlementId`, `fromMethod`, `toMethod`, `amount`, `methodDeltas`, `originalShiftId`, `originalShiftStatusSnapshot`, `effectiveBusinessDate`, `recordedBusinessDate`, `cashCorrectionEntryId?`, `sourceClaimHash?`, `replacementClaimHash?`, `reasonCode`, `createdBy`, `createdAt`.

Amount mới phải bằng amount gốc. Không hỗ trợ debt/fund adjustment tại command này.

### 12.3 AdjustmentCashMovement

ID `ACM_{adjustmentId}`. Immutable fields: `movementId`, `adjustmentId`, `shiftId`, `signedAmount`, `direction`, `cashEntryId`, `businessDate`, `createdBy`, `createdAt`, `reasonCode`. Chỉ một movement/adjustment; PaymentAdjustment không bị update.

## 13. Reversal và refund

### 13.1 RefundObligation

Fields: `obligationId`, `storeId`, `totalAmount`, `completedAmount`, `pendingReservedAmount`, `originalMethod`, `sourceType`, `sourceId`, `originalInvoiceId?`, `reversalInvoiceId?`, `status`, `businessDate`, metadata/revision.

Source types: `settlement`, `debt_collection_allocation`, `unallocated_fund`. Status: `pending/partially_completed/completed`. Invariant `completed + pending <= total`.

### 13.2 RefundAttempt

Fields: `refundAttemptId`, `refundObligationId`, `amount` dương, `method`, `status`, `shiftId?`, `refundEntryId?`, `outgoingClaimHash?`, `failureReasonCode?`, `revision`, `createdAt`, `updatedAt`.

States: `pending/completed/failed/cancelled`. Cash tạo completed trực tiếp; bank bắt đầu pending.

### 13.3 RefundEntry

Immutable ID `RFE_{refundAttemptId}`. Fields: `refundEntryId`, `refundObligationId`, `refundAttemptId`, `method`, `amount` âm, `cashEntryId?`, `outgoingClaimHash?`, `businessDate`, `createdBy`, `createdAt`.

## 14. Audit, Daily Summary và Contribution

### 14.1 AuditLog

ID `AUD_{mutationId}`. Immutable fields: `auditId`, `mutationId`, `principalType`, `actorId`, `deviceId?`, `operationType`, `aggregateType`, `aggregateId`, `businessDate`, `summaryCode`, `safeMetadata`, `createdAt`. Không chứa raw PII; không hard-delete MVP.

### 14.2 DailySummary

Main document fields: `businessDate`, `activeProjectionVersion`, `revenue`, `payments`, `adjustments`, `debt`, `refunds`, `unallocated`, `manualCash`, `revision`, `updatedAt`.

Các map chỉ chứa delta allowlist. Client có `view_financials` chỉ đọc main active summary.

### 14.3 Contribution

Immutable payload: `contributionId`, `sourceId`, `sourceType`, `contributionKind`, `businessDate`, `projectionVersion`, `deltas`, `createdAt`. Mutable status chỉ `pending -> applied|error`, kèm `appliedAt?`, `lastErrorCode?`.

Projector transaction cập nhật đúng version Summary và Contribution status. Main chỉ được cập nhật khi version contribution trùng `activeProjectionVersion`.

## 15. JobRun, WorkItem và ReconciliationReport

JobRun fields: `runId`, `jobType`, `status`, `leaseOwner`, `leaseExpiresAt`, `fencingToken`, `heartbeatAt`, `lastProgressAt`, `cursor`, `batchSize`, counts, errors và timestamps.

WorkItem fields: `itemId`, `status`, lease/fencing fields, Store/date/version scope, cursor/counts; rebuild item thêm `sourceEventCount`, `targetContributionCount`, `sourceDigest`, `targetDigest`, `pendingCount`, `errorCount`.

ReconciliationReport immutable detect result: `reportId`, `aggregateType`, `aggregateId`, `sourceSetDigest`, `driftCode`, `severity`, `safeMetadata`, `createdAt`, `createdBy`. Repair command tham chiếu `reportId + repairPlanHash` và không sửa immutable ledger.

## 15A. Collection control matrix

Ma trận dưới đây khóa ownership, quyền đọc, PII, vòng đời và race boundary cho mọi path. `Backend` nghĩa là client không được ghi trực tiếp.

| Path/nhóm | Mục đích | Client read | Write owner | PII/index | Retention/race boundary |
|---|---|---|---|---|---|
| `/users/{uid}` | Hồ sơ toàn cục | Chính user/DTO | Backend profile command | PROFILE_PII; phone no-index | Không hard-delete; revision CAS |
| `/users/{uid}/commandReceipts` | Idempotency user-scope | Actor point-get | Backend | SECURITY; document-ID lookup | Immutable/permanent |
| `/storeJoinCodes/{code}` | Join Store lookup | Qua join command | Backend | SECURITY; code là ID | Expire/archive; uniqueness transaction |
| `/paymentReferenceClaims/{hash}` | Incoming payment uniqueness | Deny | Backend financial command | FINANCIAL; ID lookup | Immutable global registry |
| `/outgoingPaymentClaims/{hash}` | Refund transfer uniqueness | Deny | Backend refund command | FINANCIAL; ID lookup | Immutable global registry |
| `/stores/{storeId}` | Tenant root/config công khai | Active member DTO | Backend manage_store | Store profile | Archive; revision CAS |
| `/members/{uid}` | Store membership | Theo quyền/minimal DTO | Backend membership command | SECURITY; CG uid/status | Revoke, không xóa |
| `/roles/{roleId}` | Permission set | Active member minimal | Backend manage_store | Permissions array no-index | Inactivate; revision CAS |
| `/devices/{deviceId}` | Thiết bị tin cậy | Current device/manager | Backend device command | SECURITY; lastSeen index only nếu query | Revoke; heartbeat throttled |
| `/commandReceipts/{mutationId}` | Idempotency Store command | Actor point-get only | Backend/System | SECURITY; no actor query | Immutable/permanent |
| `/privateSettings/joinAccess` | Join-code policy | Deny/DTO | Backend owner | SECURITY; no-index | Mutable CAS |
| `/privateSettings/layoutLimits` | Zone/table caps | DTO khi cần | Backend owner | NONE | Mutable CAS |
| `/privateSettings/menuLimits` | Product/station/ticket caps | DTO khi cần | Backend owner | NONE | Mutable CAS |
| `/privateSettings/financialSettings` | TTL/caps/projection | Deny/limited DTO | Backend owner | SECURITY | Transaction-read by finance commands |
| `/paymentAccounts/{accountId}` | Receiving/sending config | DTO che dữ liệu | Backend owner | FINANCIAL, configs no-index | Archive, không xóa |
| `/zones/{zoneId}` | Khu vực bàn | Active member | Backend layout command | NONE; status/sort | Archive; revision |
| `/tables/{tableId}` | Bàn vật lý | Active member | Backend layout command | NONE; zone/status/sort | Archive; link TableState |
| `/tableStates/{tableId}` | Trạng thái realtime | Active member | Backend order/table command | NONE; layout snapshot index | Không xóa; contention per table |
| `/shiftLocks/{deviceId}` | Ownership ca | Current device/manager | Backend shift/payment | SECURITY; ID lookup | Active/released; contention registry |
| `/menuMetadata/current` | Catalog revision/counters | Active member | Backend catalog command | NONE | Hot document; load-test |
| `/categories/{categoryId}` | Nhóm món | Active member | Backend catalog command | NONE; status/sort/name | Archive; revision |
| `/kitchenStations/{stationId}` | Trạm bếp | Active member/KDS | Backend catalog command | NONE; status/sort | Archive; referenced snapshots |
| `/stationCodes/{hash}` | Station code lookup | Qua command | Backend | SECURITY; ID lookup | Archive; unique |
| `/products/{productId}` | Món bán | Active member | Backend catalog command | Snapshots elsewhere; query indexes | Archive/unavailable; revision |
| `/modifierGroups/{groupId}` | Topping/size rules | Active member | Backend catalog command | Options array no-index | Archive; revision |
| `/productBarcodes/{hash}` | Barcode uniqueness | Point-get/command | Backend | ID lookup | Archive; unique |
| `/orders/{orderId}` | Order header/projections | Authorized operational users | Backend order commands | SECURITY links; query indexes | Terminal preserved; revision |
| `/orders/{orderId}/lines/{lineId}` | Sale/Return Lines | Authorized operational users | Backend line/return commands | Snapshot maps no-index | Không hard-delete; state machine |
| `/kitchenTickets/{ticketId}` | KDS work item | Authorized station users | Backend KDS commands | Snapshots no-index; KDS composite | Không xóa; deterministic ID |
| `/invoices/{invoiceId}` | Revenue document | Financial permission/receipt DTO | Backend invoice/reversal | FINANCIAL; history index | Core immutable; projections guarded |
| `/invoices/{invoiceId}/lines` | Revenue line snapshots | Financial permission | Backend post/reversal | Snapshots no-index | Immutable |
| `/invoiceCounters/{date}` | Receipt number allocation | Deny | Backend postInvoice | NONE | Hot document; transaction |
| `/paymentAttempts/{id}` | Payment reservation | Financial permission/DTO | Backend payment/System | FINANCIAL; expiration indexes | Terminal preserved; counters atomic |
| `/settlements/{id}` | Allocation/reclass ledger | Financial permission | Backend financial command | FINANCIAL; invoice indexes | Immutable/no delete |
| `/settlementConsumptions/{id}` | Consume registry | Deny/financial audit | Backend adjust/reverse | SECURITY; ID lookup | Immutable contention document |
| `/paymentAdjustments/{id}` | Reclassification evidence | Financial permission | Backend adjust | FINANCIAL; invoice index | Immutable |
| `/adjustmentCashMovements/{id}` | Physical cash correction | Financial permission | Backend movement command | FINANCIAL | Immutable one/adjustment |
| `/customers/{id}` | Customer profile | Debt-authorized minimal DTO | Backend customer command | PROFILE_PII; phone no-index | Disable/archive, no hard-delete |
| `/debtAccounts/{id}` | Debt projection | `manage_debt` | Backend debt/repair | FINANCIAL; debt list indexes | Mutable projection; CAS |
| `/debtOriginations/{id}` | Per-invoice debt | `manage_debt` | Backend debt/reversal | FINANCIAL; FIFO index | Identity immutable; outstanding projection |
| `/debtCollections/{id}` | Cash/bank debt receipt | `manage_debt` | Backend collectDebt | FINANCIAL; shift/date indexes if queried | Immutable |
| `/debtCollectionAllocations/{id}` | Collection-to-origin mapping | `manage_debt` | Backend collectDebt | FINANCIAL; invoice/customer indexes | Immutable/deterministic |
| `/debtEntries/{id}` | Debt ledger | `manage_debt` | Backend debt commands | FINANCIAL; customer history index | Immutable |
| `/debtAllocationConsumptions/{id}` | Refund consume registry | Deny/audit | Backend reverse | SECURITY; ID lookup | Immutable |
| `/unallocatedFunds/{id}` | Unclassified incoming money | Financial permission | Backend fund/refund | FINANCIAL; status index | Projection guarded; no delete |
| `/unallocatedFundEntries/{id}` | Fund ledger | Financial permission | Backend fund commands | FINANCIAL; fund link | Immutable |
| `/refundObligations/{id}` | Refund liability | Financial permission | Backend reverse/refund | FINANCIAL; status/source indexes | Mutable capacity projection |
| `/refundAttempts/{id}` | Refund execution state | Financial permission | Backend refund | FINANCIAL; obligation/status index | Terminal preserved |
| `/refundEntries/{id}` | Successful refund ledger | Financial permission | Backend refund | FINANCIAL | Immutable |
| `/shifts/{id}` | Shift projections | Authorized staff/financial | Backend shift/finance | FINANCIAL; date/status if queried | Closed totals immutable |
| `/cashEntries/{id}` | Physical cash ledger | Financial permission | Backend cash commands | FINANCIAL | Immutable |
| `/auditLogs/{id}` | Safe audit trail | `view_audit` | Backend/System | actor/device SECURITY; safe fields indexed | Immutable/permanent MVP |
| `/dailySummaries/{date}` | Active reporting read model | `view_financials` | Projector/cutover | NONE; date index | Versioned projection |
| `/contributions/{id}` | Idempotent report delta | Deny | Backend ledger/Projector status | NONE; status/version index | Payload immutable; monotonic status |
| `/versions/{version}` | Shadow summary | Deny/Owner audit | Projector/cutover | NONE | Giữ để rollback/audit |
| `/jobRuns/{runId}` | Job coordination | Owner/System DTO | System | No PII; job/status index | Retain operational history |
| `/workItems/{itemId}` | Partition/manifest/fencing | Owner/System DTO | System | No PII; status index | Retain with JobRun |
| `/reconciliationReports/{id}` | Detect evidence/repair input | Owner/Auditor | System detect | Safe metadata only | Immutable; repair references |

Private settings minimum fields:

- `joinAccess`: `joinEnabled`, `codeRotationPolicy`, `updatedBy/At`, `revision`.
- `layoutLimits`: `maxZones`, `maxTables`, metadata/revision.
- `menuLimits`: `maxCategories`, `maxProducts`, `maxModifierGroups`, `maxKitchenStations`, `maxLinesPerOrder`, `maxTicketItems`, `maxTicketBytes`, metadata/revision.

StoreJoinCode fields: `normalizedCode`, `storeId`, `status: active|expired|revoked`, `expiresAt?`, `createdBy/At`, `revision`. Code chỉ được đổi trạng thái qua backend; Store link là bất biến.

## 16. Deterministic ID registry

```text
invoiceId                 = INV_{SHA256(canonical(storeId, checkoutSessionId))}
reversalInvoiceId         = RE_{SHA256(canonical(storeId, originalInvoiceId))}
normalTicketId            = KT_{SHA256(canonical(storeId, orderId, submissionRevision, stationId, chunkNo))}
returnTicketId            = KTR_{SHA256(canonical(storeId, orderId, returnLineId, stationId))}
paymentSettlementId       = SET_PAY_{paymentAttemptId}
debtSettlementId          = SET_DEBT_{mutationId}
fundSettlementId          = SET_FUND_{mutationId}
adjustReversalSettlement  = SET_ADJ_REV_{originalSettlementId}
adjustReplacementSettle   = SET_ADJ_REP_{originalSettlementId}
originationId             = OR_{settlementId}
debtOriginationEntryId    = DE_OR_{originationId}
debtCollectionEntryId     = DE_COL_{allocationId}
debtReversalEntryId       = DE_REV_{originationId}
debtAllocationId          = DCA_{SHA256(canonical(collectionId, originationId))}
adjustmentId              = ADJ_{originalSettlementId}
adjustmentMovementId      = ACM_{adjustmentId}
openingCashEntryId        = CE_OPEN_{shiftId}
settlementCashEntryId     = CE_SET_{settlementId}
debtCashEntryId           = CE_DEBT_{collectionId}
refundCashEntryId         = CE_REFUND_{refundAttemptId}
adjustReclassCashEntryId  = CE_ADJ_RECLASS_{adjustmentId}
adjustMoveCashEntryId     = CE_ADJ_MOVE_{adjustmentId}
fundId                    = UF_{claimHash}
fundEntryId               = UFE_{SHA256(canonical(fundId, mutationId))}
refundObligationId        = ROB_{SHA256(canonical(sourceType, sourceId))}
refundEntryId             = RFE_{refundAttemptId}
auditId                   = AUD_{mutationId}
contributionId            = CON_{SHA256(canonical(projectionVersion, sourceType, sourceId, kind, businessDate))}
```

Canonical JSON v1: UTF-8 không BOM; map keys tăng dần theo byte UTF-8; array giữ thứ tự; absent khác null; string không trim/normalize; chỉ Int64 decimal tối giản; cấm float/NaN/Infinity.

## 17. Business-date ownership

| Document/Contribution | Business date source |
|---|---|
| Sale Invoice/InvoiceCounter | Order.businessDate |
| Payment Settlement | Shift của Attempt |
| Debt Settlement | Shift thực hiện allocateDebt |
| DebtOrigination | Invoice.businessDate |
| DebtCollection | Shift thu nợ |
| UnallocatedFund | Shift lúc nhận tiền |
| Fund Allocation Settlement | Fund.businessDate |
| PaymentAdjustment effective | Settlement gốc |
| Adjustment cash movement | Current Shift |
| Reversal Invoice | Backend business date tại lúc đảo |
| Cash Refund | Shift thực tế hoàn |
| Bank Refund | Ngày backend xác nhận chuyển ra |

## 18. Index exemptions

Miễn single-field index cho snapshot maps/arrays, descriptions/notes không query, image URLs, provider configs, account fingerprints, raw/safe hashes không query, encrypted payloads và audit safeMetadata. Chỉ giữ index phục vụ query manifest chính thức.

## 19. Retention và xóa

- Ledger, Claims, Receipts, Audit, Contributions, Invoices và Lines: không hard-delete MVP.
- Catalog/Layout: archive bằng status.
- User/Customer/Member/Device: suspend/revoke/archive, không xóa khi đã được tham chiếu.
- Outbox SQLite cleanup chỉ sau khi server resolved và local state applied/refetched.
- TTL/PITR/backup retention dài hạn là TBD tại G0; không tự bật.

## 20. Schema invariants và race boundaries

- Transaction phải đọc toàn bộ docs liên quan trước writes.
- Target deterministic docs phải được point-get để phát hiện partial/link drift.
- SettlementConsumption và DebtAllocationConsumption là contention registry.
- ShiftLock quyết định Shift; client `shiftId` không authoritative.
- Closed Shift không repair totals.
- Invoice core và immutable ledger không tự vá bằng reconciliation.
- Fund allocation không đọc ShiftLock và không tăng dòng tiền lần hai.
- Reverse preflight dùng công thức resource đầy đủ và caps; request-size phải được đo trước triển khai.

## 21. Trạng thái

```text
DATABASE SCHEMA BASELINE: APPROVED AT G0
FIRESTORE COLLECTIONS CREATED: NO
SECURITY RULES DEPLOYED: NO
INDEXES DEPLOYED: NO
MIGRATION EXECUTED: NO
```
