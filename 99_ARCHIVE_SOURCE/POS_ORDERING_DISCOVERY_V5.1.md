# F&B SMART V5.1 — POS ORDERING & DISPATCH PRODUCT DISCOVERY (PROMPT 078 CONFIRMED)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 078 Confirmed)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `PO CONFIRMED (DECISION-POS-03, POS-04)`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `OFFLINE_CONTRACT`

---

## 1. OBJECTIVE & PO DECISIONS
- **DECISION-POS-03 (Cart Line Grouping Confirmed):** Order lines merge when core attributes match precisely (Product, Size, Topping, Topping quantities, Product Options, Unit Price). If any attribute differs, lines remain separate. Audit trail preserved.
- **DECISION-POS-04 (Offline Boundary Confirmed):** Only operations verified by Offline Contract / Governance as `Offline-Eligible` are permitted offline into Local Outbox. Financial and payment settlement remain strictly online.

---

## PART A — CORRECTED POS ORDERING FLOW
1. **End-to-End Workflow:**
   `Table Map` ──> `Tap Table` ──> `Open Table` ──> `Create / Open Active Order` ──> `POS Menu` ──> `Product Customization` ──> `Cart Review` ──> `Send to Kitchen (KOT/KDS)`.
2. **Concurrency & State:** Table state transitions from `available` to `occupied` upon creating the first order.

---
*End of POS Ordering Discovery V5.1 (Prompt 078)*
