# F&B SMART V5.1 — REPORTS & ANALYTICS PRODUCT DISCOVERY (PROMPT 099 FINAL CORRECTION)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 099 Final Correction)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `FINAL DRAFT — READY FOR PO_VERIFIED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## 1. OBJECTIVE & PO CONFIRMED REPORTING RULES (PROMPT 099)
Per PO Tuấn's formal confirmation under Prompt 099, reporting rules are standardized as follows:

1. **Simplified Revenue Formula:**
   $$\text{Tạm tính (Subtotal)} - \text{Giảm giá (Discounts)} = \text{Doanh thu bán hàng}$$
2. **Collected Amount vs Debt (`ĐÃ THU ≠ GHI NỢ`):**
   - Debt recorded (`Ghi nợ`) is **NEVER** added to `Đã thu` (Collected Amount).
   - *Example:* Total Bill 500k (Cash 200k + QR 200k + Debt 100k) $\rightarrow$ **Đã thu:** 400.000đ; **Ghi nợ:** 100.000đ; **Còn phải thu:** 0đ.
3. **Cash Drawer Formula Sync (A6 Locked):**
   $$\text{Tiền dự kiến trong két} = \text{Tiền đầu ca} + \text{Tiền mặt đã thu} + \text{Tiền bổ sung} - \text{Tiền chi} - \text{Tiền nộp} \pm \text{Điều chỉnh}$$
4. **Post-MVP Deferred Features:**
   - Excel/PDF file export is deferred to Post-MVP (on-screen view & receipt printer summary only for MVP).
   - COGS / Profit & Margin reporting is deferred to Post-MVP.

---

## PART A — DASHBOARD "TỔNG QUAN HÔM NAY" UX
1. **At-a-Glance Key Metrics:**
   - **Doanh thu bán hàng:** Tạm tính - Giảm giá.
   - **Đã thu:** Total actual payment received (Cash + QR payOS). Excludes Debt.
   - **Ghi nợ:** Customer credit tab total (`Ghi nợ ≠ Đã thu`).
   - **Còn phải thu:** Uncollected balance on active/unbilled tables (`Còn phải thu ≠ Nợ`).
   - **Tiền mặt trong két:** Calculated via locked A6 formula.
   - **QR payOS:** Digital receipts verified on server (excluded from physical cash drawer).
   - **Bàn & Đơn:** Active serving tables, tables waiting for cleaning (`Chờ dọn`), total orders.
   - **Ca hiện tại:** Expected cash vs Counted cash $\rightarrow$ Variance (`Thiếu` / `Thừa`).

---

## PART B — REVENUE & COLLECTION REPORTS
1. **Revenue Breakdown:** By date, shift, and store. Displays order count, average order value, total discounts, net revenue. Multi-Store data is strictly isolated (`Store A` vs `Store B`).
2. **Collection Breakdown:** Tenders separated into Cash and QR payOS. Debt is tracked separately.

---

## PART C — REMAINING BALANCE vs DEBT LEDGER REPORTS
1. **Báo cáo Còn phải thu (Remaining Balance Report):** Lists active tables/orders with uncollected balances (`Còn phải thu ≠ Nợ`).
2. **Báo cáo Sổ nợ (Debt Ledger Report):** Dedicated customer credit report displaying Customer Name, Total Credit Extended, Total Repaid, Outstanding Balance, and repayment audit logs.

---

## PART D — SHIFT & CASH DRAWER VARIANCE REPORT (A6 LOCKED INTEGRATION)
- **Cash Drawer Audit:** Displays Opening Cash + Physical Cash Collected + Cash In - Cash Out (Expenses) - Drops = Expected Cash.
- **Variance Tracking:** Compares Expected Cash vs Actual Cash Counted, recording shortages (`Thiếu`) or surpluses (`Thừa`). Never alters sales revenue to mask variances.

---

## PART E — STAFF COLLECTION REPORT
- **Factual Audit:** Tracks payment collections per staff member (who collected how much, when, tender method, table/order ID). Provides objective transaction audit trails without automated employee grading.

---

## PART F — PRODUCT & TABLE SALES REPORTS
1. **Product Sales:** Best sellers, sales volume, item revenue, size/topping breakdowns.
2. **Table Usage:** Table turnover count, seated duration, supplementary order rounds, and total revenue per table (`Paid ≠ Table Finished`; table state follows `Occupied → Cleaning → Available`).

---

## PART G — LEGO PERMISSIONS & MULTI-STORE SCOPING
- Access to reporting modules is governed strictly by **Store Membership → LEGO Capability / Permission**.
- Multi-Store scoping ensures Store A data is never leaked to Store B views.

---

## PART H — OFFLINE BOUNDARY & DEFERRED MVP FEATURES
- **Offline Mode:** Displays cached report data flagged as un-synced. Final financial reports require Server Final Authority.
- **Deferred to Post-MVP:** Excel/PDF file export and COGS/Profit margin reporting.

---
*End of Reports & Analytics Discovery V5.1 (Prompt 099 Final Correction)*
