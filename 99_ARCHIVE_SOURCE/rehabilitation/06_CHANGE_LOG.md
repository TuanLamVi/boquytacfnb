# 06 — NHẬT KÝ THAY ĐỔI (CHANGE LOG — PROMPT 004 UPDATED)

## 1. NGUYÊN TẮC
- Mọi thay đổi thực tế trên repository (tạo file, sửa file, cấu hình) đều phải được ghi nhận chi tiết tại đây.
- Không được che giấu bất kỳ thay đổi nào dù là nhỏ nhất.

---

## 2. DANH SÁCH THAY ĐỔI

### CHG-000-01
- **Date:** 2026-03-31
- **Prompt:** PROMPT 000
- **Phase:** Phase 0 — Rehabilitation Governance
- **Files Changed:**
  - `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md` (and 10 other rehabilitation docs)
- **What Changed:** Khởi tạo toàn bộ bộ 11 tài liệu quản lý và quy trình phục hồi dự án F&B SMART.
- **Why:** Tuân thủ yêu cầu thiết lập bộ khung kim chỉ nam và quản lý phục hồi.
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** PENDING

### CHG-003.6
- **Date:** 2026-03-31
- **Prompt:** PROMPT 003.6
- **Phase:** Phase 0 — Rehabilitation Governance
- **Files Changed:**
  - `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md`
  - `docs/rehabilitation/10_REPORT_TEMPLATE.md`
  - `docs/rehabilitation/06_CHANGE_LOG.md`
  - `docs/rehabilitation/09_AI_HANDOFF.md`
- **What Changed:** Cập nhật Kim Chỉ Nam và Report Template bổ sung quy định bắt buộc LAW-013 và LAW-001.
- **Why:** Khắc phục khiếm khuyết quản trị PROMPT 003.5.
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** PENDING

### CHG-004
- **Date:** 2026-03-31
- **Prompt:** PROMPT 004
- **Phase:** Phase 0 — Rehabilitation Governance & Architecture Audit
- **Files Changed:**
  - `docs/rehabilitation/02_CURRENT_STATE.md`
  - `docs/rehabilitation/01_ROADMAP.md`
  - `docs/rehabilitation/08_KNOWN_ISSUES.md`
  - `docs/rehabilitation/06_CHANGE_LOG.md`
  - `docs/rehabilitation/09_AI_HANDOFF.md`
- **What Changed:** Thực hiện Architecture & Roadmap Audit toàn bộ hệ thống F&B SMART theo Prompt 004, lập bản đồ trạng thái hiện tại, kiến trúc, ma trận tính năng, tìm thấy ISS-005 (READ_MODEL_MISMATCH), cập nhật roadmap và chuyển Phase 0 sang READY_FOR_PO_VERIFICATION. **Không sửa source code.**
- **Why:** Hoàn thành audit kiến trúc hiện trạng theo đúng quy định Kim Chỉ Nam.
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** PENDING

### CHG-A0.1
- **Date:** 2026-03-31
- **Prompt:** PROMPT A0.1 & A0.1-BUILD-RESCUE
- **Phase:** Phase A0 — Nền móng (Foundation)
- **Files Changed:**
  - `android/gradle.properties`
  - `android/local.properties` (NEW)
  - `docs/rehabilitation/BUILD_BASELINE.md` (NEW)
  - `docs/rehabilitation/02_CURRENT_STATE.md`
  - `docs/rehabilitation/01_ROADMAP.md`
  - `docs/rehabilitation/03_CHECKPOINTS.md`
  - `docs/rehabilitation/06_CHANGE_LOG.md`
  - `docs/rehabilitation/08_KNOWN_ISSUES.md`
  - `docs/rehabilitation/09_AI_HANDOFF.md`
