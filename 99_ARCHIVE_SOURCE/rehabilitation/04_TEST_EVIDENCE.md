# 04 — BẰNG CHỨNG KIỂM THỬ (TEST EVIDENCE)

## 1. NGUYÊN TẮC QUẢN LÝ BẰNG CHỨNG
- Mọi kết quả kiểm tra kỹ thuật, unit test, widget test, build log hay kiểm thử trên thiết bị/emulator đều phải được lưu trữ bằng chứng rõ ràng.
- Phân biệt tuyệt đối giữa:
  - **AI TEST RESULT:** Kết quả do AI chạy và ghi nhận.
  - **PO VERIFIED RESULT:** Kết quả do PO trực tiếp chứng kiến và xác nhận.

---

## 2. MẪU GHI NHẬN KIỂM THỬ CHUẨN (TEMPLATE)

```markdown
### [TEST_ID: e.g., TEST-R0-001]
- **Date:** YYYY-MM-DD
- **Phase:** Phase 0 — Rehabilitation Governance
- **Scenario:** Kiểm tra sự tồn tại và tính hợp lệ của bộ 11 tài liệu quản lý phục hồi.
- **Expected:** Tồn tại đủ 11 file markdown trong `docs/rehabilitation/`.
- **Actual:** [Kết quả thực tế thu được]
- **Environment:** Windows / Android Studio / Git Bash
- **Device / Emulator:** N/A (Documentation task)
- **Build Output:** N/A
- **Log / Evidence:** [Đường dẫn log hoặc terminal output]
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** PENDING / PASS / FAIL
```

---

## 3. NHẬT KÝ BẰNG CHỨNG KIỂM THỬ

### TEST-A1-002 (Real-World Verification A1.2 Account & Store Flow)
- **Date:** 2026-03-31
- **Phase:** Phase 1 — Account & Store Real-World Verification (A1.2-01 to A1.2-08)
- **Scenario:** Kiểm tra thực tế trên thiết bị thật (Samsung Galaxy Tab S3) toàn bộ luồng Đăng ký (A1.2-01), Đăng nhập lại (A1.2-02), Đăng xuất (A1.2-03), User chưa có Store (A1.2-04), Tạo Store (A1.2-05), Owner + Membership (A1.2-06), Đóng/mở lại app (A1.2-07), và Chặn truy cập trái phép Store (A1.2-08).
- **Expected:** Các bước thực hiện trên thiết bị đạt kết quả đúng theo tiêu chí kỹ thuật và nghiệp vụ, không có rò rỉ tenant isolation.
- **Actual:** Đã hoàn tất và đạt 100% PASS trên thiết bị thật theo xác nhận trực tiếp của PO Tuấn.
- **Environment:** Android 9 (SM N950F / Tab S3) / Firebase Staging `fnb-smart`
- **AI Test Result:** VERIFIED
- **PO Verification:** YES (PO Tuấn xác nhận PASS toàn bộ A1.2-01 đến A1.2-08)

### TEST-A2-FIX-02 (Real-World Verification A2.2-01-FIX-02 Duplicate Join Prevention)
- **Date:** 2026-09-24
- **Phase:** Phase A2 — Staff & Permissions (A2.2-01-FIX-02)
- **Scenario:** Kiểm tra thực tế trên thiết bị thật: (8A) Nhân viên đã thuộc Store A nhập lại mã Store A bị chặn đúng và không tạo bản ghi trùng; (8B) Kiểm tra dữ liệu không có duplicate `store_members` hoặc `join_requests`; (8C) Dùng mã Store B vẫn gia nhập được bình thường (bảo toàn TEST 7).
- **Expected:** Chặn chính xác duplicate membership/request của Store hiện tại mà không làm hỏng luồng gia nhập Store khác hay Golden Baseline TEST 1–7.
- **Actual:** Đã đạt 100% PASS trên thiết bị thật theo xác nhận trực tiếp của PO Tuấn.
- **Environment:** Android / Thiết bị thật (Note 8 / M51) / Firebase Staging
- **AI Test Result:** VERIFIED
- **PO Verification:** YES (PO Tuấn trực tiếp xác nhận PASS TEST 8A, 8B, 8C)

