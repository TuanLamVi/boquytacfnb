# F&B SMART V5.1 — STAFF MANAGEMENT & LEGO PERMISSION MODEL PRODUCT DISCOVERY (PROMPT 071 CONFIRMED)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 071 Confirmed)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `PO CONFIRMED (DECISIONS 071-01 & 071-03)`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `EMPLOYEE_ONBOARDING_V1.md`

---

## 1. OBJECTIVE & PO DECISIONS
- **DECISION 071-01 (Multi-Store Staff Confirmed):** A User/staff member is allowed to work at multiple Stores (multiple stores within the same Tenant, or stores of different Tenants via separate Memberships). Each Store has its own independent Membership and Permissions. Permissions at one store do not automatically apply to another store.
- **DECISION 071-03 (Permission Effective Immediately Confirmed):** When the store owner changes a staff member's Lego permissions, the new permissions take effect **immediately** (`Permission effective immediately`). Technical realization is left to Master Specification / Engineering.

---

## PART A — STAFF MANAGEMENT MODEL
F&B Smart V5.1 operates under a strict SaaS Multi-Tenant architecture:
`Tenant → Store → Membership → Role / Permission`

1. **User (Người dùng):** Global authentication identity identified by verified phone number + OTP.
2. **Store Member (Thành viên quán):** A user who has requested and been approved by the store owner to participate in a specific store entity. A user can hold multiple store memberships.
3. **Capabilities / Permissions (Công việc / Quyền):** Granular operational permissions granted to the member like Lego building blocks.

---

## PART B — MULTI-STORE STAFF RULES (DECISION 071-01)
- Each Membership is strictly bound to one Store.
- A User can have multiple Memberships (e.g., Store A1: Service + Cashier; Store A2: Service; Store B1: Kitchen).
- Permissions are strictly isolated per Store.

---

## PART C — PERMISSION EFFECTIVE TIME (DECISION 071-03)
- Owner updates permissions → `Save` → **Permission effective immediately**.

---
*End of Staff Management & Lego Permission Discovery V5.1 (Prompt 071)*
