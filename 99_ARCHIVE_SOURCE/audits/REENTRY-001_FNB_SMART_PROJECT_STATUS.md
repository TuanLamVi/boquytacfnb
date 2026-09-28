# RE-ENTRY-001 — F&B SMART PROJECT STATUS AUDIT

## 1. EXECUTIVE SUMMARY

Kết luận ngắn gọn:

```text
PROJECT STATUS:
WARNING / BLOCKED (Cấu trúc repo dị thường & 478 lỗi Analyzer)

CONTINUE DEVELOPMENT:
NO (Cần xử lý Blocker & Khôi phục cấu trúc chuẩn trước khi tiếp tục)

G2-04:
BLOCKED (Analyzer errors, Security vulnerabilities, Structural anomaly)
```

---

## 2. GIT BASELINE

```text
Branch: fix/v4.6.9-rc17-patch4b-auth-logging
HEAD: be00e47b7c69746d2d55e6c7a97ce55453b54c80
Historical Baseline: cb88477f
HEAD Match: NO (Current HEAD is significantly ahead of baseline)
Working Tree: DIRTY
Staged Changes: YES (Modified .gradle, android, rules, functions, packages, pubspec.lock)
Unstaged Changes: YES (Modified multiple controllers and services)
Untracked Files: YES (docs/, fnb-smart-v5/, auth_temp.json, patch diffs, etc.)
```

---

## 3. TOOLCHAIN

```text
Flutter: 3.41.0 (Stable)
Dart: 3.11.0
Java: 17.0.20.1 (Eclipse Adoptium)
Gradle: 9.3.0 (Wrapper)
AGP: TBD (Expected 8.x based on Gradle version)
Kotlin: 2.2.21
compileSdk: 35 (Targeted in build.gradle.kts)
targetSdk: 35
minSdk: 21
```

---

## 4. PROJECT STRUCTURE

Liệt kê module/package hiện tại:
- `packages/core_saas`: Core logic, models, services.
- `packages/feature_fnb_pos`: POS feature module.
- `packages/feature_finance`: Finance feature module.
- `packages/feature_kds`: KDS feature module.
- `packages/feature_fnb_staff`: Staff feature module.
- **ANOMALY**: Thư mục `fnb-smart-v5/` tồn tại ở root, chứa một bản sao (hoặc phiên bản khác) của toàn bộ project (`app/`, `packages/`, `backend/`, `.git/`). Đây là một structural drift nghiêm trọng.

---

## 5. DEPENDENCY STATUS

Liệt kê dependency quan trọng:
- `get: ^4.6.6`
- `firebase_core: ^3.15.2`
- `firebase_app_check: ^0.3.1+1`
- `cloud_functions: ^5.1.2`
- Dependency Drift: `pubspec.lock` đang ở trạng thái Modified, có khả năng không khớp với version đã được kiểm định trước đó.

---

## 6. BUILD STATUS

```text
flutter analyze: FAIL (478 issues found)
flutter test: NOT RUN (Blocked by analysis errors)
debug APK build: NOT RUN (Blocked by analysis errors)
```

Với từng lỗi:

1. **Error: Target of URI doesn't exist** (blue_thermal_printer)
   - Root Cause: Missing dependencies or path mismatch in vendor packages.
   - Severity: P0 (Blocker)
2. **Error: Undefined getter/identifier** (blue_thermal_printer)
   - Root Cause: API incompatibility or corrupted vendor package.
   - Severity: P0 (Blocker)
3. **Error: 3 positional arguments expected by 'upsertZone', but 2 found** (zone_management_controller)
   - Root Cause: Business logic change without updating all call sites.
   - Severity: P0 (Blocker)

---

## 7. FIREBASE STATUS

```text
Staging: fnb-smart-staging (Target in firebase.json)
Production: fnb-smart (FORBIDDEN)
Functions Region: asia-southeast1 (Confirmed in docs)
Firestore: Firestore Standard
Auth: Firebase Auth (Enabled)
Storage: Firebase Storage (Enabled)
App Check: Enabled (Configured in pubspec and rules)
```

---

## 8. SECURITY STATUS

### App Check
PARTIAL (Đã cấu hình nhưng phát hiện `_hasBypassed` flag trong `InitialLoadingController.dart`)

### Play Integrity
UNKNOWN (Cần kiểm tra cấu hình Play Console)

### Auth Guards
PARTIAL (Phát hiện logs chứa PII và các bypass logic trong AuthController)

### Firestore Rules
FAIL (Báo cáo `SECURITY_AUDIT_REPORT.md` xác nhận 04 lỗ hổng nghiêm trọng về Multi-tenant isolation và Role escalation chưa được vá trong `firestore.rules` hiện tại)

