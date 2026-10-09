# F&B SMART V5.1 — CLEAN REBUILD MASTER SPECIFICATION

## 1. Document Control
- **Document Title:** F&B Smart V5.1 — Clean Rebuild Master Specification
- **Version:** V0.1
- **Status:** PO_VERIFIED / APPROVED / PROTECTED / LOCKED
- **Build Mode:** CLEAN_REBUILD
- **Primary Work Item:** MASTER-SPECIFICATION-GATE
- **Prompt ID:** PROMPT-116
- **Author:** Architecture Governance & Product Team
- **Source Authority:** KIM CHỈ NAM, PO Decisions, Four V5.1 Contracts (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`), and Locked Product Discovery modules.

---

## 2. Product Purpose & Vision
F&B Smart V5.1 is a next-generation, multi-tenant SaaS POS and restaurant management suite built clean from scratch. It delivers robust real-time operations, strict tenant and store data isolation, uncompromising financial integrity, multi-staff collection, flexible shift management, and seamless offline-online boundary resilience.

---

## 3. Clean Rebuild Scope
The scope encompasses the complete end-to-end lifecycle for F&B Smart V5.1:
- Tenant and Store provisioning & multi-store staff membership.
- Staff authentication (Phone + OTP) and Lego Capability Permissions.
- 20 Business Models and Quick Setup Menu cloning.
- Table Management (Floor plan, Zones, Table states: `available → occupied → cleaning → available`).
- Table Merge (non-destructive) & Table Transfer (`occupied → cleaning → available`).
- POS Ordering (Cart grouping, size, structured toppings `[-] N [+]`, product options, kitchen dispatch rounds).
- Kitchen Operations (KDS ticket routing, state flow `queued → acknowledged → preparing → ready → served`, independent of payment).
- Checkout & Payment (Cash, payOS QR webhook verification, Split payment, Debt Lite, 3-layer payment attempt/allocation/settlement, discounts).
- Shift Management & Cash Drawer (Shift lifecycle, opening cash immutability, physical cash isolation, close shift blocking).
- Customer Profile & Debt Ledger (Store-scoped debt ledger, secure debt repayment, preventing negative balances).
- Reports & Analytics (Today's summary, Revenue formula `Subtotal - Discounts`, `Collected ≠ Debt`, Cash drawer A6 sync, deferred Excel/PDF & COGS).

---

## 4. Non-Goals / Out of Scope
- Legacy patch chain (Legacy codebase is permanently frozen as Read-Only Forensic Reference).
- Complex third-party integrations not confirmed for MVP (e.g., Zalo/ZaloPay are classified as Future / Optional integration awaiting PO decision).
- Multi-currency / internationalization (VND currency is fixed for V5.1 MVP).

---

## 5. System Actors
1. **Customer:** Orders via staff/QR, pays bill, maintains store credit/debt ledger.
2. **Waitstaff:** Opens tables, takes orders, dispatches to kitchen, handles table merge/transfer.
3. **Cashier / Checkout Staff:** Collects payments, splits bills, handles partial payments and debt recording, manages cash drawer.
4. **Kitchen Staff (Chef):** Operates KDS screen, acknowledges, prepares, and marks items ready/served.
5. **Store Owner / Manager:** Manages store configuration, menu, staff memberships, Lego permissions, shift handovers, and reports.
6. **Tenant Superadmin:** Manages tenant settings, multi-store creation, and top-level governance.

---

## 6. Tenant / Store / Membership Model
- **Tenant:** Top-level multi-tenant container isolating enterprise entities.
- **Store:** Operational storefront / branch under a tenant.
- **Membership:** Users (Staff) may hold memberships across multiple stores (Multi-Store staff support). Each store membership maintains independent role/permission assignments.

---

## 7. Identity & Authentication
- Authentication is governed by Phone number + OTP credentials via Firebase Auth / Credential Manager.
- Customer phone identifiers are strictly separated from staff login accounts.

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
- State Machine: `available → occupied → cleaning → available`.
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

## 16. Shift & Cash Drawer
- Shift lifecycle (Open, Cash-in/out, Handover, Close).
- Expected Cash Formula: $\text{Opening} + \text{Physical Cash Collected} + \text{Cash In} - \text{Cash Out} - \text{Drops} \pm \text{Adjustments}$.
- Physical cash isolation: QR, debt, and uncollected balances never enter the physical cash drawer.
- Opening cash is immutable post-opening; closing shifts are blocked by active orders or pending payments.

---

## 17. Customer & Debt Ledger
- Store-scoped customer profile and debt ledger.
- Debt repayment workflow: Cash/QR repayment, preventing negative debt balance (`Còn nợ < 0` blocked), server verified, separated from new sales revenue.

---

## 18. Reports & Analytics
- Dashboard summary ("Tổng quan hôm nay"):
  - Doanh thu bán hàng = Tạm tính - Giảm giá.
  - Đã thu = Actual payment received (Cash + payOS QR). Excludes Debt.
  - Ghi nợ = Customer credit total.
  - Còn phải thu = Uncollected table balance (`Còn phải thu ≠ Nợ`).
  - Tiền mặt trong két = Synced with A6 formula.
- Deferred to Post-MVP: Excel/PDF export and COGS/Profit margin reports.

---

## 19. Offline Boundary
- Read operations supported via cached local storage.
- Outbox pattern for queued offline mutations.
- **Financial Settlement:** Strictly `ONLINE-REQUIRED` with Server Final Authority.

---

## 20. Financial Invariants
- Payment is independent of KDS readiness.
- `Còn phải thu ≠ Nợ` (`Partial Payment ≠ Debt`).
- Debt is a deliberate store decision.
- Physical cash isolation for shift cash drawers.
- Immutable post-invoice history.

---

## 21. State Machines
- **Table State Machine:** `available` ⇄ `occupied` → `cleaning` → `available`.
- **Order State Machine:** `draft` → `dispatched` → `preparing` → `served` → `checkout` → `paid` / `closed`.
- **KDS State Machine:** `queued` → `acknowledged` → `preparing` → `ready` → `served`.
- **Shift State Machine:** `closed` → `open` → `handover_pending` → `closed`.
- **Payment State Machine:** `initiated` → `attempted` → `allocated` → `settled` / `failed`.

---

## 22. Data Model / Schema Rules
- Governed strictly by `DATABASE_SCHEMA_V0.1.md` (Tenants, Stores, Users, Memberships, Tables, Orders, OrderLines, Payments, Shifts, Customers, DebtLedger).

---

## 23. Firestore Query / Cost Constraints
- Governed strictly by `FIRESTORE_QUERY_COST_BUDGET_V0.1.md` (bounded reads, indexing rules, cost limits).

---

## 24. Security / Tenant Isolation
- Firestore Security Rules enforce tenant and store isolation, preventing cross-tenant data leaks and unauthorized capability access.

---

## 25. Error / Retry / Idempotency
- Idempotency UUIDs required for payment attempts and kitchen dispatches. Server final authority on all financial reconciliation.

---

## 26. Integration Boundaries
- **payOS:** Core MVP payment gateway with webhook verification.
- **Zalo / ZaloPay:** Classified as `FUTURE / OPTIONAL INTEGRATION — PO DECISION REQUIRED`. (Not part of Core MVP).

---

## 27. Acceptance Test Strategy
- Requirements mapped to Acceptance Criteria and Test Scenarios.
- Strict separation between Discovery Evidence and Implementation Evidence.

---

## 28. Evidence / Provenance / Audit
- Provenance Principle: `EXACT SOURCE COMMIT → EXACT BUILD → EXACT DEPLOYMENT`.

---

## 29. MVP / Deferred / Future Boundary
- **MVP Core:** Core POS, Table Management, KDS, Checkout, Shift, Debt Ledger, Reports.
- **Deferred / Post-MVP:** Excel/PDF export, COGS/Profit, advanced seafood/buffet pricing.
- **Future / Optional:** Zalo/ZaloPay integrations.

---

## 30. Traceability Matrix
- Maintained across all locked Discovery modules and V5.1 contracts.

---

## 31. Open Questions / PO Decisions Required
- None pending for Master Specification Draft review.

---

## 32. Master Specification Gate / Approval
- **Status:** PO_VERIFIED / APPROVED / PROTECTED / LOCKED
- **PO Approval Date:** 2026-10-09
- **Approval Evidence:** `03_EVIDENCE/MASTER-SPEC-PO-APPROVAL-2026-10-09.md`
- **Approved Scope:** Full F&B SMART V5.1 Clean Rebuild Master Specification and its four baseline contracts: Product Charter V5.1, Database Schema V0.1, State Machines V0.1, and Firestore Query Cost Budget V0.1.
- **Boundary:** This approval approves the V5.1 specification baseline. It does not claim that all application code has been implemented, built, deployed, or runtime-tested. Individual implementation work still requires its own authorized Work Item and evidence.
- **Protection:** Protected and locked as the approved V5.1 specification baseline. Any later change must follow the governance change process and explicit PO decision.
- **Next:** V5.2 prepaid wallet specification finalization and separate PO approval. The V5.2 addendum and low-wallet warning Decision 2 are not approved/closed by this V5.1 decision.
