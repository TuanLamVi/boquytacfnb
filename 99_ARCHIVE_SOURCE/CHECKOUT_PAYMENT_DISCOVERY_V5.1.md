# F&B SMART V5.1 — CHECKOUT & PAYMENT PRODUCT DISCOVERY (PROMPT 091 PO CONFIRMED)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 091 PO Confirmed)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `PO CONFIRMED (PROMPT 091)`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`

---

## 1. OBJECTIVE & PO CONFIRMED DECISIONS (PROMPT 091)
Per PO Tuấn's formal confirmation under Prompt 091, the Partial Collection & Debt Boundary rules are locked as follows:

---

## PART A — CÒN PHẢI THU vs GHI NỢ (REMAINING BALANCE vs DEBT)
1. **Core Distinction (`CÒN PHẢI THU ≠ NỢ`):**
   - **Còn phải thu (Remaining Balance):** Simply means the total table/order bill has not yet been fully collected. Guests can make further payments later. It is **NEVER** automatically classified as Debt.
   - **Partial Payment (`Partial Payment ≠ Debt`):** Refers strictly to collecting payment in multiple installments or tenders for the same table/order.
2. **Explicit Debt Recording:** An uncollected balance transitions to Debt **only when the store explicitly agrees to extend credit** to the patron:
   $$\text{Còn phải thu} \longrightarrow \text{Ghi nợ khách (Ghi nợ hợp lệ)} \longrightarrow \text{Sổ nợ}$$

---

## PART B — MULTI-STAFF COLLECTION & MULTI-TENDER SUPPORT
1. **Multi-Staff Collection:** Any staff member with payment Lego permission can collect payments for a table (e.g. Staff A collects 150k Cash, Staff B collects 200k QR, Owner collects 100k Cash).
2. **Audit Logging:** Every collection attempt records operator ID, timestamp, amount, tender method, and table/order reference.
3. **Multi-Tender Combinations:** Supports Cash + QR, Cash + Cash, QR + Cash, Cash + Debt, etc.

---

## PART C — CHECKOUT UX DISPLAY
- **POS Checkout View:** Displays clear, real-time financial breakdown:
  ```text
  Tạm tính (Subtotal)
  - Giảm giá (Discounts)
  ─────────────────────────────────
  THÀNH TIỀN (Total Bill)

  Đã thu (Collected Amount)
  CÒN PHẢI THU (Remaining Balance)
  ```
- **Action Buttons:** `[Tiền mặt]`, `[payOS QR]`, `[Chia thanh toán]`, `[Ghi nợ]`.

---

## PART D — SHIFT CASH DRAWER IMPACT (A6 SHIFT)
- **Physical Cash Only:** Only **actual physical cash collected** affects the cashier shift cash drawer float.
- **Exclusions:**
  - payOS QR receipts do NOT enter physical cash drawer.
  - `Còn phải thu` (Remaining balance) is NOT cash in drawer.
  - `Ghi nợ` (Debt tabs) is NOT cash in drawer.

---
*End of Checkout & Payment Discovery V5.1 (Prompt 091)*
