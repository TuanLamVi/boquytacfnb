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
| Clean Rebuild A0 Foundation (Prompt 157 Dual Real Device Build & Real Runtime Verification) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 157 Dual Real Device Verification: Built debug APK from official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` (commit `8e7cc12bac86eb66b398d6aeaab686689593147e`), verified SHA-256 (`6CC0829075BDFDB26044F30D769EF340CE3229CC82D369A0514A972AD597AE18`), installed via ADB on BOTH real Samsung Galaxy M51 (`SM-M515F`, Android 12) AND Samsung Galaxy Note 8 (`SM-N950F`, Android 9), package `com.tuan.fnbsmart`, launch PASS on both devices, Real Firebase `fnb-smart` runtime initialized with App Check debug token, UI verified via screenshots on both devices. |
| Clean Rebuild A0 Foundation (Prompt 156 Application ID Synchronization & Real Runtime) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 156 Application ID Synchronization & Real Runtime: Synchronized Android application ID to `com.tuan.fnbsmart` across build.gradle.kts, AndroidManifest.xml, MainActivity.kt, and namespace. Firebase project `fnb-smart`. Passed `flutter analyze` and `flutter test`. |
| Clean Rebuild A0 Foundation (Prompt 155 Complete Android Source & Validation) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 155 Complete Android Source & Validation: Complete Android source package (`clean_rebuild_v5/android/` with gradlew, wrapper, settings.gradle, build.gradle, app/build.gradle, MainActivity, resources) successfully committed and verified on official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` at commit `62b6166161ae39655c3a7a80c51441d18a00aeac`. Passed `flutter analyze` and `flutter test`. |
| Clean Rebuild A0 Foundation (Prompt 153 Android Foundation & Clone-Ready Source) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 153 Android Foundation & Clone-Ready Source: Official Firebase Project ID = `fnb-smart`. Complete Android foundation (`settings.gradle.kts`, `build.gradle.kts`, `app/build.gradle.kts`, `AndroidManifest.xml`, `MainActivity.kt`, styles, google-services.json) and cleaned `firebase_options.dart` (no fake platform IDs). Verified clone-ready source completeness on official repository. |
| Clean Rebuild A0 Foundation (Prompt 152 Official 'fnb-smart' & Android Foundation) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 152 Official 'fnb-smart' & Android Foundation: Official Firebase Project ID = `fnb-smart` recorded in governance. Complete Android project foundation (`settings.gradle.kts`, `build.gradle.kts`, `app/build.gradle.kts`, `AndroidManifest.xml`, `google-services.json`). applicationId `com.tuan.fnbsmart`. Passed `flutter analyze`, `flutter test`, and debug APK build. |
| Clean Rebuild A0 Foundation (Prompt 151 Real Firebase 'fnb-smart' Configuration) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 151 Real Firebase Project 'fnb-smart' Configuration: Configured real Firebase project 'fnb-smart' via `DefaultFirebaseOptions` (`firebase_options.dart`) and `google-services.json` in Android app binding. Activated real Firebase App Check and Auth abstractions. Pushed to official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` at commit `a1c04a22639f1d2091c67d72f28015918d110b7f`. Passed all unit tests and `flutter analyze`. |
| Clean Rebuild A0 Foundation (Prompt 149 Final Upgraded Real Foundation) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 149 Final Upgraded Real Foundation: Removed all fake auth/app-check backdowns and test fallbacks; implemented recursive deterministic nested canonicalization for Outbox SHA-256 hashing; removed `.dart_tool/` and `build/` from Git tracking on official repository. Pushed to official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` at commit `51fdab1e9f175800fdd936c225693143c7b31406`. Passed all unit tests and `flutter analyze`. Build blocked by missing native Firebase config. |
| Clean Rebuild A0 Foundation (Prompt 148 Upgraded Real Foundation) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 148 Upgraded Real Foundation: Clean Rebuild A0 upgraded with real Firebase Core/Auth/AppCheck abstractions, strict Auth & AppCheck validation, SHA-256 stable request hashing, git hygiene (.gitignore), and rigorous unit tests. Pushed to official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` at commit `0c862a6a8f7e2bc9120e7a656ff662cdd1b3d483`. Passed all unit tests and `flutter analyze`. |
| Clean Rebuild A0 Foundation (Prompt 147 Complete Real Implementation) | `IMPLEMENTATION COMPLETE / READY_FOR_PO_VERIFICATION` | Prompt 147 Complete Real Implementation: Clean Rebuild A0 core foundation fully implemented (Flutter entrypoint, app root, status view, Firebase foundation, Auth + App Check security baseline, tenant -> store isolation, local outbox queue, and comprehensive unit test suite). Pushed to official repo `TuanLamVi/fnb-smart-v5-clean-rebuild` branch `main` at commit `7cbbe39ebe7c9cd66d373df831aff576499546c1`. Passed all unit tests and analyzer checks. |
| Official Clean Rebuild Source Rule V5.1 (Prompt 146) | `PO_VERIFIED / BASELINE FREEZE` | PO Decision (DEC-2026-GOV-OFFICIAL-CLEAN-REBUILD-SOURCE-RULE, 2026-09-29): Official Clean Rebuild Source Repository designated as `TuanLamVi/fnb-smart-v5-clean-rebuild` (local `clean_rebuild_v5/`). Distinguished from Governance Repo (`boquytacfnb`) and Legacy Source Mirror (`fnb-smart-source`). Codified 10 rules prohibiting false implementation reporting. |
| Clean Rebuild A0 Foundation (Prompt 143 Source Provenance) | `A0 SOURCE PRESENT IN OFFICIAL CLEAN REBUILD REPOSITORY` | Prompt 143 Source Provenance Correction: Designated official Clean Rebuild application source repository as `TuanLamVi/fnb-smart-v5-clean-rebuild` (local root `clean_rebuild_v5/`). Distinguished from governance repo (`boquytacfnb`) and legacy source mirror (`fnb-smart-source`). Status: A0 SOURCE PRESENT IN OFFICIAL CLEAN REBUILD REPOSITORY. |
| Clean Rebuild A1 Foundation (Prompt 140 Source Recovery) | `A1 SOURCE EXISTS BUT PROVENANCE MISSING` | Prompt 140 Source Recovery: Application source files exist in `packages/core_saas/lib/...` and are git-tracked from prior rehabilitation history, but lack direct provenance linking them to Prompt-135 Clean Rebuild implementation commits. |
| AI Working Discipline V5.1 (Prompt 136) | `PO_VERIFIED / BASELINE FREEZE` | PO Decision (DEC-2026-GOV-AI-WORKING-DISCIPLINE, 2026-09-29): AI Working Discipline & Prompt Quality Gate established in KIM CHỈ NAM (17 rules covering Repository-First, No Work Item Guessing, Prompt Self-Audit, Zero Stale Status, Evidence-First, Pre-Flight, Post-Prompt Review). |
| Clean Rebuild A0 Foundation (Prompt 133) | `PO_VERIFIED / PROTECTED / LOCKED` | PO Verified (DEC-2026-A0-FOUNDATION-PO-VERIFIED, 2026-09-29): Clean Rebuild Architecture & Core Infrastructure Setup (`CLEAN-REBUILD-A0-FOUNDATION`) successfully verified, protected, and locked. Workspace structure, `packages/core_saas`, core infrastructure skeleton, security baseline (Firebase Auth + App Check contracts), and tenant/store isolation foundation established. |
| Shift Closing Rule V5.1 (Prompt 129) | `PO_VERIFIED / LOCKED` | PO Decision (DEC-2026-SHIFT-CLOSING-S2-S3-RULE, 2026-09-29): Closing Shift is blocked by pending payment attempts only (`pendingAttemptCount = 0`). Supersedes active orders requirement from `DEC-2026-A6-SHIFT`. |
| Master Specification Gate V5.1 (Prompt 132 Synchronization) | `PO_VERIFIED / PROTECTED / LOCKED` | PO Confirmed (2026-09-29): Clean Rebuild Master Specification V5.1 metadata and status synchronized to `PO_VERIFIED / PROTECTED / LOCKED` across all canonical repository files (`99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`, blob SHA: `19100052ab1652148d425ca0592f06b67f1cd328`). Golden Governance Baseline locked. No app code written. |
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
NEXT STEP: PO REVIEW / PO VERIFICATION OF A1
```

- Master Specification V5.1 is `PO_VERIFIED / PROTECTED / LOCKED` (Golden Governance Baseline).
- Clean Rebuild A0 Foundation is `PO_VERIFIED / PROTECTED / LOCKED`.
- Clean Rebuild A1 Foundation is `READY_FOR_PO_VERIFICATION`. Awaiting PO review and formal verification gate before proceeding to A2.
