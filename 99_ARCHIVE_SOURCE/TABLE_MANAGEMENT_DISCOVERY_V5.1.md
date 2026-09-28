# F&B SMART V5.1 — TABLE MANAGEMENT & PAYMENT OPERATING MODEL (PROMPT 090/092 PO CONFIRMED)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (PO Confirmed)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `PO CONFIRMED — PROTECTED & LOCKED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`

---

## 1. OBJECTIVE & PO CONFIRMED OPERATING MODEL
Per PO Tuấn's formal confirmation, the Table & Payment operating lifecycle is locked as follows:

---

## PART A — TABLE & ORDER LIFECYCLE (CHỐT - TWO ENTRY PATHS)
1. **Table Entry Flow:**
   From **BÀN TRỐNG (Available)**, there are two distinct entry paths:
   ```text
   BÀN TRỐNG
   ├── 1. ĐẶT TRƯỚC (Reservation - Optional Branch)
   │    └── Khách đến ──> Vào bàn / Gọi món
   │
   └── 2. KHÁCH ĐẾN TRỰC TIẾP (Walk-in - Direct Branch)
        └── Vào bàn / Gọi món
   ```
   *Rule:* `ĐẶT TRƯỚC` is an **optional booking feature**, NOT a mandatory step before entering a table.

2. **Seated Table Lifecycle:**
   $$\text{VÀO BÀN} \longrightarrow \text{GỌI MÓN / PHỤC VỤ} \longrightarrow \text{THANH TOÁN} \longrightarrow \text{CHỜ DỌN (Cleaning)} \longrightarrow \text{DỌN XONG} \longrightarrow \text{BÀN TRỐNG}$$

---

## PART B — PAYMENT BY TABLE / ORDER & MULTI-STAFF COLLECTION
1. **Payment Scope:** Executed against the **total amount of the table/order**, not rigidly tied to individual items.
2. **Multiple & Partial Collections:** Allows collecting payments multiple times (e.g., Total 80k $\rightarrow$ Collect 50k $\rightarrow$ Remaining 30k $\rightarrow$ Collect 30k). Every collection records the operator, timestamp, amount, and tender method.
3. **Multi-Staff Collection:** Multiple staff members with payment permission (waitstaff, cashier, head chef, owner, etc.) can collect payments for the same table. The system records who collected how much, when, and how.

---

## PART C — POST-PAYMENT & "CHỜ DỌN" (CLEANING) DYNAMIC
1. **Paid ≠ Empty Table:** When fully paid, the table transitions to `CHỜ DỌN` (Cleaning). Direct transition from `Đang phục vụ` (Occupied) to `Bàn trống` (Available) immediately after payment is prohibited.
2. **Additional Ordering during Cleaning ("Chờ dọn nhưng gọi thêm"):** If guests are still seated at a table in `CHỜ DỌN` and call for more items:
   $$\text{Chờ dọn} \longrightarrow \text{Gọi thêm món} \longrightarrow \text{Đang phục vụ}$$
   - Additional items create supplementary order rounds while preserving prior payment history.
3. **Table Closure:** Returns to `Bàn trống` only after staff confirms cleaning is finished (`Chờ dọn → Dọn xong → Bàn trống`).

---
*End of Table Management & Payment Operating Model Discovery V5.1*