### TEST-A2.2-02-FIX-03-BUILD-001 (Debug Build & Device Install Verification)
- **Date:** 2026-06-25
- **Phase:** Phase A2 — Staff & Permissions (A2.2-02-FIX-03-BUILD-001)
- **Scenario:** Build Debug APK chứa code FIX-03 và cài đặt, khởi động ứng dụng trên Samsung Galaxy Note 8 (`SM N950F`) và Samsung Galaxy M51 (`SM M515F`).
- **Expected:** Build APK thành công, 0 lỗi biên dịch, cài đặt thành công qua ADB và khởi động ứng dụng không bị crash.
- **Actual:** `flutter analyze` 0 errors/0 warnings, Debug APK tạo thành công tại `build/app/outputs/flutter-apk/app-debug.apk`, streamed install PASS & monkey launch PASS trên cả Note 8 và M51.
- **Environment:** Android 9 (Note 8) & Android 12 (M51) / Firebase Staging
- **AI Test Result:** BUILD_VERIFIED / INSTALL_VERIFIED / LAUNCH_VERIFIED
- **PO Verification:** YES (Build & Install Verified by PO Tuấn)

### TEST-A3.3-TABLEMAP-FIX-01 (Logout → Login Table Map Real-Time Sync Fix Verification)
- **Date:** 2026-06-25
- **Phase:** Phase A3.3 — Table State Management & Real-Time Sync
- **Scenario:** Kiểm chứng thực tế trên Samsung Galaxy M51 và Samsung Galaxy Note 8 cho 4 kịch bản: (1) Initial Login; (2) Logout → Login lại; (3) Thoát đa nhiệm (Multitask Re-entry); (4) Force Close / Process Restart.
- **Expected:** Đăng xuất rồi đăng nhập lại không bị kẹt ở "Đang nạp Profile", sơ đồ bàn hiển thị chính xác Tầng trệt + 10 bàn trong vòng 10 giây; các luồng Login lần đầu, đa nhiệm và restart hoạt động ổn định.
- **Actual:** Đạt 100% PASS trên cả Samsung M51 và Samsung Note 8 theo xác nhận trực tiếp của PO Tuấn.
- **Environment:** Android (M51 & Note 8) / Firebase Staging `fnb-smart`
- **AI Test Result:** VERIFIED / BUILD_SUCCESS / ADB_INSTALL_SUCCESS
- **PO Verification:** YES (PO Tuấn trực tiếp xác nhận PASS 100% trên cả M51 và Note 8)

### TEST-GP-01-FIX-02 (Real-World Verification GP-01 Orders Tenant Rules Alignment)
- **Date:** 2026-09-24
- **Phase:** Phase G2 — Golden Path Execution (GP-01)
- **Scenario:** Kiểm tra thực tế trên thiết bị thật: Sơ đồ bàn → Bàn 01 → MỞ BÀN MỚI.
- **Expected:** Mở bàn thành công, tạo Order Header tại `/stores/{storeId}/orders/{orderId}` qua `TableService.openTable()` transaction mà không gặp lỗi `permission-denied`.
- **Actual:** Đã đạt 100% PASS trên thiết bị thật theo xác nhận trực tiếp của PO Tuấn.
- **Environment:** Android / Thiết bị thật / Firebase Staging (`fnb-smart-dev` / `fnb-smart`)
- **AI Test Result:** VERIFIED / DEPLOYED
- **PO Verification:** YES (PO Tuấn trực tiếp xác nhận PASS: Sơ đồ bàn → Bàn 01 → MỞ BÀN MỚI thành công)

### TEST-A2-02-PO-001 (Current PO Verification — Employee Quầy POS + Table Map)
- **Date:** 2026-09-26
- **Canonical Work Item:** `A2-02`
- **Historical ID:** `A2.2-02-FIX-03`
- **Environment:** Firebase Staging / Android / Samsung M51 + Samsung Note8
- **Scenario:** Owner mời Employee vào cửa hàng; Employee được phân công Nhân viên Quầy POS; Employee mở Sơ đồ bàn.
- **Expected:** Employee Quầy POS nhìn thấy bàn và mở được bàn theo quyền đã cấp.
- **Actual:** Employee Note8 nhìn thấy bàn, mở được bàn và thấy menu trong bàn.
- **PO Verification:** `YES` — Tuấn trực tiếp xác nhận PASS.
- **Result:** `PO_VERIFIED / PASS`
- **Checkpoint:** `A2-02` → `PO_VERIFIED / PROTECTED / LOCKED`
