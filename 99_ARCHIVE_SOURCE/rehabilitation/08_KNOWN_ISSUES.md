# 08 — DANH SÁCH LỖI ĐÃ BIẾT (KNOWN ISSUES — PROMPT A0.1 UPDATED)

## 1. NGUYÊN TẮC
- Quản lý toàn bộ các lỗi tồn đọng, lỗi biên dịch, lỗi logic, lỗi cấu trúc đã được phát hiện nhưng chưa được giải quyết.
- Không được tự ý xóa tên lỗi khỏi danh sách này khi chưa có bằng chứng đã khắc phục và được xác nhận.

---

## 2. DANH SÁCH LỖI TỒN ĐỌNG (HIỆN TRẠNG REPO)

### ISS-001 (P0 Blocker) — Gradle Build / AndroidLocationsBuildService Conflict
- **Severity:** P0_BLOCKER (Resolved for A0)
- **Description:** Lỗi cấu hình môi trường Gradle `AndroidLocationsBuildService` do conflict giữa `ANDROID_PREFS_ROOT` và `ANDROID_USER_HOME`.
- **Resolution in A0:** Unset `ANDROID_PREFS_ROOT` (`$env:ANDROID_PREFS_ROOT=""`) và cấu hình `android/local.properties` với `sdk.dir`.
- **Status:** RESOLVED_FOR_A0

### ISS-002 (P0 Blocker) — Missing Target URI Dependency (`blue_thermal_printer`)
- **Severity:** P0_BLOCKER (Out of A0 scope, addressed in Phase 6)
- **Description:** Lỗi thiếu dependency hoặc sai đường dẫn URI của thư viện máy in nhiệt.
- **Status:** OPEN (Deferred to Phase 6)

### ISS-003 (P0 Blocker) — Positional Argument Mismatch (`zone_management_controller`)
- **Severity:** P0_BLOCKER (Out of A0 scope, addressed in Phase 4)
- **Description:** Hàm `upsertZone` được gọi với 2 tham số nhưng định nghĩa yêu cầu 3 tham số.
- **Status:** OPEN (Deferred to Phase 4)

### ISS-004 (P1 High) — Structural Drift Anomaly (`fnb-smart-v5/`)
- **Severity:** P1_HIGH
- **Description:** Tồn tại thư mục `fnb-smart-v5/` lồng ghép ở thư mục gốc project.
- **Status:** OPEN

### ISS-005 (P1 High) — Order Read Model Mismatch (`READ_MODEL_MISMATCH`)
- **Severity:** P1_HIGH (Out of A0 scope, addressed in Phase 3)
- **Description:** Order header queries vs subcollection `/lines/{lineId}`.
- **Status:** OPEN (Deferred to Phase 3)