### Bypass Risk
FOUND (Bypass logic trong `InitialLoadingController.dart` và `AuthStatus` flow)

---

## 9. G2-03 STATUS

| Item | Historical | Current Evidence | Current Status |
| ---- | ---------- | ---------------- | -------------- |
| H1   | PASS       | V4.6.8 Report    | UNKNOWN (Regression suspected) |
| H2   | PASS       | V4.6.8 Report    | UNKNOWN (Regression suspected) |
| H3   | PASS       | V4.6.8 Report    | UNKNOWN (Regression suspected) |
| H4   | PASS       | V4.6.8 Report    | UNKNOWN (Regression suspected) |

---

## 10. G2-04 STATUS

| Acceptance Item | Status | Evidence | Blocker |
| --------------- | ------ | -------- | ------- |
| G2-SEC-02       | FAIL   | SECURITY_AUDIT_REPORT.md | Rules vulnerabilities |
| G2-REC-01       | UNKNOWN| No PITR evidence found | Missing PITR config |

---

## 11. DOCUMENTATION DRIFT

1. **Document**: `V4.6.8_FINAL_E2E_VERIFICATION_REPORT.md`
   - **Claim**: FINAL-STABLE-VERIFIED.
   - **Actual**: 478 analyzer errors, critical security holes.
   - **Drift**: Extreme (Code regression hoặc Repo bị hỏng).
   - **Severity**: P0

2. **Document**: `PRODUCT_CHARTER_V5.1.md`
   - **Claim**: V5.1 Baseline.
   - **Actual**: Repo hiện tại đang ở trạng thái v4.6.9-rc17-patch4b.
   - **Drift**: Versioning misalignment.
   - **Severity**: P2

---

## 12. TEST STATUS

```text
Unit: NOT RUN (Blocked)
Widget: NOT RUN (Blocked)
Integration: FOUND (loyalty_e2e_test.dart, etc.) - NOT RUN
Rules: FOUND (Trong audit report) - FAIL
E2E: FOUND - NOT RUN
```

---

## 13. RISK REGISTER

| ID | Severity | Issue | Evidence | Impact | Recommended Action |
| -- | -------- | ----- | -------- | ------ | ------------------ |
| R-01 | P0 | Structural Anomaly | `fnb-smart-v5/` subfolder | Gây xung đột Git và nhầm lẫn source | Xóa/Di chuyển subfolder |
| R-02 | P0 | Build Blocked | 478 analyzer errors | Không thể release hoặc debug | Fix code regressions |
| R-03 | P0 | Security Breach | `firestore.rules` vulnerabilities | Rò rỉ dữ liệu multi-tenant | Vá Rules ngay lập tức |
| R-04 | P1 | Auth Bypass | `_hasBypassed` flag | Vượt rào bảo mật App Check | Loại bỏ bypass logic |

---

## 14. BLOCKERS

1. **Structural Anomaly**: Thư mục `fnb-smart-v5/` lồng trong root repository.
2. **Analyzer Errors**: 478 lỗi ngăn cản quá trình build và test.
3. **Security Vulnerabilities**: Các lỗ hổng Critical trong Firestore Rules.

---

## 15. RECOMMENDED NEXT STEP

```text
RECOMMENDED NEXT STEP:

PROMPT RE-ENTRY-002 — 
STRUCTURAL RESTORATION & BASELINE SANITIZATION

Lý do:
Cần làm sạch cấu trúc repository (xử lý fnb-smart-v5/), đồng bộ lại Git baseline và vá các lỗi Analyzer P0 trước khi thực hiện bất kỳ thao tác nghiệp vụ nào khác.
```

---

==================================================
RE-ENTRY-001 FINAL HANDOFF
==================================================

GIT BASELINE:
Branch: fix/v4.6.9-rc17-patch4b-auth-logging
HEAD: be00e47b
Historical: cb88477f (MISMATCH)

WORKING TREE:
DIRTY (478 Analyzer Errors, Structural Anomaly)

BUILD:
FAIL (478 Issues)

FIREBASE STAGING:
Target: fnb-smart-staging (Detected)

SECURITY:
FAIL (4 Critical Vulnerabilities in Rules)

G2-03:
UNKNOWN (Regression suspected)

G2-04:
BLOCKED

CRITICAL BLOCKERS:
1. Inner Repository Anomaly
2. 478 Analyzer Errors
3. Critical Security Rules Holes

RECOMMENDED NEXT STEP:
PROMPT RE-ENTRY-002 — STRUCTURAL RESTORATION & BASELINE SANITIZATION

MODIFICATION PERFORMED:
YES (Created docs/audits/REENTRY-001_FNB_SMART_PROJECT_STATUS.md)

COMMIT CREATED:
NO

PUSH PERFORMED:
NO

PRODUCTION TOUCHED:
NO
==================================================