- **What Changed:** Thiết lập môi trường Nền móng A0, khắc phục lỗi Gradle `AndroidLocationsBuildService`, build thành công debug APK staging, cài đặt thành công lên thiết bị thật SM N950F, tạo tài liệu `BUILD_BASELINE.md` (A0-BUILD-001), và được PO Tuấn trực tiếp xác nhận Build PASS (`PO_VERIFIED = YES` cho phần Build Baseline). Toàn bộ Phase A0 vẫn ở `READY_FOR_PO_VERIFICATION` chờ nghiệm thu tổng thể.
- **Why:** Hoàn thành hạng mục build kỹ thuật quan trọng của A0.
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** Build Baseline: YES (Tuấn) | Phase A0 Overall: PENDING

### CHG-A0-LOCKED
- **Date:** 2026-09-24
- **Prompt:** PROMPT A0→A1
- **Phase:** Phase A0 (Lock) & Phase A1 (Transition)
- **Files Changed:**
  - `docs/rehabilitation/02_CURRENT_STATE.md`
  - `docs/rehabilitation/03_CHECKPOINTS.md`
  - `docs/rehabilitation/01_ROADMAP.md`
  - `docs/rehabilitation/05_DECISION_LOG.md`
  - `docs/rehabilitation/06_CHANGE_LOG.md`
  - `docs/rehabilitation/09_AI_HANDOFF.md`
- **What Changed:** Ghi nhận chính thức PO_VERIFIED A0, khóa checkpoint A0, chuyển trạng thái kế hoạch từ A0 sang A1 — Account & Store. Không thay đổi source code hay cấu hình build/Firebase.
- **Why:** Tuân thủ quyết định của Chủ đầu tư sau khi kiểm chứng thực tế A0 thành công.
- **AI Test Result:** PASS_TECHNICAL
- **PO Verification:** PO_VERIFIED (Tuấn)

### CHG-A2.2-01-FIX-02-LOCKED
- **Date:** 2026-09-24
- **Prompt:** PROMPT A2.2-01-FIX-02 — LOCK CHECKPOINT
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Files Changed:**
  - `packages/core_saas/lib/data/repos/store_repository.dart`
  - `packages/core_saas/lib/controllers/join_store_controller.dart`
  - `docs/rehabilitation/03_CHECKPOINTS.md`
  - `docs/rehabilitation/04_TEST_EVIDENCE.md`
  - `docs/rehabilitation/06_CHANGE_LOG.md`
  - `docs/rehabilitation/09_AI_HANDOFF.md`
- **What Changed:** Triển khai và khóa checkpoint A2.2-01-FIX-02 sau khi PO Tuấn trực tiếp xác nhận thực tế trên thiết bị thật đạt 100% PASS cho TEST 8A, TEST 8B, TEST 8C, đồng thời bảo vệ tuyệt đối Golden Baseline TEST 1–7.
- **Why:** Hoàn thành mục tiêu chống nhân viên gia nhập trùng Store hiện tại.
- **AI Test Result:** VERIFIED
- **PO Verification:** PO_VERIFIED (Tuấn)

### CHG-A2.2-02-FIX-03
- **Date:** 2026-06-25
- **Prompt:** PROMPT A2.2-02-FIX-03, BUILD-001
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Files Changed:**
  - `firestore.rules`
  - `packages/feature_fnb_pos/lib/widgets/order/cart_item_widget.dart`
  - `packages/feature_fnb_pos/lib/widgets/order/compact_cart_item_widget.dart`
  - `packages/feature_fnb_pos/lib/controllers/table_map_controller.dart`
  - `packages/feature_fnb_staff/lib/views/qr_scanner_view.dart`
  - `packages/feature_fnb_pos/lib/views/zone_management_view.dart`
  - `packages/feature_fnb_pos/lib/views/loyalty/loyalty_hub_view.dart`
  - `packages/feature_fnb_pos/lib/views/table_map_view.dart`
  - `packages/feature_fnb_pos/lib/views/store_menu_view.dart`
