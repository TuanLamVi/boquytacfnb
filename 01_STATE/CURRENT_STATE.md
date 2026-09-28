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
| Master Specification Gate V5.1 (Prompt 118) | `DRAFT V0.1 — COMMITTED & SYNCED / READY FOR PO REVIEW` | Prompt 118: Clean Rebuild Master Specification V5.1 Draft V0.1 committed and synchronized to GitHub (`99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`). Full provenance restored (Commit `355bf92`). Status: DRAFT — READY FOR PO REVIEW. No app code written. |
| Governance Implementation V5.1 (Prompt 114) | `PO_VERIFIED / PROTECTED` | Prompt 114: Implemented Work Item ID vs Prompt ID separation, Prompt uniqueness & collision handling, Standard Prompt Header, Closure Sequence with mandatory Regression Check (N/A for discovery), Discovery vs Implementation Evidence separation, History Preservation, and Repository Source of Truth enforcement. |
| Shift Management & Cash Drawer V5.1 (A6) | `PO_VERIFIED / PROTECTED / LOCKED` | Prompts 089/094/095/096/101: A6 Shift Management & Cash Drawer rules (DEC-2026-A6-SHIFT) |
| Customer Profile & Debt Ledger V5.1 | `READY FOR PO_VERIFIED` | Prompt 107 Final Boundary: No overpayment rule (`Còn nợ < 0` blocked), Server-verified QR debt repayment, Cash repayment increasing shift cash drawer without sales revenue inflation, Store-scoped debt ledger |
| Reports & Analytics V5.1 | `FINAL CONFIRMED / READY FOR PO_VERIFIED` | Prompt 099 Final Correction & Prompt 112 Audit Reconciliation: Revenue formula (`Tạm tính - Giảm giá`), `Đã thu ≠ Ghi nợ`, Cash drawer formula synced with A6, Excel/PDF & COGS deferred. Discrepancy in Prompt 111 resolved (Not locked yet). |
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
