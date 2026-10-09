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
| Clean Rebuild A2 Foundation (Store Operations & Account Management) | `PO_VERIFIED / PROTECTED / LOCKED` | PROMPT-176 to PROMPT-194: One App Dual Entry, Real Firebase Phone Auth, Session Restoration, Membership Lifecycle, Staff Management, Device Binding, 6-char Store Code, and Firestore Security Rules (DEC-2026-FNB-SMART-ONE-APP-DUAL-FLOWS) |
| Governance Reconciliation V5.1 (Prompt 111) | `READY FOR PO APPROVAL` | Prompt 111: Governance Identity Model, Prompt 101 collision resolution, A6/A7/A8 reconciliation, Closure sequence enforcement |
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

## 4. Master Specification Gate — Remote Evidence Snapshot (2026-10-09)

- **Four V5.1 technical contracts:** Present under `99_ARCHIVE_SOURCE/` on canonical `main`; verified source blob SHAs preserved.
- **Clean Rebuild Master Specification:** `99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`, status `DRAFT — READY FOR PO REVIEW`; not PO_VERIFIED.
- **V5.2 prepaid employee billing:** Draft addendum exists at `99_ARCHIVE_SOURCE/WI-PREPAID-EMPLOYEE-BILLING-01_SPECIFICATION_ADDENDUM_V5.2.md`; not approved for implementation.
- **Prepaid trial threshold:** Explicit PO direction (100 successful commercial orders, excluding 5 test orders) recorded in PO Decision Register; runtime order-count evidence is separate.
- **Low-wallet warning Decision 2:** OPEN / PENDING PO DECISION (trigger, channel, frequency, duplicate suppression).
- **Gate verdict:** `INCOMPLETE — BLOCKED ON FORMAL PO REVIEW/APPROVAL AND OPEN DECISION 2`.
- **Application code changes:** NONE.
- **Canonical NEXT:** `CLEAN REBUILD MASTER SPECIFICATION` (unchanged).
- **Evidence:** `03_EVIDENCE/GOV-MASTER-SPEC-RECONCILIATION-01_2026-10-09.md`.
