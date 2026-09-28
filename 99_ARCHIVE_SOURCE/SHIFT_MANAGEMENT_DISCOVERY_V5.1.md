# F&B SMART V5.1 — SHIFT MANAGEMENT & CASH DRAWER PRODUCT DISCOVERY (PROMPT 095 FINAL CORRECTION)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 095 Final Correction)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `FINAL DRAFT — READY FOR PO_VERIFIED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## 1. OBJECTIVE & PO CONFIRMED RULES (PROMPT 095)
Per PO Tuấn's formal confirmation under Prompt 095, the remaining open shift management rules are locked as follows:

1. **Opening Cash Immutability:** Opening cash (`Tiền đầu ca`) **cannot be edited directly** after the shift has started. Any necessary corrections must be executed via cash in / cash out / adjustment entries, preserving full audit history.
2. **Closing Shift Blocking Rules:** A shift **cannot be closed** while there are active unbilled orders/tables or pending payment transactions. However, **shift handover** (bàn giao ca) to the next team is permitted while orders remain active.
3. **Table Flow Wording Correction:** "Dọn xong" is an **action of confirming cleaning**, NOT a distinct table state:
   $$\text{Đang phục vụ} \longrightarrow \text{Chờ dọn (Cleaning)} \longrightarrow \text{Nhân viên xác nhận đã dọn} \longrightarrow \text{Bàn trống (Available)}$$

---

## PART A — MULTI-STAFF SERVICE & NO FIXED CASHIER
1. **No Fixed Cashier Rule:** A single cashier role is **not** mandatory. Multiple staff members (waiters, floor staff, head chef, sous chef, store owner) who hold the payment LEGO capability can collect payments during the same active shift.
2. **Collection During Active Service:** Payment can be collected multiple times throughout active service for a table/order without waiting for guests to finish dining.
3. **Table/Order Level Collection:** Payments apply against the **total table/order bill**, rather than individual menu items. Each collection records operator ID, timestamp, amount, tender method, and table/order reference.

---

## PART B — MULTI-COLLECTION, MULTI-TENDER & DEBT BOUNDARY
1. **Multi-Collection & Multi-Tender Combinations:**
   - Example: Staff A collects 150k Cash + Staff B collects 200k QR + Staff C collects 100k Cash = Total Collected 450k (`Đã thu`). Remaining balance (`Còn phải thu`): 50k.
2. **Key Principle (`CÒN PHẢI THU ≠ NỢ`):**
   - Uncollected remaining balance (`Còn phải thu`) simply indicates incomplete payment. It is **NEVER** automatically classified as Debt.
   - Debt (`Ghi nợ`) occurs **only** when the store explicitly agrees to extend credit to a patron.

---

## PART C — PHYSICAL CASH DRAWER & TENDER SEPARATION
1. **Shift Cash Drawer Formula:**
   $$\text{Expected Physical Cash} = \text{Opening Cash} + \text{Actual Cash Collected} + \text{Cash In} - \text{Cash Out (Expenses)} - \text{Drops} \pm \text{Adjustments}$$
2. **Physical Cash Isolation:**
   - Cash collections by any authorized staff member increase the store's physical cash drawer float.
   - QR payOS receipts, uncollected remaining balances (`Còn phải thu`), and debt tabs (`Ghi nợ`) do **NOT** enter the physical cash drawer.

---

## PART D — FLEXIBLE SHIFT HANDOVER & CLOSE SHIFT
1. **Shift Handover Optionality:** Shift handover is a situational workflow (e.g. Morning team handing over to Evening team). It is permitted even if orders remain active.
2. **End Shift Cash Count & Variance:**
   $$\text{Variance (Chênh lệch)} = \text{Actual Cash Counted} - \text{Expected Cash}$$
   - Shorts (`Thiếu`) or Surpluses (`Thừa`) are logged immutably. The system **never** auto-corrects sales revenue to mask variances.

---

## PART E — LEGO PERMISSIONS MODEL
- Governed strictly by **Store Membership → LEGO Capability / Permission**:
  - Open Shift, Cash Collection, QR Collection, Debt Recording, Cash Expense, Handover, Cash Count, Close Shift.
- Permission changes take effect **immediately** (`Permission effective immediately` per Prompt 071).

---

## PART F — SCOPE BOUNDARY LOCK
- Shift Management is strictly focused on: **Shift lifecycle + store cash float + cash in/out + cash count + optional handover + close shift**. It does not expand into full corporate ERP, general ledger, or payroll accounting.

---
*End of Shift Management & Cash Drawer Discovery V5.1 (Prompt 095 Final Correction)*
