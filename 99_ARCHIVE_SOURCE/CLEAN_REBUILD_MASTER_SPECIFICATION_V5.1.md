# F&B SMART V5.1 — CLEAN REBUILD MASTER SPECIFICATION

## 1. Document Control
- **Document Title:** F&B Smart V5.1 — Clean Rebuild Master Specification
- **Version:** DRAFT V0.1
- **Status:** DRAFT — READY FOR PO REVIEW
- **Build Mode:** CLEAN_REBUILD
- **Primary Work Item:** MASTER-SPECIFICATION-GATE
- **Prompt ID:** PROMPT-123
- **Author:** Architecture Governance & Product Team
- **Source Authority:** KIM CHỈ NAM, PO Decisions, Four V5.1 Contracts (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`), and Locked Product Discovery modules.
- **Canonical Remote Repository Path:** `99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (Repository: `TuanLamVi/boquytacfnb`, Branch: `codex/migrate-kim-chi-nam-20260928`).
- **Local Workspace Root Copy:** `docs-123/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (Workspace root copy only, non-canonical remote).

---

## 2. Product Purpose & Vision
F&B Smart V5.1 is a next-generation, multi-tenant SaaS POS and restaurant management suite built clean from scratch. It delivers robust real-time operations, strict tenant and store data isolation, uncompromising financial integrity, multi-staff collection, flexible shift management, and seamless offline-online boundary resilience.

---

## 3. Clean Rebuild Scope (MVP Core)
The scope encompasses the complete end-to-end lifecycle for F&B Smart V5.1 MVP:
- Tenant & Store provisioning, multi-store staff membership.
- Staff authentication (Phone + OTP), mandatory **Firebase Auth + App Check** security baseline.
- Granular Lego Capability Permissions (Store-scoped, effective immediately).
- 20 Business Models and Quick Setup Menu cloning.
- Table Management (Floor plan, Zones, Table states: `available → occupied → cleaning → available`).
- Table Merge (non-destructive via service group references) & Table Transfer (`occupied → cleaning → available`).
- POS Ordering (Cart grouping, size, structured toppings `[-] N [+]`, product options, kitchen dispatch rounds).
- Kitchen Operations (KDS ticket routing, state flow `queued → acknowledged → preparing → ready → served`, independent of payment).
- Return Line & Refund Protocol (R1/R2/R3 return line request/approval, ReturnTickets to kitchen, full invoice reversals, cash/bank refund obligations).
- Checkout & Payment (Cash, payOS QR webhook verification, Split payment, Debt Lite, 3-layer payment attempt/allocation/settlement, discounts, Payment Reference Claim).
- Debt Allocation & Collection (`allocateDebt` DebtOrigination, `collectDebt` FIFO allocation up to 50 originations, DebtAccount balance lifecycle).
- Unallocated Funds (F1 `createUnallocatedFund`, F2 `allocateUnallocatedFund`, F3 `requestUnallocatedFundRefund` for late/unclassified payments).
- Payment Adjustments & Physical Cash Movement (Settlement consumption, reversal/replacement, open-shift vs closing-shift vs closed-shift deltas, `recordAdjustmentCashMovement`).
- Full Invoice Reversals (`reverseInvoice` consuming active settlements, creating negative reversal invoice/lines, releasing debt, generating RefundObligations).
- Shift Management & Cash Drawer (Shift lifecycle `closed → open → closing → closed`, ShiftLock, opening cash immutability, physical cash isolation, close shift blocking).
- Customer Profile & Debt Ledger (Store-scoped debt ledger, debt origination, FIFO collection allocation, preventing negative balances `Còn nợ < 0` blocked).
- Reports & Analytics (Dashboard Today's summary, Revenue formula `Subtotal - Discounts`, `Collected ≠ Debt`, Cash drawer A6 sync, deferred Excel/PDF & COGS).

---

## 4. Non-Goals / Out of Scope
- Legacy patch chain (Legacy codebase is permanently frozen as Read-Only Forensic Reference).
- Complex third-party integrations not confirmed for MVP (e.g., Zalo / ZaloPay are strictly classified as `FUTURE / OPTIONAL INTEGRATION — PO DECISION REQUIRED`).
- Multi-currency / internationalization (VND currency is fixed for V5.1 MVP).
- Full accounting/ERP, LAN-only KDS without internet.

---

## 5. System Actors
1. **Customer:** Orders via staff/QR, pays bill, maintains store credit/debt ledger.
2. **Waitstaff:** Opens tables, takes orders, dispatches to kitchen, handles table merge/transfer, requests return lines.
3. **Cashier / Checkout Staff:** Collects payments, splits bills, handles partial payments and debt recording, manages cash drawer.
4. **Kitchen Staff (Chef):** Operates KDS screen, acknowledges, prepares, and marks items ready/served.
5. **Store Owner / Manager:** Manages store configuration, menu, staff memberships, Lego permissions, shift handovers, approves return lines, adjusts payments.
6. **Tenant Superadmin:** Manages tenant settings, multi-store creation, and top-level governance.
7. **System Principal:** System background actors (`DAILY_SUMMARY_PROJECTOR`, `PAYMENT_EXPIRER`, `CATALOG_RECONCILER`, `FINANCIAL_RECONCILER`).

---

## 6. Tenant / Store / Membership Model
- **Tenant:** Top-level multi-tenant container isolating enterprise entities.
- **Store:** Operational storefront / branch under a tenant.
- **Membership:** Users (Staff) may hold memberships across multiple stores (Multi-Store staff support). Each store membership maintains independent role/permission assignments.

---

## 7. Identity, Authentication & Security Baseline
- Authentication is governed by Phone number + OTP credentials via Firebase Auth / Credential Manager.
- Customer phone identifiers are strictly separated from staff login accounts.
- **Mandatory Security Baseline:** Every operational command requires verified **Firebase Auth** token and **App Check** token. Client applications cannot perform direct business/financial database writes bypassing backend command validators.

---

## 8. Roles / Permissions / LEGO
- Replaces rigid roles with a granular **LEGO Permission Model** (Capability Dictionary).
- Capabilities are assigned per store membership and take effect immediately (`Permission effective immediately`).

---

## 9. Business Models & Menu
- Supports 20 standardized business models (Representative: Cà phê & Bún/Phở).
- System Menu Templates cloned independently per Store.
- Toppings (`[-] N [+]`) support paid/quantity rules. Product Options handle qualitative attributes.

---

## 10. Table Management
- Structured by Area / Floor and Tables.
- Precise State Machine: `available → occupied → cleaning → available`.
- Entry branches from `available`: (1) Walk-in, (2) Advance Reservation (optional).

---

## 11. Table Merge & Transfer
- **Table Merge:** Non-destructive merge preserving original orders via service group references.
- **Table Transfer:** Strict transfer from `occupied → cleaning → available`.
- **Restriction:** Prohibits merge and transfer after checkout has begun or invoice is posted.

---

## 12. POS Ordering
- Fast order entry, category grid, product detail modal, size, quantity-managed toppings, options, and cart item grouping.
- Supports multi-round ordering and kitchen dispatch (`Gửi bếp`).

---

## 13. Order & Order Line
- Immutable line items after kitchen dispatch.
- Managed via service group references for merged tables and round-based ticketing.

---

## 14. Kitchen / KDS
- Station routing, kitchen ticket model, and state flow: `queued → acknowledged → preparing → ready → served`.
- Completely independent of payment gateway (`Ready ≠ Payment Gate`, `Served ≠ Payment Gate`).

---

## 15. Checkout, Payment & Settlement Lifecycle
- Checkout UX supporting Cash, payOS QR (server webhook verified), Split Payment, and Debt Lite.
- 3-layer architecture: PaymentAttempt → Allocation → Settlement.
- Payment Reference Claim prevents reuse of bank/QR transaction references (`SET_PAY_{attemptId}`).
- **Settlement Lifecycle:** Settlements are created once and are strictly immutable (`SET_PAY_{attemptId}` for payment success, `SET_DEBT_{mutationId}` for debt allocation, `SET_FUND_{mutationId}` for fund allocation). Active Settlements represent unconsumed allocations/replacements.
- Simple item/order level discounts with strict precedence rules.

---

## 16. Return Line, Item Void, Invoice Reversals & Refunds (MVP Scope)
- **Return Line Workflow:** `requestReturn` (`pending_approval`) → `approveReturn` (`applied`) / `rejectReturn` (`rejected`).
- **Return Tickets:** Approved return lines for items already in kitchen dispatch generate ReturnTickets sent to kitchen stations.
- **Full Invoice Reversal (`reverseInvoice`):** Atomically consumes active settlements via `SettlementConsumption`, creates reversal negative invoices/lines, releases debt outstanding, and creates RefundObligations using atomic write formula $L + S + F + D + 2R + 2A + U + 5$. Does NOT modify closed order status or table state.
- **Refund Obligations & Attempts:**
  - Cash Refund (`completeCashRefund`): Direct completed attempt against open shift cash drawer (no pending attempt phase).
  - Bank Refund Attempt (`beginBankRefundAttempt`): `requested` $\rightarrow$ `pending`.
  - `cancelBankRefund` & `failBankRefund`: Releases reserved obligation capacity exactly once (`pending` $\rightarrow$ `cancelled` / `failed`).
  - `completeBankRefund`: `pending` $\rightarrow$ `completed`. Original payment method preserved.

---

## 17. Debt Allocation & Collection (MVP Scope)
- **`allocateDebt`:** Invoice sale unpaid/partial, Customer Debt enabled, DebtAccount active, open count < 50. Atomically creates debt Settlement, DebtOrigination (`open`), DebtEntry (positive); updates DebtAccount, Invoice, Shift debt originated; creates two Contribution entries.
- **`collectDebt`:** Reads open originations FIFO (up to 50), creates DebtCollection, DebtCollectionAllocations, negative DebtEntries; updates Originations, DebtAccount balance, Invoice counters, Shift totals, CashEntry or Claim.
- **Origination Lifecycle:** Origination stays `open` if partially collected; transitions to `settled` only when remaining open balance is 0. Settled origination reduces open count exactly once.
- **Invariant:** Collection total equals sum of Allocations; Account balance equals sum of open outstanding originations. Prevent negative balance (`Còn nợ < 0` blocked). Debt collection increases cash drawer without double-counting sales revenue.

---

## 18. Unallocated Funds (MVP Scope)
- **State Machine:** `unallocated → partially_allocated → allocated`; refund branch `unallocated|partially_allocated → refund_pending → refunded`.
- **`createUnallocatedFund` (F1):** Bank/QR payment received without immediate invoice link. Creates UnallocatedFund + PaymentClaim + Contribution.
- **`allocateUnallocatedFund` (F2):** Allocates fund to unpaid/partial invoice. Creates Settlement + FundEntry + reduces Fund + updates Invoice + Contribution.
- **`requestUnallocatedFundRefund` (F3):** Initiates refund obligation for unallocated fund. Complete bank refund creates FundEntry refund and two Contributions.

---

## 19. Payment Adjustments & Physical Cash Movement (MVP Scope)
- **`adjustPayment`:** Consumes an Active Settlement via `SettlementConsumption`, creates PaymentAdjustment, negative reversal Settlement, and positive replacement Settlement.
  - Original Shift Open: Updates shift adjustment nets, creates correction CashEntry if cash delta $\neq 0$.
  - Original Shift Closing: `SHIFT_CLOSING_RETRY_LATER`.
  - Original Shift Closed: Reclassifies financial ledger without modifying closed shift. Cash delta movement created in current open shift via `recordAdjustmentCashMovement`.

---

## 20. Shift & Cash Drawer
- Shift lifecycle (`closed → open → closing → closed`), guarded by active `ShiftLock`.
- Expected Cash Formula: $\text{Opening} + \text{Physical Cash Collected} + \text{Cash In} - \text{Cash Out} - \text{Drops} \pm \text{Adjustments}$.
- Physical cash isolation: QR, debt, and uncollected balances never enter the physical cash drawer.
- Opening cash is immutable post-opening; closing shifts are blocked by pending payment attempts or active orders.

---

## 21. Reports & Analytics
- Dashboard summary ("Tổng quan hôm nay"):
  - Doanh thu bán hàng = Tạm tính - Giảm giá.
  - Đã thu = Actual payment received (Cash + payOS QR). Excludes Debt.
  - Ghi nợ = Customer credit total.
  - Còn phải thu = Uncollected table balance (`Còn phải thu ≠ Nợ`).
  - Tiền mặt trong két = Synced with A6 formula.
- Deferred to Post-MVP: Excel/PDF export and COGS/Profit margin reports.

---

## 22. Offline Boundary, Local Outbox & Receipt Canonicalization
- Read operations supported via cached local storage.
- Outbox pattern for queued offline mutations using `mutationId` and receipt document canonicalization.
- **Financial Settlement:** Strictly `ONLINE-REQUIRED` with Server Final Authority. Clients cannot self-declare financial success offline. Ambiguous timeouts trigger backoff/reconciliation without creating duplicate settlements.

---

## 23. Financial Invariants
- Payment is independent of KDS readiness.
- `Còn phải thu ≠ Nợ` (`Partial Payment ≠ Debt`).
- Debt is a deliberate store decision.
- Physical cash isolation for shift cash drawers.
- Immutable post-invoice history.

---

## 24. Contract-Exact Operational State Machines

### 24.1 Table State Machine
- **States:** `available`, `occupied`, `cleaning`.
- **T1:** `available` $\xrightarrow[\text{Table/Zone active; currentOrderId absent}]{\text{openTableOrder}}$ `occupied`.
- **T2:** `occupied` $\xrightarrow[\text{Order active/unfenced; no submit/ticket/invoice}]{\text{cancelDraftOrder}}$ `cleaning`.
- **T3A:** `occupied` $\xrightarrow[\text{Checkout link; exact lines; Shift open; faceValue=0}]{\text{postInvoice (zero-total)}}$ `cleaning`.
- **T3B:** `occupied` $\xrightarrow[\text{Attempt/Invoice/Shift guards; newAllocated=faceValue}]{\text{confirmPayment (paid)}}$ `cleaning`.
- **T4:** `cleaning` $\xrightarrow[\text{Table active; currentOrderId absent}]{\text{markTableClean}}$ `available`.

### 24.2 Order & Checkout Fence Machine
- **States:** `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.
- **O1:** `active_unfenced` $\xrightarrow[\text{draftCount=0; pendingReturnCount=0; activeLines>0}]{\text{beginCheckout}}$ `active_fenced`.
- **O2:** `active_fenced` $\xrightarrow[\text{invoiceId absent; session match}]{\text{cancelCheckout}}$ `active_unfenced`.
- **O3:** `active_fenced` $\xrightarrow[\text{Shift open; exact lines; faceValue>0}]{\text{postInvoice (unpaid)}}$ `finalized` (Invoice status = `unpaid`).
- **O4:** `finalized` $\xrightarrow[\text{newAllocated=faceValue; pending=0}]{\text{confirmPayment (paid)}}$ `closed`.
- **O5:** `active_unfenced` $\xrightarrow[\text{no submit/ticket/invoice/return}]{\text{cancelDraftOrder}}$ `cancelled`.
- **O6:** `active_fenced` $\xrightarrow[\text{Shift open; faceValue=0}]{\text{postInvoice (zero-total)}}$ `closed`.

### 24.3 Sale Line Machine
- **States:** `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.
- **L1:** N/A $\xrightarrow[\text{Order active/unfenced; catalog active; quantity 1-999}]{\text{addLine}}$ `draft`.
- **L2:** `draft` $\xrightarrow[\text{Expected Order revision; group by station}]{\text{submitKitchen}}$ `submitted` / `served`.
- **L3A:** `draft` $\xrightarrow[\text{Expected Line revision}]{\text{adjustDraftQuantity}}$ `draft`.
- **L3B:** `draft` $\xrightarrow[\text{Expected Line revision}]{\text{cancelDraftLine}}$ `draft_cancelled`.
- **L4:** KDS Ticket transition $\rightarrow$ `preparing` $\rightarrow$ `ready` $\rightarrow$ `served`.

### 24.4 Return Line Machine
- **States:** `pending_approval`, `applied`, `rejected`.
- **R1:** N/A $\xrightarrow[\text{Order active/unfenced; status submitted..served; reason}]{\text{requestReturn}}$ `pending_approval`.
- **R2:** `pending_approval` $\xrightarrow[\text{Approved by manager; order unfenced}]{\text{approveReturn}}$ `applied`.
- **R3:** `pending_approval` $\xrightarrow[\text{Rejected by manager}]{\text{rejectReturn}}$ `rejected`.

### 24.5 Kitchen Ticket Machines
- **Normal Ticket:** `queued → acknowledged → preparing → ready → served`.
- **Return Ticket:** `queued → acknowledged → served`.

### 24.6 Shift & ShiftLock Machine
- **States:** `closed → open → closing → closed`.
- **S1:** `closed` $\xrightarrow[\text{openingCash>=0; device lock free}]{\text{openShift}}$ `open`.
- **S2:** `open` $\xrightarrow[\text{pendingAttemptCount=0; countedCash>=0}]{\text{startClosingShift}}$ `closing`.
- **S3:** `closing` $\xrightarrow[\text{pendingAttemptCount=0}]{\text{closeShift}}$ `closed`.

### 24.7 PaymentAttempt & Invoice Projection Machine
- **Attempt States:** `pending_confirmation`, `success`, `expired`, `cancelled`.
- **P1:** N/A $\xrightarrow[\text{Shift open; invoice unpaid/partial}]{\text{beginPayment}}$ `pending_confirmation`.
- **P2:** `pending_confirmation` $\xrightarrow[\text{Webhook/cash confirmed; shift open}]{\text{confirmPayment}}$ `success`.
- **P3:** `pending_confirmation` $\xrightarrow[\text{User cancel; shift open}]{\text{cancelPaymentAttempt}}$ `cancelled`.
- **P4:** `pending_confirmation` $\xrightarrow[\text{Server time>=expiresAt}]{\text{expirePaymentAttempt}}$ `expired`.
- **Invoice Projections:** `unpaid`, `partially_paid`, `paid`, `reversed`.

### 24.8 Settlement Lifecycle Machine
- **Settlement ID Formats:** `SET_PAY_{attemptId}`, `SET_DEBT_{mutationId}`, `SET_FUND_{mutationId}`.
- **State Transition:** N/A $\xrightarrow[\text{Payment/Debt/Fund success}]{\text{confirmPayment / allocateDebt / allocateFund}}$ `active` $\xrightarrow[\text{adjustPayment / reverseInvoice}]{\text{SettlementConsumption}}$ `consumed`.

### 24.9 Debt Allocation & Collection Machine
- **Allocation:** Invoice unpaid/partial $\xrightarrow[\text{Customer Debt enabled; DebtAccount active; openCount<50}]{\text{allocateDebt}}$ DebtOrigination (`open`).
- **Collection:** Origination (`open`) $\xrightarrow[\text{collectDebt; FIFO up to 50; partial or full}]{\text{collectDebt}}$ Origination (`open` if balance > 0, `settled` if balance == 0).

### 24.10 Unallocated Fund Machine
- **States:** `unallocated → partially_allocated → allocated`; refund branch `unallocated|partially_allocated → refund_pending → refunded`.
- **F1:** N/A $\xrightarrow[\text{Bank/QR payment received; amount>0}]{\text{createUnallocatedFund}}$ `unallocated`.
- **F2:** `unallocated` / `partially_allocated` $\xrightarrow[\text{Invoice sale unpaid/partial}]{\text{allocateUnallocatedFund}}$ `partially_allocated` / `allocated`.
- **F3:** `unallocated` / `partially_allocated` $\xrightarrow[\text{Full remaining amount}]{\text{requestUnallocatedFundRefund}}$ `refund_pending`.

### 24.11 Payment Adjustment Machine
- Active Settlement $\xrightarrow[\text{Invoice paid; method matrix valid; consumption absent}]{\text{adjustPayment}}$ Reversal Settlement (negative) + Replacement Settlement (positive).
- Branching:
  - Original Shift Open: Updates shift adjustment nets, creates correction CashEntry if cash delta $\neq 0$.
  - Original Shift Closing: `SHIFT_CLOSING_RETRY_LATER`.
  - Original Shift Closed: Reclassifies financial ledger without modifying closed shift.
- Cash Delta Movement (Closed Shift): Closed Shift $\xrightarrow[\text{recordAdjustmentCashMovement; current Shift open}]{\text{recordAdjustmentCashMovement}}$ AdjustmentCashMovement in current open shift.

### 24.12 Full Invoice Reversal Machine
- Paid Invoice $\xrightarrow[\text{reverseInvoice; Settlements<=20; Lines<=200; debt <= 50; preflight request-size}]{\text{reverseInvoice}}$ Reversal Invoice + Lines (negative) + RefundObligations. (Formula: $L + S + F + D + 2R + 2A + U + 5$).

### 24.13 Refund Obligation & Attempt Machine
- **Obligation States:** `requested → pending → completed` / `failed`.
- **RF1:** `requested` $\xrightarrow[\text{Shift open; cash drawer sufficient}]{\text{completeCashRefund}}$ `completed` (CashEntry created directly, no pending attempt phase).
- **RF2A:** `requested` $\xrightarrow[\text{Reserve obligation capacity; match original method}]{\text{beginBankRefundAttempt}}$ `pending`.
- **RF2B:** `pending` $\xrightarrow[\text{Bank refund confirmed}]{\text{completeBankRefund}}$ `completed`.
- **RF2C:** `pending` $\xrightarrow[\text{User cancel / bank failure}]{\text{cancelBankRefund / failBankRefund}}$ `cancelled` / `failed` (Releases reserved capacity exactly once).

---

## 25. Data Model & Schema Rules
- Governed strictly by `DATABASE_SCHEMA_V0.1.md` (Tenants, Stores, Users, Memberships, Tables, Orders, OrderLines, Payments, Shifts, Customers, DebtLedger, UnallocatedFunds, DebtOriginations).

---

## 26. Firestore Query & Cost Constraints
- Governed strictly by `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`:
  - Bounded reads, pagination, index governance.
  - General request-size safety target: **< 8 MiB** per transaction payload.
  - Kitchen Ticket payload size target: **<= 500 KiB** per ticket.
  - Planning cost cap budget: **$509.01 USD / month**.

---

## 27. Security & Tenant Isolation
- **Firebase Auth + App Check** tokens mandatory on all API calls.
- Security rules enforce store-scoped membership capabilities and backend-only financial/business writes.

---

## 28. Error / Retry / Idempotency
- UUID idempotency tokens required. Receipt documents canonicalize plaintext envelopes and enforce `mutationId` deduplication. Server final authority on all financial reconciliation.

---

## 29. Integration Boundaries
- **payOS:** Core MVP payment gateway with webhook verification.
- **Zalo / ZaloPay:** Strictly classified as `FUTURE / OPTIONAL INTEGRATION — PO DECISION REQUIRED`. (Not part of Core MVP).

---

## 30. Acceptance Test Strategy & Provenance
- Requirements mapped to Acceptance Criteria and Test Scenarios.
- Provenance Principle: `EXACT SOURCE COMMIT → EXACT BUILD → EXACT DEPLOYMENT`.

---

## 31. Traceability Matrix
- Fully traceable across Product Charter V5.1, Database Schema V0.1, State Machines V0.1, Firestore Query Cost Budget V0.1, and locked Discovery modules.

---

## 32. Master Specification Gate / Approval
- **Status:** DRAFT V0.1 — READY FOR PO REVIEW
- **Next Gate:** Awaiting PO review and formal verification gate (`PO_VERIFIED`).