- **What Changed:** Loại bỏ role-based permission bypass ở Client và Server Firestore Rules, ép tất cả nhân viên tuân thủ checkbox `allowedFeatures`. Build Staging Debug APK thành công và cài đặt/khởi động trên Note 8 & M51.
- **Why:** Tuân thủ quyết định `PO-DECISION-A2.2-PERMISSION-MODEL-001`.
- **AI Test Result:** BUILD_VERIFIED / INSTALL_VERIFIED / LAUNCH_VERIFIED
- **PO Verification:** BUILD VERIFIED (Tuấn) / PO-TEST DEFERRED

### CHG-A2.2-02-FIX-03-LOG-001
- **Date:** 2026-06-25
- **Prompt:** PROMPT A2.2-02-FIX-03-LOG-001
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Files Changed:** `docs/rehabilitation/*`
- **What Changed:** Ghi nhật ký đồng bộ trạng thái A2.2-02-FIX-03 (UNRESOLVED / WAITING PO-TEST) và BUILD-001 (PROTECTED / GOLDEN BUILD) sau quyết định PO-TEST DEFERRED của PO Tuấn. Không sửa bất kỳ source code nào.
- **Why:** Đồng bộ hóa hệ thống nhật ký quản trị dự án.
- **AI Test Result:** LOG_UPDATED
- **PO Verification:** RESPECTED (PO Decision recorded)

### CHG-A3.3-FIX-01
- **Date:** 2026-06-25
- **Prompt:** PROMPT A3.3-TABLEMAP-LOGOUT-LOGIN-FIX-01
- **Phase:** Phase A3.3 — Table State Management & Real-Time Sync
- **Files Changed:**
  - `packages/core_saas/lib/services/table_realtime_service.dart`
- **What Changed:** Khắc phục triệt để lỗi Logout → Login lại làm Table Map bị kẹt "Đang nạp Profile" (xử lý race condition giữa `_storeWorker` và `_profileWorker`, re-evaluate `latestProfile` sau `await _cancelSubscriptions`, re-arm `_watchdogTimer`, reset `_lastSecurityRole` trong `stopSync()`).
- **Why:** Tuân thủ kết quả forensic A3.3-01 và yêu cầu sửa lỗi.
- **AI Test Result:** VERIFIED / BUILD_SUCCESS / ADB_INSTALL_SUCCESS
- **PO Verification:** PO_VERIFIED (Tuấn xác nhận PASS 100% trên M51 và Note 8)

### CHG-GP-01-FIX-02
- **Date:** 2026-09-24
- **Prompt:** AUTHORIZATION GP-01-SURGICAL-FIX-02 — ORDERS TENANT RULES ALIGNMENT
- **Phase:** Phase G2 — Golden Path Execution
- **Files Changed:**
  - `firestore.rules`
- **What Changed:** Thêm match rules cho collection `orders` và subcollection `lines` theo canonical CONTRACT-A (`/stores/{storeId}/orders/{orderId}` và `/stores/{storeId}/orders/{orderId}/lines/{lineId}`) với cơ chế `isMemberOf(storeId)` và `storeId` field validation, deploy thành công lên Firebase (`fnb-smart-dev`). PO Tuấn đã kiểm chứng thực tế PASS 100% (Sơ đồ bàn → Bàn 01 → MỞ BÀN MỚI thành công, không còn `permission-denied`).
- **Why:** Khắc phục triệt để lỗi `permission-denied` khi mở bàn mới và giữ nguyên kiến trúc SSoT CONTRACT-A.
- **AI Test Result:** RULES_COMPILED / DEPLOYED / PO_VERIFIED
- **PO Verification:** PO_VERIFIED (Tuấn)

### CHG-BUILD-BASELINE-20260926
- **Date:** 2026-09-26
- **Prompt:** PROMPT 029 + PO manual update
- **Phase:** A0 Build Baseline Maintenance
- **Files Changed:** `docs/rehabilitation/BUILD_BASELINE.md`
- **What Changed:** Cập nhật Build Baseline theo build success evidence 2026-09-26; Gradle verified = 8.13 và bổ sung `ANDROID_SDK_ROOT`.
- **Why:** Dùng điều kiện build đã được chứng minh thay cho thông số baseline cũ.
- **Code Changed:** NO

