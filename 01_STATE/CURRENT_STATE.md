# CURRENT STATE — F&B SMART V5

> **Trạng thái chính thức Repository:** 2026-09-28 (Sau khi hoàn tất Work Item Governance Baseline V5.1).
> **Operating Mode:** `CLEAN_REBUILD MODE ACTIVE`
> **Legacy System Status:** `FROZEN / READ-ONLY FORENSIC REFERENCE`

---

## 1. Tổng quan Repository & Mode

- **Repository governance:** `boquytacfnb` / `fnb-smart-v5`
- **Branch chính:** `main`
- **Active Mode:** `CLEAN_REBUILD MODE`
- **Current Workstream:** `F&B SMART V5.1 CLEAN REBUILD`
- **Legacy Application Codebase:** `FROZEN` (Toàn bộ legacy code, database cũ và artifacts cũ bị đóng băng làm Read-Only Forensic Reference).
- **Application Code Changes in current Work Item:** `NONE` (Chỉ cập nhật governance).

---

## 2. Bảng Trạng thái Các Thành phần & Work Items

| Item / Module | Status | Ghi chú & Ranh giới |
|---|---|---|
| Governance Change Proposal V5.1 | `READY FOR PO APPROVAL` | Prompt 110: Governance Change Proposal & Impact Review (Work Item Identity + Closure Integrity + Regression Check enforcement) |
| Shift Management & Cash Drawer V5.1 (A6) | `PO_VERIFIED / PROTECTED / LOCKED` | Prompts 089/094/095/096/101: A6 Shift Management & Cash Drawer rules (DEC-2026-A6-SHIFT) |
| Customer Profile & Debt Ledger V5.1 | `READY FOR PO_VERIFIED` | Prompt 107 Final Boundary: No overpayment rule (`Còn nợ < 0` blocked), Server-verified QR debt repayment, Cash repayment increasing shift cash drawer without sales revenue inflation, Store-scoped debt ledger |
| Reports & Analytics V5.1 | `FINAL CONFIRMED / READY FOR PO_VERIFIED` | Prompt 099 Final Correction: Revenue formula (`Tạm tính - Giảm giá`), `Đã thu ≠ Ghi nợ`, Cash drawer formula synced with A6, Excel/PDF & COGS deferred |
| A0 Foundation | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A1 Account & Store | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A2-01 Duplicate Join | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A2-02 Staff & Table Map | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A3-01 Money / Int64 | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A3-02 Orders / Order Lines | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A3-03 Logout/Login Recovery | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A3-05 Shift Foundation | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| A3-06 Shift Management UI | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| GP-01 Tenant Rules | `PO_VERIFIED / LOCKED` | Legacy Baseline (Frozen) |
| GOV-025 Closure Rule | `PO_VERIFIED / LOCKED` | Governance Rule |
| GOV-026 Sync Rule | `PO_VERIFIED` | Governance Rule |
| GOV-027 LAW-016 Bridge | `PO_VERIFIED` | Governance Rule |
| GOV-028 LAW-017 Reentry | `PO_VERIFIED` | Governance Rule |
| A6-02 POS Payment UI (Legacy) | `BLOCKED / FIRST FAILURE / LEGACY FROZEN` | Vá luồng cũ bị dừng vĩnh viễn theo DEC-2026-PO-PAYMENT-V5.1 |
| CLEAN_REBUILD_V5.1 | `ACTIVE / DESIGN & RESEARCH` | Clean Rebuild Master UX/UI Blueprint V5.1 & Reference Architecture Library V5.1 completed (Prompts 060 & 061) |

---

## 3. Trọng tâm Vận hành Tiếp theo (NEXT)

```text
CURRENT MODE: CLEAN_REBUILD MODE ACTIVE
LEGACY STATUS: FROZEN
NEXT STEP: CLEAN REBUILD MASTER SPECIFICATION
```

- Không ghi nhận `PO_VERIFIED` cho bất kỳ application code mới nào cho đến khi hoàn thành Master Specification Gate và được PO nghiệm thu.
