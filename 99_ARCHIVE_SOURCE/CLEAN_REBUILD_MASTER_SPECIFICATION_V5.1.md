# F&B SMART V5.1 — CLEAN REBUILD MASTER SPECIFICATION

## 1. Document Control
- **Document Title:** F&B Smart V5.1 — Clean Rebuild Master Specification
- **Version:** DRAFT V0.1
- **Status:** DRAFT — READY FOR PO REVIEW
- **Build Mode:** CLEAN_REBUILD
- **Primary Work Item:** MASTER-SPECIFICATION-GATE
- **Prompt ID:** PROMPT-120
- **Author:** Architecture Governance & Product Team
- **Source Authority:** KIM CHỈ NAM, PO Decisions, Four V5.1 Contracts (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`), and Locked Product Discovery modules.

---

## 2. Product Purpose & Vision
F&B Smart V5.1 is a next-generation, multi-tenant SaaS POS and restaurant management suite built clean from scratch. It delivers robust real-time operations, strict tenant and store data isolation, uncompromising financial integrity, multi-staff collection, flexible shift management, and seamless offline-online boundary resilience.

---

## 3. Clean Rebuild Scope (MVP Core)
The scope encompasses the complete end-to-end lifecycle for F&B Smart V5.1 MVP:
- Tenant & Store provisioning, multi-store staff membership.
- Staff authentication (Phone + OTP), mandatory **Firebase Auth + App Check** security.
- Granular Lego Capability Permissions (Store-scoped, effective immediately).
- 20 Business Models and Quick Setup Menu cloning.
- Table Management (Floor plan, Zones, Table states: `available → occupied → cleaning → available`).
- Table Merge (non-destructive) & Table Transfer (`occupied → cleaning → available`).
- POS Ordering (Cart grouping, size, structured toppings `[-] N [+]`, product options, kitchen dispatch rounds).
- Kitchen Operations (KDS ticket routing, state flow `queued → acknowledged → preparing → ready → served`, independent of payment).
- Return Line & Refund Protocol (R1/R2/R3 return line request/approval, ReturnTickets to kitchen, full invoice reversals, cash/bank refund obligations).
- Checkout & Payment (Cash, payOS QR webhook verification, Split payment, Debt Lite, 3-layer payment attempt/allocation/settlement, discounts).
- Unallocated Funds (F1/F2/F3 unallocated funds for late/unclassified incoming payments, allocation to invoices, or bank refund).
- Payment Adjustments & Physical Cash Movement (Settlement consumption, reversal/replacement, shift-open vs shift-closed cash deltas).
- Shift Management & Cash Drawer (Shift lifecycle `open → closing → closed`, ShiftLock, opening cash immutability, physical cash isolation, close shift blocking).
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
- **Mandatory Security Baseline:** Every operational command requires verified **Firebase Auth** token and **App Check** token. Client applications cannot perform direct business/financial database writes bypass backend command validators.

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

## 15. Checkout / Payment
- Checkout UX supporting Cash, payOS QR (server webhook verified), Split Payment, and Debt Lite.
- 3-layer architecture: PaymentAttempt → Allocation → Settlement.
- Simple item/order level discounts with strict precedence rules.

---

## 16. Return Line, Item Void, Invoice Reversals & Refunds (MVP Scope)
- **Return Line Workflow:** `requestReturn` (`pending_approval`) → `approveReturn` (`applied`) / `rejectReturn` (`rejected`).
- **Return Tickets:** Approved return lines for items already in kitchen dispatch generate ReturnTickets sent to kitchen stations.
- **Full Invoice Reversal (`reverseInvoice`):** Atomically consumes active settlements, creates reversal negative invoices/lines, releases debt outstanding, and creates RefundObligations.
- **Refund Obligations & Completion:** `completeCashRefund` (completes cash refund against open shift cash drawer), `beginBankRefundAttempt` / `completeBankRefund` (bank/QR asynchronous refund).

---

## 17. Shift & Cash Drawer
- Shift lifecycle (`closed → open → closing → closed`), guarded by active `ShiftLock`.
- Expected Cash Formula: $\text{Opening} + \text{Physical Cash Collected} + \text{Cash In} - \text{Cash Out} - \text{Drops} \pm \text{Adjustments}$.
- Physical cash isolation: QR, debt, and uncollected balances never enter the physical cash drawer.
- Opening cash is immutable post-opening; closing shifts are blocked by pending payment attempts or active orders.

---

## 18. Customer Profile & Debt Ledger
- Store-scoped customer profile and debt ledger.
- Debt Origination & FIFO Collection: `allocateDebt` creates DebtOrigination; `collectDebt` reads open originations FIFO (up to 50) and allocates repayments.
- Debt repayment workflow: Cash/QR repayment, preventing negative debt balance (`Còn nợ < 0` blocked), server verified, cash repayment increases shift cash drawer without double-counting sales revenue.

---

## 19. Unallocated Funds (MVP Scope)
- **State Machine:** `unallocated → partially_allocated → allocated`; refund branch `unallocated|partially_allocated → refund_pending → refunded`.
- **`createUnallocatedFund` (F1):** Records incoming bank/QR funds received without an immediate invoice link.
- **`allocateUnallocatedFund` (F2):** Allocates unallocated fund balance to unpaid/partially-paid invoices.
- **`requestUnallocatedFundRefund` (F3):** Initiates refund obligation for unallocated funds.

---

## 20. Payment Adjustments & Physical Cash Movement
- **`adjustPayment`:** Reclassifies payment tender method by consuming Active Settlement and creating reversal/replacement Settlements.
  - Original Shift Open: Updates shift adjustment nets, creates correction CashEntry if cash delta $\neq 0$.
  - Original Shift Closed: Reclassifies financial ledger without modifying closed shift. Cash delta movement created in current open shift via `recordAdjustmentCashMovement`.

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

## 22. Offline Boundary & Local Outbox
- Read operations supported via cached local storage.
- Outbox pattern for queued offline mutations using `mutationId` and receipt document canonicalization.
- **Financial Settlement:** Strictly `ONLINE-REQUIRED` with Server Final Authority. Clients cannot self-declare financial success offline.

---

## 23. Financial Invariants
- Payment is independent of KDS readiness.
- `Còn phải thu ≠ Nợ` (`Partial Payment ≠ Debt`).
- Debt is a deliberate store decision.
- Physical cash isolation for shift cash drawers.
- Immutable post-invoice history.

---

## 24. Precise Operational State Machines

### 24.1 Table State Machine
- States: `available`, `occupied`, `cleaning`.
- T1: `available` $\xrightarrow{\text{openTableOrder}}$ `occupied`.
- T2: `occupied` $\xrightarrow{\text{cancelDraftOrder}}$ `cleaning`.
- T3A/B: `occupied` $\xrightarrow{\text{postInvoice / confirmPayment}}$ `cleaning`.
- T4: `cleaning` $\xrightarrow{\text{markTableClean}}$ `available`.

### 24.2 Order & Checkout Fence Machine
- States: `active_unfenced`, `active_fenced`, `finalized`, `closed`, `cancelled`.
- O1: `active_unfenced` $\xrightarrow{\text{beginCheckout}}$ `active_fenced`.
- O2: `active_fenced` $\xrightarrow{\text{cancelCheckout}}$ `active_unfenced`.
- O3: `active_fenced` $\xrightarrow{\text{postInvoice (unpaid)}}$ `finalized`.
- O4: `finalized` $\xrightarrow{\text{confirmPayment (paid)}}$ `closed`.
- O5: `active_unfenced` $\xrightarrow{\text{cancelDraftOrder}}$ `cancelled`.
- O6: `active_fenced` $\xrightarrow{\text{postInvoice (zero-total)}}$ `closed`.

### 24.3 Sale Line Machine
- States: `draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`.
- L1: Add line $\rightarrow$ `draft`.
- L2: `submitKitchen` $\rightarrow$ `submitted` / `served`.
- L3A/B: Adjust / Cancel draft line $\rightarrow$ `draft` / `draft_cancelled`.
- L4: KDS Ticket transition $\rightarrow$ `preparing` $\rightarrow$ `ready` $\rightarrow$ `served`.

### 24.4 Return Line Machine
- States: `pending_approval`, `applied`, `rejected`.
- R1: `requestReturn` $\rightarrow$ `pending_approval`.
- R2: `approveReturn` $\rightarrow$ `applied`.
- R3: `rejectReturn` $\rightarrow$ `rejected`.

### 24.5 Kitchen Ticket Machine
- States: `queued → acknowledged → preparing → ready → served`.
- Return Tickets: `queued → acknowledged → served`.

### 24.6 Shift State Machine
- States: `closed → open → closing → closed`.
- S1: `openShift` $\rightarrow$ `open`.
- S2: `startClosingShift` $\rightarrow$ `closing`.
- S3: `closeShift` $\rightarrow$ `closed`.

### 24.7 PaymentAttempt & Invoice Projection
- Attempt states: `pending_confirmation`, `success`, `expired`, `cancelled`.
- Invoice projections: `unpaid`, `partially_paid`, `paid`, `reversed`.

### 24.8 Unallocated Fund State Machine
- States: `unallocated → partially_allocated → allocated`; refund branch `unallocated|partially_allocated → refund_pending → refunded`.

---

## 25. Data Model / Schema Rules
- Governed strictly by `DATABASE_SCHEMA_V0.1.md` (Tenants, Stores, Users, Memberships, Tables, Orders, OrderLines, Payments, Shifts, Customers, DebtLedger, UnallocatedFunds, DebtOriginations).

---

## 26. Firestore Query / Cost Constraints
- Governed strictly by `FIRESTORE_QUERY_COST_BUDGET_V0.1.md` (bounded reads, indexing rules, cost caps).

---

## 27. Security & Tenant Isolation
- **Firebase Auth + App Check** mandatory on all calls.
- Security rules enforce store-scoped membership capabilities and backend-only financial writes.

---

## 28. Error / Retry / Idempotency
- UUID idempotency tokens required. Receipt documents canonicalize plaintext envelopes and enforce `mutationId` deduplication.

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
