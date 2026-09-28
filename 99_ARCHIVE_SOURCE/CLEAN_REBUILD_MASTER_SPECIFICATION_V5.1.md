# F&B SMART V5.1 — CLEAN REBUILD MASTER SPECIFICATION

## 1. Document Control

* **Document Title:** F&B Smart V5.1 — Clean Rebuild Master Specification
* **Version:** DRAFT V0.1
* **Status:** DRAFT — READY FOR PO REVIEW
* **Build Mode:** CLEAN_REBUILD
* **Primary Work Item:** MASTER-SPECIFICATION-GATE
* **Prompt ID:** PROMPT-125
* **Author:** Architecture Governance & Product Team
* **Source Authority:** KIM CHỈ NAM, PO Decisions, Four V5.1 Contracts (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`), and Locked Product Discovery modules.
* **Canonical Remote Repository Path:** `99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (Repository: `TuanLamVi/boquytacfnb`, Branch: `codex/migrate-kim-chi-nam-20260928`)
* **Local Workspace Root Copy:** `docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (Workspace root copy only, non-canonical remote)

## 2. Product Purpose & Vision

F&B Smart V5.1 is a next-generation, multi-tenant SaaS POS and restaurant management suite built clean from scratch. It delivers robust real-time operations, strict tenant and store data isolation, uncompromising financial integrity, multi-staff collection, flexible shift management, and seamless offline-online boundary resilience.

## 3. Clean Rebuild Scope (MVP Core)

The scope encompasses the complete end-to-end lifecycle for F&B Smart V5.1 MVP:

* Tenant & Store provisioning, multi-store staff membership.
* Staff authentication (Phone + OTP), mandatory Firebase Auth + App Check security baseline.
* Granular Lego Capability Permissions (Store-scoped, effective immediately).
* 20 Business Models and Quick Setup Menu cloning.
* Table Management (Floor plan, Zones, Table states: `available → occupied → cleaning → available`).
* Table Merge (non-destructive via service group references) & Table Transfer (`occupied → cleaning → available`).
* POS Ordering (Cart grouping, size, structured toppings `[-] [+]`, product options, kitchen dispatch rounds).
* Kitchen Operations (KDS ticket routing, state flow `queued → acknowledged → preparing → ready → served`, independent of payment).
* Return Line & Refund Protocol (R1/R2/R3 return line request/approval, ReturnTickets to kitchen, full invoice reversals, cash/bank refund obligations).
* Checkout & Payment (Cash, payOS QR webhook verification, Split payment, Debt Lite, 3-layer payment attempt/allocation/settlement, discounts, Payment Reference Claim).
* Debt Allocation & Collection (`allocateDebt` DebtOrigination, `collectDebt` FIFO allocation up to 50 originations, DebtAccount balance lifecycle).
* Unallocated Funds (F1 `createUnallocatedFund`, F2 `allocateUnallocatedFund`, F3 `requestUnallocatedFundRefund` for late/unclassified payments).
* Payment Adjustments & Physical Cash Movement (Settlement consumption, reversal/replacement, open-shift vs closing-shift vs closed-shift deltas, `recordAdjustmentCashMovement`).
* Full Invoice Reversals (`reverseInvoice` consuming active settlements, creating negative reversal invoice/lines, releasing debt, generating RefundObligations).
* Shift Management & Cash Drawer (Shift lifecycle `closed → open → closing → closed`, ShiftLock, opening cash immutability, physical cash isolation, close shift blocking).
* Customer Profile & Debt Ledger (Store-scoped debt ledger, debt origination, FIFO collection allocation, preventing negative balances `Còn nợ < 0` blocked).
* Reports & Analytics (Dashboard Today's summary, Revenue formula `Subtotal - Discounts`, `Collected ≠ Debt`, Cash drawer A6 sync, deferred Excel/PDF & COGS).

## 4. Non-Goals / Out of Scope

* Legacy patch chain (Legacy codebase is permanently frozen as Read-Only Forensic Reference).
* Complex third-party integrations not confirmed for MVP (e.g., Zalo / ZaloPay are strictly classified as `FUTURE / OPTIONAL INTEGRATION — PO DECISION REQUIRED`).
* Multi-currency / internationalization (VND currency is fixed for V5.1 MVP).
* Full accounting/ERP, LAN-only KDS without internet.

## 5. System Actors

1. **Customer:** Orders via staff/QR, pays bill, maintains store credit/debt ledger.
2. **Waitstaff:** Opens tables, takes orders, dispatches to kitchen, handles table merge/transfer, requests return lines.
3. **Cashier / Checkout Staff:** Collects payments, splits bills, handles partial payments and debt recording, manages cash drawer.
4. **Kitchen Staff (Chef):** Operates KDS screen, acknowledges, prepares, and marks items ready/served.
5. **Store Owner / Manager:** Manages store configuration, menu, staff memberships, Lego permissions, shift handovers, approves return lines, adjusts payments.
6. **Tenant Superadmin:** Manages tenant settings, multi-store creation, and top-level governance.
7. **System Principal:** System background actors (`DAILY_SUMMARY_PROJECTOR`, `PAYMENT_EXPIRER`, `CATALOG_RECONCILER`, `FINANCIAL_RECONCILER`).

## 6. Tenant / Store / Membership Model

* **Tenant:** Top-level multi-tenant container isolating enterprise entities.
* **Store:** Operational storefront / branch under a tenant.
* **Membership:** Users (Staff) may hold memberships across multiple stores (Multi-Store staff support). Each store membership maintains independent role/permission assignments.

## 7. Identity, Authentication & Security Baseline

* Authentication is governed by Phone number + OTP credentials via Firebase Auth / Credential Manager.
* Customer phone identifiers are strictly separated from staff login accounts.
* **Mandatory Security Baseline:** Every operational command requires verified Firebase Auth token and App Check token. Client applications cannot perform direct business/financial database writes bypassing backend command validators.

## 8. Roles / Permissions / LEGO

* Replaces rigid roles with a granular LEGO Permission Model (Capability Dictionary).
* Capabilities are assigned per store membership and take effect immediately (Permission effective immediately).

## 9. Business Models & Menu

* Supports 20 standardized business models (Representative: Cà phê & Bún/Phở).
* System Menu Templates cloned independently per Store.
* Toppings (`[-] [+]`) support paid/quantity rules. Product Options handle qualitative attributes.

## 10. Table Management

* Structured by Area / Floor and Tables.
* Precise State Machine: `available → occupied → cleaning → available`.
* Entry branches from available: (1) Walk-in, (2) Advance Reservation (optional).

## 11. Table Merge & Transfer

* Table Merge: Non-destructive merge preserving original orders via service group references.
* Table Transfer: Strict transfer from `occupied → cleaning → available`.
* Restriction: Prohibits merge and transfer after checkout has begun or invoice is posted.

## 12. POS Ordering

* Fast order entry, category grid, product detail modal, size, quantity-managed toppings, options, and cart item grouping.
* Supports multi-round ordering and kitchen dispatch (Gửi bếp).

## 13. Order & Order Line

* Immutable line items after kitchen dispatch (`submissionRevision = Order.revision + 1`).
* Managed via service group references for merged tables and round-based ticketing.

## 14. Kitchen / KDS

* Station routing, kitchen ticket model, and state flow: `queued → acknowledged → preparing → ready → served`.
* Completely independent of payment gateway (Ready ≠ Payment Gate, Served ≠ Payment Gate).

## 15. Checkout, Payment & Settlement Lifecycle

* Checkout UX supporting Cash, payOS QR (server webhook verified), Split Payment, and Debt Lite.
* 3-layer architecture: PaymentAttempt → Allocation → Settlement.
* Payment Reference Claim prevents reuse of bank/QR transaction references (`SET_PAY_{attemptId}`).
* Settlement Lifecycle: Settlements are created once and are strictly immutable (`SET_PAY_{attemptId}` for payment success, `SET_DEBT_{mutationId}` for debt allocation, `SET_FUND_{mutationId}` for fund allocation). Active Settlements represent unconsumed allocations/replacements.
* Simple item/order level discounts with strict precedence rules.

## 16. Return Line, Item Void, Invoice Reversals & Refunds (MVP Scope)

* **Return Line Workflow:** `requestReturn` (`pending_approval`) → `approveReturn` (`applied`) / `rejectReturn` (`rejected`).
* **Return Tickets:** Approved return lines for items already in kitchen dispatch generate ReturnTickets sent to kitchen stations.
* **Full Invoice Reversal (`reverseInvoice`):** Atomically consumes active settlements via `SettlementConsumption`, creates reversal negative invoices/lines, releases debt outstanding, and creates RefundObligations using atomic write formula:

```text
L + S + F + D + 2R + 2A + U + 5
```

Does NOT modify closed order status or table state.

* **Refund Obligations & Attempts:**

  * Cash Refund (`completeCashRefund`): Direct completed attempt against open shift cash drawer (no pending attempt phase).
  * Bank Refund Attempt (`beginBankRefundAttempt`): `requested → pending`.
  * `cancelBankRefund` & `failBankRefund`: Releases reserved obligation capacity exactly once (`pending → cancelled / failed`).
  * `completeBankRefund`: `pending → completed`. Original payment method preserved.

## 17. Debt Allocation & Collection (MVP Scope)

* **`allocateDebt`:** Invoice sale unpaid/partial, Customer Debt enabled, DebtAccount active, open count < 50. Atomically creates debt Settlement, DebtOrigination (`open`), DebtEntry (positive); updates DebtAccount, Invoice, Shift debt originated; creates two Contribution entries.
* **`collectDebt`:** Reads open originations FIFO (up to 50), creates DebtCollection, DebtCollectionAllocations, negative DebtEntries; updates Originations, DebtAccount balance, Invoice counters, Shift totals, CashEntry or Claim.
* **Origination Lifecycle:** Origination stays `open` if partially collected; transitions to `settled` only when remaining open balance is 0. Settled origination reduces open count exactly once.
* **Invariant:** Collection total equals sum of Allocations; Account balance equals sum of open outstanding originations. Prevent negative balance (`Còn nợ < 0` blocked). Debt collection increases cash drawer without double-counting sales revenue.

## 18. Unallocated Funds (MVP Scope)

* **State Machine:** `unallocated → partially_allocated → allocated`; refund branch `unallocated|partially_allocated → refund_pending → refunded`.
* **`createUnallocatedFund` (F1):** Bank/QR payment received without immediate invoice link. Creates UnallocatedFund + PaymentClaim + Contribution.
* **`allocateUnallocatedFund` (F2):** Allocates fund to unpaid/partial invoice. Creates Settlement + FundEntry + reduces Fund + updates Invoice + Contribution.
* **`requestUnallocatedFundRefund` (F3):** Initiates refund obligation for unallocated fund. Complete bank refund creates FundEntry refund and two Contributions.

## 19. Payment Adjustments & Physical Cash Movement (MVP Scope)

* **`adjustPayment`:** Consumes an Active Settlement via `SettlementConsumption`, creates PaymentAdjustment, negative reversal Settlement, and positive replacement Settlement.

  * Original Shift Open: Updates shift adjustment nets, creates correction CashEntry if cash delta ≠ 0.
  * Original Shift Closing: `SHIFT_CLOSING_RETRY_LATER`.
  * Original Shift Closed: Reclassifies financial ledger without modifying closed shift. Cash delta movement created in current open shift via `recordAdjustmentCashMovement`.

## 20. Shift & Cash Drawer

* Shift lifecycle (`closed → open → closing → closed`), guarded by active `ShiftLock`.
* Expected Cash Formula:

```text
Opening
+ Physical Cash Collected
+ Cash In
- Cash Out
- Drops
± Adjustments
```

* Physical cash isolation: QR, debt, and uncollected balances never enter the physical cash drawer.
* Opening cash is immutable post-opening; closing shifts are blocked by pending payment attempts or active orders.

## 21. Reports & Analytics

* Dashboard summary ("Tổng quan hôm nay"):

  * Doanh thu bán hàng = Tạm tính - Giảm giá.
  * Đã thu = Actual payment received (Cash + payOS QR). Excludes Debt.
  * Ghi nợ = Customer credit total.
  * Còn phải thu = Uncollected table balance (`Còn phải thu ≠ Nợ`).
  * Tiền mặt trong két = Synced with A6 formula.
* Deferred to Post-MVP: Excel/PDF export and COGS/Profit margin reports.

## 22. Offline Boundary, Local Outbox & Receipt Canonicalization

* Read operations supported via cached local storage.
* Outbox pattern for queued offline mutations using `mutationId` and receipt document canonicalization.
* **Financial Settlement:** Strictly `ONLINE-REQUIRED` with Server Final Authority. Clients cannot self-declare financial success offline. Ambiguous timeouts trigger backoff/reconciliation without creating duplicate settlements.

## 23. Financial Invariants

* Payment is independent of KDS readiness.
* `Còn phải thu ≠ Nợ` (`Partial Payment ≠ Debt`).
* Debt is a deliberate store decision.
* Physical cash isolation for shift cash drawers.
* Immutable post-invoice history.

# 24. Contract-Exact Operational State Machines

## 24.1 Table State Machine

* **States:** `available`, `occupied`, `cleaning`.
* **T1:** `available → occupied`

  * Command: `openTableOrder`
  * Guards:

    * Table + Zone active
    * `currentOrderId` absent
    * Candidate Order absent
    * Expected TableState revision matches
* **T2:** `occupied → cleaning`

  * Command: `cancelDraftOrder` (side effect)
  * Guards:

    * Table/Order bidirectional link matches
    * Order `active_unfenced`
    * No submit/ticket/invoice/return pending
  * Action: cancel draft lines
* **T3A:** `occupied → cleaning`

  * Command: `postInvoice` (zero-total)
  * Guards:

    * Checkout link valid
    * Exact line set
    * ShiftLock + Shift open
    * `faceValue = 0`
* **T3B:** `occupied → cleaning`

  * Command: `confirmPayment` (paid)
  * Guards:

    * Attempt/Invoice/Shift/link/counter guards valid
    * `newAllocated = faceValue`
* **T4:** `cleaning → available`

  * Command: `markTableClean`
  * Guards:

    * Table active
    * `currentOrderId` absent
    * Expected TableState revision matches
  * If already `available`: `business_no_op`
  * If `occupied`: `TABLE_NOT_CLEANING`

## 24.2 Order & Checkout Fence Machine

* **States:** `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.
* **O1:** `active_unfenced → active_fenced`

  * Command: `beginCheckout`
  * Guards:

    * `draftLineCount = 0`
    * `pendingReturnLineCount = 0`
    * `activeLineCount > 0`
    * Session absent
* **O2:** `active_fenced → active_unfenced`

  * Command: `cancelCheckout`
  * Guards:

    * `invoiceId` absent
    * Session matches
    * `reasonCode` present
* **O3:** `active_fenced → finalized`

  * Command: `postInvoice` (unpaid)
  * Guards:

    * ShiftLock + Shift open
    * Exact submitted/preparing/ready/served SaleLines
    * Applied Returns validated
    * Sums equal
    * `faceValue > 0`
  * Result:

    * Invoice status `unpaid`
    * `allocated = 0`
    * `pending = 0`
* **O4:** `finalized → closed`

  * Command: `confirmPayment` (paid)
  * Guards:

    * `newAllocated = faceValue`
    * `pending = 0`
    * Links valid
* **O5:** `active_unfenced → cancelled`

  * Command: `cancelDraftOrder`
  * Guards:

    * No submit/ticket/invoice/return pending
    * `reasonCode` present
* **O6:** `active_fenced → closed`

  * Command: `postInvoice` (zero-total)
  * Guards:

    * Exact line set/sums
    * Shift open
    * Face value = 0
    * Session/revisions/links valid
  * Result:

    * Invoice status `paid`
    * Amount = 0
    * Server `paidAt`

Order `closed` and `cancelled` are terminal states.

## 24.3 Sale Line Machine

* **States:** `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.
* **L1:** N/A → `draft`

  * Command: `addLine`
  * Guards:

    * Order `active_unfenced`
    * Catalog active/available
    * Quantity 1–999
    * Modifier valid
    * Overflow safe
  * Action: store immutable product/modifier snapshots.
* **L2:** `draft → submitted` / `served`

  * Command: `submitKitchen`
  * Guards:

    * Expected Order revision
    * `submissionRevision = Order.revision + 1`
    * Maximum 50 items / 500 KiB per ticket
    * Group by station
  * `preparationMode = none` transitions directly to `served`.
* **L3A:** `draft → draft`

  * Command: `adjustDraftQuantity`
  * Guards: Expected Line revision; quantity 1–999.
* **L3B:** `draft → draft_cancelled`

  * Command: `cancelDraftLine`
  * Guards: Expected Line revision; `reasonCode`.
* **L4:** `submitted → preparing → ready → served`

  * Driven by KDS Ticket transitions.

## 24.4 Return Line Machine

* **States:** `pending_approval`, `applied`, `rejected`.
* **R1:** N/A → `pending_approval`

  * Command: `requestReturn`
  * Guards:

    * Order active/unfenced
    * Invoice absent
    * Original status submitted..served
    * Available quantity
    * Reason provided
* **R2:** `pending_approval → applied`

  * Command: `approveReturn`
  * Guards:

    * Expected Return + Original revisions
    * Links valid
    * Order unfenced
  * Action:

    * Negative amount = `-(UnitPrice × Qty)`
    * Overflow guard
    * Create ReturnTicket when station applies
* **R3:** `pending_approval → rejected`

  * Command: `rejectReturn`
  * Guards:

    * Expected revisions
    * Reason
    * Order unfenced

## 24.5 Kitchen Ticket Machines

### Normal Ticket

States:

```text
queued → acknowledged → preparing → ready → served
```

* **KT1:** `acknowledgeTicket`

  * `queued → acknowledged`
  * Holds submitted lines.
* **KT2:** `startPreparing`

  * `acknowledged → preparing`
  * Lines `submitted → preparing`
* **KT3:** `markReady`

  * `preparing → ready`
  * Lines `preparing → ready`
* **KT4:** `markServed`

  * `ready → served`
  * Lines `ready → served`

Common Guards:

* `update_kds`
* Expected Ticket revision
* `ticketType = normal`
* Exact `lineIds`
* Line `ticketId/orderId/submissionRevision/station` must match
* Mismatch returns `TICKET_LINE_STATE_MISMATCH`
* KT2–KT4 do not modify Order Header

### Return Ticket

States:

```text
queued → acknowledged → served
```

Commands:

* `acknowledgeReturnTicket`
* `markReturnServed`

Guards:

* `update_kds`
* `ticketType = return`
* Expected revision
* ReturnLine applied
* Ticket–ReturnLine–Original station linkage valid

ReturnTicket operations do not alter ReturnLine or SaleLine state.

## 24.6 Shift & ShiftLock Machine

* **States:** `closed → open → closing → closed`.

### S1

* Command: `openShift`
* `closed → open`
* Guards:

  * `openingCash >= 0`
  * Shift ID absent
  * Device lock free
* Actions:

  * Create active ShiftLock
  * Create opening CashEntry

### S2

* Command: `startClosingShift`
* `open → closing`
* Guards:

  * Expected revision
  * Lock active and correctly linked
  * `pendingAttemptCount = 0`
  * `countedCash >= 0`

### S3

* Command: `closeShift`
* `closing → closed`
* Guards:

  * Expected revision
  * Lock active and correctly linked
  * `pendingAttemptCount = 0`

Closing blocks new cash movement. Closed is terminal and cannot be reopened or repaired.

## 24.7 PaymentAttempt & Invoice Projection Machine

### PaymentAttempt States

```text
pending_confirmation
success
expired
cancelled
```

### P1 — Begin Payment

`N/A → pending_confirmation`

Guards:

* Shift open from ShiftLock
* Invoice sale `unpaid` or `partial`
* Payment method allowlist
* Amount/capacity valid
* Attempt ID absent

Actions:

* Create PaymentAttempt
* Reserve Invoice pending amount
* Increment Shift pending attempt count

### P2 — Confirm Payment

`pending_confirmation → success`

Guards:

* Attempt/Invoice/Shift links valid
* Shift open
* Counter/reserve valid
* Deterministic Settlement absent
* Cash lock / Claim rules valid

Actions:

* Release reserve/count
* Create Settlement `SET_PAY_{attemptId}`
* Allocate Invoice
* Update Shift totals
* Create CashEntry or Claim
* Create Contribution
* Optionally close Order/Table when all closure guards pass

### P3 — Cancel Payment Attempt

`pending_confirmation → cancelled`

Guards:

* User permission
* Reason provided
* Shift open
* Reserve/count guards valid

Actions:

* Release reserve/count

### P4 — Expire Payment Attempt

`pending_confirmation → expired`

Guards:

* System principal
* Server time `>= expiresAt`
* Settlement absent
* Expected Attempt revision valid
* Attempt/Invoice/Shift links valid

Actions:

* Release pending reserve/count only when Settlement is absent and all revision/link guards pass.

If a Settlement already exists while Attempt remains pending, return:

```text
PAYMENT_LEDGER_INVARIANT_BROKEN
```

and do not release the pending counter/reserve.

### Invoice Projection

* `unpaid`: `faceValue > 0` and `allocated = 0`
* `partially_paid`: `0 < allocated < faceValue`
* `paid`: `faceValue = 0` or (`allocated = faceValue` and `pending = 0`)
* `reversed`: `paid → reversed` only through `reverseInvoice`

## 24.8 Settlement Lifecycle Machine

Settlements are created once and are immutable.

### Settlement IDs

* Payment: `SET_PAY_{attemptId}`
* Debt: `SET_DEBT_{mutationId}`
* Fund: `SET_FUND_{mutationId}`

### Lifecycle

```text
N/A → active → consumed
```

* Created by successful payment/debt/fund allocation.
* Active Settlement = allocation/replacement without `SettlementConsumption`.
* `adjustPayment` and `reverseInvoice` consume active settlements using `SettlementConsumption`.
* No update/hard-delete of existing Settlement records.

## 24.9 Debt Allocation & Collection Machine

### Allocation

`Invoice unpaid/partial → DebtOrigination(open)`

Guards:

* Customer Debt enabled
* DebtAccount active
* Open count < 50
* Amount/capacity valid
* ShiftLock + Shift open

Actions:

* Create `SET_DEBT_{mutationId}`
* Create DebtOrigination `open`
* Create positive DebtEntry
* Update DebtAccount
* Update Invoice
* Update Shift debt-originated totals
* Create Contributions

### Collection

`DebtOrigination(open) → open|settled`

Guards:

* Shift open
* DebtAccount active
* Account balance and open outstanding sufficient
* FIFO ordered by `dueDate / createdAt / documentId`
* Maximum 50 originations

Actions:

* Create DebtCollection
* Create DebtCollectionAllocations
* Create negative DebtEntries
* Update Originations
* Update DebtAccount
* Update Invoice debt allocation counters
* Update Shift totals
* Create CashEntry or Claim
* Create Contribution
* Create Receipt/Audit

### Origination Lifecycle Invariant

* Partial collection:

  * Origination remains `open`
  * Open balance decreases
* Full collection:

  * Origination becomes `settled`
  * Open count decreases exactly once
* DebtAccount balance equals the sum of open outstanding originations.
* Collection total equals sum of allocations.
* Negative debt is blocked.

## 24.10 Unallocated Fund Machine

### States

```text
unallocated → partially_allocated → allocated
```

Refund branch:

```text
unallocated | partially_allocated → refund_pending → refunded
```

### F1 — Create Unallocated Fund

Guards:

* Bank/QR payment
* PaymentAccount active
* Shift active
* Raw reference unique
* Amount > 0 VND

Actions:

* Create UnallocatedFund
* Create incoming PaymentClaim
* Create received Contribution

### F2 — Allocate Unallocated Fund

Guards:

* Fund/Claim link valid
* Invoice sale unpaid/partial
* Capacity valid
* Store and currency match

Actions:

* Create `SET_FUND_{mutationId}`
* Create FundEntry
* Reduce Fund balance
* Allocate Invoice
* Create allocation Contribution
* No Shift/CashEntry/Claim re-entry for the allocation itself

### F3 — Request Unallocated Fund Refund

Guards:

* Full remaining amount
* Fund state `unallocated` or `partially_allocated`

Actions:

* Set refund state to `refund_pending`
* Create RefundObligation

Completion occurs through `completeBankRefund`, which creates FundEntry refund and the required Contributions.

The three phases are not collapsed into one command.

## 24.11 Payment Adjustment Machine

### Adjust Payment

`Active Settlement → consumed + reversal Settlement + replacement Settlement`

Guards:

* Invoice sale is paid
* Amount unchanged
* Method matrix valid
* No existing SettlementConsumption
* Active Settlement sum equals Invoice allocated

Actions:

* Consume original active settlement
* Create PaymentAdjustment
* Create negative reversal Settlement
* Create positive replacement Settlement

### Original Shift Branching

**Original Shift Open**

* Update three adjustment nets
* Create correction CashEntry if cash delta ≠ 0

**Original Shift Closing**

* Return `SHIFT_CLOSING_RETRY_LATER`

**Original Shift Closed**

* Reclassify financial ledger
* Do not modify the closed Shift or historical CashEntry

### Method Rules

* Cash → Bank/QR: create new Claim
* Bank/QR → Cash: no new Claim
* Bank ↔ QR: inherit `sourceClaimHash`
* Contribution uses `effectiveBusinessDate`
* Method deltas are signed
* Revenue remains unchanged

### Physical Cash Movement

`recordAdjustmentCashMovement` is allowed only when:

* Original Shift is actually closed
* Original Shift snapshot is also closed
* Current ShiftLock + Shift are open
* Cash delta ≠ 0
* AdjustmentCashMovement does not already exist

Actions:

* Create AdjustmentCashMovement
* Create CashEntry
* Increase current Shift `cashAdjustmentNet`
* Create Contribution dated to current Shift
* Keep original PaymentAdjustment immutable

## 24.12 Full Invoice Reversal Machine

### Transition

```text
Paid Sale Invoice
        ↓
reverseInvoice
        ↓
Reversal Invoice + Negative Lines
        +
RefundObligations
```

### Core Guards

`reverseInvoice` is permitted only when:

* Invoice is a paid Sale Invoice
* Reversal link is absent
* Lines ≤ 200
* Settlements ≤ 20
* Debt allocation actual count matches stored counter
* Debt allocation count ≤ 50
* Preflight request-size safety passes

### Atomic Actions

All required writes occur atomically:

1. **Create Reversal Invoice and Lines**

   * Create reversal invoice
   * Create negative reversal lines corresponding to original invoice lines

2. **Reverse Original Invoice**

   * Original paid invoice becomes `reversed`
   * Record reversal linkage and reason

3. **Consume Active Settlements**

   * Identify all Active Settlements attached to the original invoice
   * Consume each using `SettlementConsumption`
   * Verify active Settlement sum equals original invoice `faceValue`

4. **Create Monetary Refund Obligations**

   * For monetary settlements, create RefundObligations corresponding to refundable amounts

5. **Release Outstanding Debt**

   * Create reversal DebtEntries for outstanding debt
   * Update affected DebtOriginations
   * Update DebtAccounts

6. **Reverse Unconsumed Debt Allocations**

   * For Debt Allocations not already consumed:

     * Create AllocationConsumptions
     * Create corresponding RefundObligations

7. **Create Financial Contributions**

   * Create revenue reversal Contributions
   * Create debt-released Contributions
   * Preserve effective business date semantics

8. **Preserve Closed Operational State**

   * Do not modify the already closed Order status
   * Do not modify TableState

### Resource Write Formula

```text
L + S + F + D + 2R + 2A + U + 5
```

Where:

* `L` = reversal Lines
* `S` = Active Settlement consumptions
* `F` = monetary RefundObligations
* `D` = DebtOriginations updated
* `R` = outstanding debt reversals (`DebtEntry + Contribution`)
* `A` = debt allocation consumption + RefundObligation
* `U` = DebtAccounts updated
* `+5` = two invoices + revenue Contribution + Receipt + Audit

## 24.13 Refund Obligation & Attempt Machine

### Obligation Capacity

```text
completed + pending + requested <= total
```

### Obligation States

```text
requested → pending → completed
                  ↘ failed
```

### RF1 — Cash Refund

`requested → completed`

Guards:

* Shift open
* ShiftLock valid
* Cash drawer sufficient

Actions:

* Create RefundAttempt
* Create RefundEntry
* Create CashEntry
* Update Shift cashRefund
* Mark Obligation completed
* Create cash Contribution

Cash refund has no pending attempt phase.

### RF2A — Begin Bank Refund Attempt

`requested → pending`

Guards:

* Obligation capacity available
* Original refund method matches

Actions:

* Reserve obligation capacity
* Create RefundAttempt

### RF2B — Complete Bank Refund

`pending → completed`

Actions:

* Release pending reservation
* Increase completed amount/count
* Create RefundEntry
* Create outgoing Claim
* Create bank Contribution
* Finalize UnallocatedFund refund when applicable

### RF2C — Cancel / Fail Bank Refund

`pending → cancelled / failed`

Commands:

* `cancelBankRefund`
* `failBankRefund`

Actions:

* Release reserved obligation capacity exactly once
* Persist failure reason when failed

Refund method must match the Obligation `originalMethod`.

Terminal refund states do not transition again.

## 25. Data Model & Schema Rules

Governed strictly by `DATABASE_SCHEMA_V0.1.md`, including:

* Tenants
* Stores
* Users
* Memberships
* Tables
* Orders
* OrderLines
* Payments
* Shifts
* Customers
* DebtLedger
* UnallocatedFunds
* DebtOriginations
* PaymentAttempts
* Settlements
* RefundObligations
* PaymentAdjustments
* Contributions
* Claims
* Receipt/Audit records

## 26. Firestore Query & Cost Constraints

Governed strictly by `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`:

* Bounded reads
* Pagination
* Index governance
* General transaction safety target: **< 8 MiB** per transaction payload
* Kitchen Ticket payload size target: **≤ 500 KiB** per ticket payload
* Planning cost cap budget: **$509.01 USD / month**

## 27. Security & Tenant Isolation

* **Firebase Auth + App Check** tokens mandatory on all API calls.
* Security rules enforce store-scoped membership capabilities and backend-only financial/business writes.
* Tenant/store isolation is mandatory for all business and financial data.

## 28. Error / Retry / Idempotency

* UUID idempotency tokens required.
* Receipt documents canonicalize plaintext envelopes.
* `mutationId` deduplication is mandatory.
* Ambiguous financial operations require reconciliation before retry.
* Server remains final authority for financial reconciliation.
* Client cannot self-declare financial success.

## 29. Integration Boundaries

* **payOS:** Core MVP payment gateway with webhook verification.
* **Zalo / ZaloPay:** Strictly classified as `FUTURE / OPTIONAL INTEGRATION — PO DECISION REQUIRED`. Not part of Core MVP.

## 30. Acceptance Test Strategy & Provenance

* Requirements are mapped to Acceptance Criteria and Test Scenarios.
* Every implementation artifact must preserve:

```text
EXACT SOURCE COMMIT
        →
EXACT BUILD
        →
EXACT DEPLOYMENT
```

* Discovery Evidence and Implementation Evidence remain separate.
* PO verification is independent from engineering PASS.

## 31. Traceability Matrix

The Master Specification is traceable across:

* Product Charter V5.1
* Database Schema V0.1
* State Machines V0.1
* Firestore Query Cost Budget V0.1
* Locked Product Discovery modules
* Applicable KIM CHỈ NAM governance rules
* Recorded PO Decisions

## 32. Master Specification Gate / Approval

* **Current Status:** `DRAFT V0.1 — READY FOR PO REVIEW`
* **Application Code:** NOT STARTED / NO APPLICATION CODE CHANGED
* **Build:** NOT APPLICABLE
* **Deploy:** NOT APPLICABLE
* **PO Verification:** NO
* **PROTECTED:** NO
* **LOCKED:** NO
* **Next Gate:** PO review and formal `PO_VERIFIED`

### Approval Rule

The Master Specification may enter `PO_VERIFIED` only by an explicit PO decision recorded according to governance rules.

Until that explicit decision exists, the document remains:

```text
DRAFT V0.1 — READY FOR PO REVIEW
```
