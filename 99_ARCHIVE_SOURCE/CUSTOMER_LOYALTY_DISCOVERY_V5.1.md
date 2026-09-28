# F&B SMART V5.1 — CUSTOMER PROFILE & DEBT LEDGER PRODUCT DISCOVERY (PROMPT 107 FINAL BOUNDARY)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 107 Final Boundary)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `READY FOR PO_VERIFIED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## 1. OBJECTIVE & PO CONFIRMED RULES (PROMPT 107)
Per PO Tuấn's formal confirmation under Prompt 107, the final debt repayment boundaries are locked as follows:

1. **No Overpayment Rule (Không được trả quá số nợ):**
   - Repayment amount cannot exceed the current outstanding debt balance. The system must block overpayments to prevent negative debt (`Còn nợ < 0`). Any excess cash tendered by the customer is handled via standard cash change rules, not applied to debt.
2. **QR Repayment Server Verification (Trả nợ bằng QR):**
   - QR debt repayment strictly follows server final authority: `Select QR repayment → Generate QR transaction → Guest pays → Server webhook verifies success → Update Repaid → Decrease Outstanding Debt`. Client apps never self-declare QR payment success.
3. **Cash Repayment & Cash Drawer Impact:**
   - Cash debt repayment increases physical cash in the shift cash drawer (`Tiền mặt tăng trong két`).
   - **Crucial Separation:** Debt repayment represents **debt recovery** (`Thu hồi công nợ`), **NOT** new sales revenue (`Doanh thu bán hàng mới`). Reports (A7) and Shift (A6) must strictly separate Net Sales from Debt Recovery.
4. **Partial vs Full Repayment:**
   - Supports partial repayment (e.g. Owed 800k, pays 300k, remaining 500k) or full repayment. Historical repayment audit logs are immutable and never deleted.
5. **Store-Scoped Debt Ledger:**
   - Customer debt belongs strictly to the specific Store (`Store-scoped`). Store A debt is never visible or collectible by Store B.
6. **LEGO Permissions:**
   - Requires explicit capabilities (`View Customer Debt`, `Record Debt`, `Repay Debt`, `View Repayment History`) effective immediately per Prompt 071.

---
*End of Customer Profile & Debt Ledger Discovery V5.1 (Prompt 107 Final Boundary)*