### CHG-A2-02-SURGICAL-FIX-001
- **Date:** 2026-09-26
- **Prompt:** PROMPT 026
- **Phase:** Phase A2 — Staff & Permissions
- **Work Item:** `A2-02`
- **Files Changed:**
  - `packages/core_saas/lib/services/table_realtime_service.dart`
  - `packages/feature_fnb_pos/lib/controllers/table_map_controller.dart`
  - `packages/feature_fnb_pos/lib/widgets/table/zone_selector_widget.dart`
- **What Changed:** Sửa lỗi Employee Quầy POS không nhìn thấy bàn trong Sơ đồ bàn.
- **Result:** Technical verification PASS; A3-03 regression PASS; sau đó PO verified PASS.

### CHG-A2-02-PO-VERIFIED-LOCK-001
- **Date:** 2026-09-26
- **Prompt:** PROMPT 031
- **Phase:** Phase A2 — Staff & Permissions
- **Work Item:** `A2-02`
- **Files Changed:**
  - `docs/rehabilitation/03_CHECKPOINTS.md`
  - `docs/rehabilitation/05_DECISION_LOG.md`
- **What Changed:** Ghi nhận PO PASS và khóa bảo vệ A2-02.
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`

### CHG-GOV-026-PO-VERIFIED
- **Date:** 2026-09-26
- **Work Item:** `GOV-026`
- **What Changed:** PO Tuấn chính thức xác nhận `PO_VERIFIED GOV-026` sau khi kiểm tra báo cáo audit consistency và closure synchronization.
- **Status:** `PO_VERIFIED`

### CHG-PO-ASSIGN-MONEY-CURRENCY-INT64
- **Date:** 2026-09-26
- **Work Item:** `A3-01 — Money / Currency / Int64 Representation`
- **What Changed:** PO Tuấn chính thức gán Canonical Work Item ID `A3-01` cho `Money / Currency / Int64 Representation` và phê duyệt scope: (1) Pi code Option B (Isolate/Disable); (2) OrderModel Option B (Full Money Boundary).
- **Status:** `ASSIGNED / SCOPE APPROVED`

### CHG-GOV-027-LAW-016
- **Date:** 2026-09-26
- **Work Item:** `GOV-027`
- **What Changed:** Triển khai chính thức LAW-016 (PO Decision Bridge & Repository Recording) vào Kim Chỉ Nam và cập nhật đồng bộ hồ sơ governance. PO Tuấn đã xác nhận `PO_VERIFIED GOV-027` (Protected: No, Locked: No).
- **Status:** `PO_VERIFIED`

### CHG-GOV-028-LAW-017
- **Date:** 2026-09-26
- **Work Item:** `GOV-028`
- **What Changed:** Triển khai chính thức luật `LAW-017 — Session Reentry & No-Memory Authority` vào Kim Chỉ Nam và cập nhật đồng bộ hồ sơ governance. PO Tuấn đã trực tiếp xác nhận `PO_VERIFIED GOV-028` (Protected: No, Locked: No).
- **Status:** `PO_VERIFIED`

### CHG-A3-01-PO-VERIFIED
- **Date:** 2026-09-26
- **Work Item:** `A3-01 — Money / Currency / Int64 Representation`
- **What Changed:** PO Tuấn trực tiếp kiểm tra thực tế trên thiết bị thật (Samsung M51 Owner & Samsung Note 8 Employee) và xác nhận `PO_VERIFIED A3-01` (Money / Currency / Int64 Representation — Full Money Boundary + Pi Isolation). Khóa checkpoint A3-01 thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`

### CHG-PO-ASSIGN-A3-02
- **Date:** 2026-09-26
- **Work Item:** `A3-02 — Orders & Order Lines State Engine`
- **What Changed:** PO Tuấn chính thức gán Canonical Work Item ID `A3-02` cho `Orders & Order Lines State Engine` (`ASSIGNED / PENDING EXECUTION`).
- **Status:** `ASSIGNED`

### CHG-A3-02-PO-VERIFIED
- **Date:** 2026-09-26
- **Work Item:** `A3-02 — Orders & Order Lines State Engine`
- **What Changed:** PO Tuấn trực tiếp xác nhận `PO_VERIFIED A3-02` (Orders & Order Lines State Engine) sau khi kiểm tra thực tế trên thiết bị thật. Khóa checkpoint A3-02 thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`

### CHG-A3-04-IMPLEMENTATION
- **Date:** 2026-09-26
- **Work Item:** `A3-04 — Payment & Table Closure Synchronization Fix`
- **What Changed:** PO Tuấn chính thức gán Canonical Work Item ID `A3-04` và hoàn tất surgical fix sửa lỗi thanh toán thành công nhưng order và bàn không đóng bằng cách cập nhật backend Cloud Function `completePosPaymentHandler` (`functions/src/loyalty/loyalty_payment.ts`) và `loyalty_order.ts` để ép Order status thành `"closed"` và cập nhật đúng collection path `/stores/{storeId}/tables/{tableId}` thành `"available"` với `currentOrderId: FieldValue.delete()`.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-05-IMPLEMENTATION
- **Date:** 2026-09-26
- **Work Item:** `A3-05 — Shift & ShiftLock State Machine & Data Model Foundation`
- **What Changed:** Triển khai hoàn chỉnh Backend Authoritative Cloud Functions (`openShift`, `startClosingShift`, `closeShift`) tại `functions/src/shift/shift_canonical.ts`, tích hợp Receipt-first idempotency, requestHash validation, tenant resolution, và revision fencing. Triển khai đầy đủ client models, repository, service (`ShiftModel`, `ShiftLockModel`, `CashEntryModel`, `ShiftRepository`, `ShiftService`) tại `packages/core_saas`, và hoàn tất bộ unit test toàn diện (73/73 tests PASS). Bảo vệ tuyệt đối A3-01, A3-02, A3-03.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-06-IMPLEMENTATION
- **Date:** 2026-09-26
- **Work Item:** `A3-06 — Shift Management UI (Cashier & Staff Shift Control)`
- **What Changed:** Triển khai hoàn chỉnh Shift Management UI trong `packages/feature_fnb_pos` (`ShiftController`, `OpenShiftDialog`, `CloseShiftDialog`, `ShiftStatusBar`, tích hợp vào `TableMapView` header bar), kết nối trực tiếp với backend authoritative `A3-05` functions (`openShift`, `startClosingShift`, `closeShift`). Toàn bộ test suite chạy PASS, build debug APK thành công (SHA256: `B2950DA407D5330432829ECBEFECFCAACD048B2D0C83C17878D250972F69B3DD`), cài đặt thành công và chạy mượt mà trên Samsung Galaxy Note 8. Bảo vệ tuyệt đối A3-01, A3-02, A3-03.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-06-RECOVERY
- **Date:** 2026-09-26
- **Work Item:** `A3-06 — Active Shift UI Recovery & ShiftLock Handling`
- **What Changed:** Triển khai cơ chế surgical recovery cho A3-06: `ShiftController` xử lý `SHIFT_LOCK_ACTIVE` như một recovery signal để tự động nạp ca hiện tại (`loadCurrentShift()`) và cập nhật `ShiftStatusBar` mà không làm kẹt popup hay tạo ca trùng lặp. Đảm bảo startup recovery, startup active shift loading, và error handling không giả lập success. Build debug APK mới thành công (SHA256: `137F033B0DAD4240283372D9C397E9CE53B2EBA2C6DE82E9F51A26661B7A6823`), cài đặt và launch thành công trên Samsung Galaxy Note 8. Bảo vệ tuyệt đối A3-01, A3-02, A3-03.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-06-ERROR-RESET
- **Date:** 2026-09-26
- **Work Item:** `A3-06 — Residual Error State Retention Fix (`OpenShiftDialog`)`
- **What Changed:** Bổ sung `initState()` trong `_OpenShiftDialogState` để tự động reset/clear `_controller.errorMessage.value = '';` ngay khi mở dialog "Mở ca", triệt tiêu hoàn toàn lỗi hiển thị residual error từ attempt trước. Build debug APK mới thành công (SHA256: `CF5C75DBE0080C91D2D2CFD1C8034E17C3CC108BE48E92E32D349955E47CE73F`), cài đặt thành công và chạy mượt mà trên Samsung Galaxy Note 8. Bảo vệ tuyệt đối A3-01, A3-02, A3-03.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-06-SURGICAL-FIX-R2
- **Date:** 2026-09-26
- **Work Item:** `A3-06 — Surgical Fix R2: MutationId Preservation & Receipt Point-Get Reconciliation`
- **What Changed:** Triển khai triệt để quy tắc State Machines V0.1 §1.3: bảo toàn `mutationId` qua các lần retry trong `ShiftRepository` và `ShiftController.handleStartClosingShift`, thực hiện point-get `/stores/{storeId}/commandReceipts/{mutationId}` khi gặp timeout/`SHIFT_NOT_OPEN`, và reconcile `CLOSING` state chỉ khi Receipt status là `success`. Cập nhật `CloseShiftDialog` tự động chuyển thẳng sang Phase 2 khi shift đã `closing`. Build debug APK mới thành công (SHA256: `1B5A24521841B12DFE802C717E7892D5E6E53C56ABED695F3B4D4DE4D082B627`), cài đặt thành công và chạy mượt mà trên Samsung Galaxy Note 8. Bảo vệ tuyệt đối A3-01, A3-02, A3-03.
- **Status:** `READY_FOR_PO_VERIFICATION`

### CHG-A3-06-PO-VERIFIED
- **Date:** 2026-09-26
- **Work Item:** `A3-06 — Shift Management UI & Active Shift Recovery`
- **What Changed:** PO Tuấn trực tiếp kiểm tra thực tế trên thiết bị thực tế (Samsung Galaxy Note 8) và xác nhận `PO_VERIFIED = YES` cho A3-06 (App nhận ca đang mở → Đóng ca 100.000 VNĐ → Chuyển đúng Phase 2 → Xác nhận chênh lệch → Hoàn tất đóng ca thành công → Mở ca lại 200.000 VNĐ thành công). Khóa checkpoint A3-05 và A3-06 thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`

### CHG-A6-02-IMPLEMENTATION
- **Date:** 2026-09-26
- **Work Item:** `A6-02 — Canonical POS Payment UI Integration & Test Surface (Parallel Coexistence)`
- **What Changed:** Triển khai hoàn chỉnh Canonical POS Payment UI Integration & Test Surface (`CanonicalPaymentController`, `CanonicalPaymentDialog`, tích hợp menu action trong `TableMapView` app bar) với cơ chế tự động resolve/initialize canonical Invoice từ active POS Order qua `ensureCanonicalTestInvoice`. Tích hợp P1 (`beginPayment`) và P2 (`confirmPayment`) song song với legacy `completePosPayment` (NO CUTOVER). Build debug APK mới thành công (SHA256: `4056223A8CA034D4BF68E58D8CDFFE1F2F56F25E22A5E700F680EE07DF0D3A52`), cài đặt và launch thành công trên Samsung Galaxy Note 8 và Samsung Galaxy M51. Bảo vệ tuyệt đối A3-01, A3-02, A3-03, A3-05, A3-06.
- **Status:** `READY_FOR_PO_VERIFICATION`
