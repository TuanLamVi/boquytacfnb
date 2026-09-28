# CURRENT STATUS CORRECTION — 2026-09-26

> This is the current status snapshot. Historical entries below are preserved.
> Do not use an older header/status below to override this correction.

- `A2-02` = `PO_VERIFIED / PROTECTED / LOCKED`.
- `GOV-025` = `PO_VERIFIED / PROTECTED / LOCKED`.
- `A2` parent remains `NOT VERIFIED`; child PASS does not promote the parent.
- The detailed `A2-02` checkpoint entry later in this file is the current checkpoint record.

---

# 03 — DANH SÁCH CHECKPOINT (CHECKPOINTS REGISTRY)

## 1. TRẠNG THÁI HIỆN TẠI
```text
BUILD_BASELINE_A0_PO_VERIFIED
A0_PHASE_LOCKED_AND_VERIFIED
CURRENT_PHASE: A1
```

---

## 2. QUY ĐỊNH VỀ CHECKPOINT
- Một Checkpoint chỉ được tạo ra sau khi PO trực tiếp kiểm chứng và xác nhận PASS cho một hạng mục công việc trong Roadmap.
- Khi một Checkpoint được kích hoạt:
  - Trạng thái chuyển thành `PO_VERIFIED`.
  - Các file liên quan trở thành `PROTECTED` (bất khả xâm phạm trong các PROMPT sau nếu không có lý do hồi quy).
- Không được giả mạo Checkpoint từ các kết quả build/test tự động của AI.

---

## 3. DANH SÁCH CHECKPOINT (CẬP NHẬT LIÊN TỤC)

### [CHECKPOINT_ID: A0-FOUNDATION (A0 Overall & Build Baseline)]
- **Phase:** Phase A0 — Nền móng (Foundation)
- **Item:** Full A0 Foundation, Staging Firebase, Build Baseline A0-BUILD-001 & Device Installation (SM N950F)
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-03-31
- **Evidence:** `docs/rehabilitation/BUILD_BASELINE.md`, `build/app/outputs/flutter-apk/app-debug.apk`, adb install success on SM N950F, PO validation PASS.
- **Protected Files (Reference):**
  - `docs/rehabilitation/BUILD_BASELINE.md`
  - `android/gradle.properties`
  - `android/local.properties`
  - `android/app/build.gradle.kts`
  - `android/settings.gradle.kts`
- **Dependencies:** None
- **Known Limitations:** None (Phase A0 successfully completed and locked by PO).

### [CHECKPOINT_ID: A1.1 (Account & Store Audit)]
- **Phase:** Phase A1 — Tài khoản & Cửa hàng (Account & Store)
- **Item:** A1.1 Audit, Firestore re-init verification, Region `asia-southeast1`, Firestore Rules deployment, and End-to-End Account → User → Create Store → Owner → Membership → active membership → Store flow.
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-03-31
- **Evidence:** PO direct confirmation PASS, Firestore staging verification reports, Rules deployment verification, Auth & Store workflow verification.
- **Protected Components:**
  - Authentication flow & user profile schema (`/users/{uid}`)
  - Store model & store creation transaction (`/stores/{storeId}`)
  - Membership binding (`/store_members/{storeId}_{uid}`)
  - Tenant isolation & security rules (`firestore.rules`)
- **Dependencies:** A0-FOUNDATION
- **Next:** A1.2

### [CHECKPOINT_ID: A1.2 (Account & Store Real-World Verification)]
- **Phase:** Phase A1 — Tài khoản & Cửa hàng (Account & Store)
- **Item:** Real-world verification on Samsung Galaxy Tab S3 (A1.2-01 Registration, A1.2-02 Login, A1.2-03 Logout, A1.2-04 User Without Store, A1.2-05 Create Store, A1.2-06 Owner & Membership, A1.2-07 Reopen App, A1.2-08 Unauthorized Store Access).
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-03-31
- **Evidence:** PO direct real-device verification (100% PASS across A1.2-01 to A1.2-08).
- **Protected Components:**
  - Complete Authentication & Store Setup lifecycle
  - Tenant isolation and unauthorized store access blocking
- **Dependencies:** A1.1
- **Next:** A1.2

### [CHECKPOINT_ID: A1.2 (Account & Store Real-World Verification)]
- **Phase:** Phase A1 — Tài khoản & Cửa hàng (Account & Store)
- **Item:** Real-world verification on Samsung Galaxy Tab S3 (A1.2-01 Registration, A1.2-02 Login, A1.2-03 Logout, A1.2-04 User Without Store, A1.2-05 Create Store, A1.2-06 Owner & Membership, A1.2-07 Reopen App, A1.2-08 Unauthorized Store Access).
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-03-31
- **Evidence:** PO direct real-device verification (100% PASS across A1.2-01 to A1.2-08).
- **Protected Components:**
  - Complete Authentication & Store Setup lifecycle
  - Tenant isolation and unauthorized store access blocking
- **Dependencies:** A1.1
- **Next:** A2.2-01-FIX-02

### [CHECKPOINT_ID: A2.2-01-FIX-02 (Duplicate Join Prevention)]
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Item:** Chống nhân viên gia nhập trùng Store hiện tại (TEST 8A, TEST 8B, TEST 8C), bảo vệ Golden Baseline TEST 1–7.
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-24
- **Evidence:** PO direct real-device verification PASS for TEST 8A, TEST 8B, TEST 8C.
- **Protected Components:**
  - `StoreRepository#hasExistingMembershipOrRequest`
  - `JoinStoreController#submitCode` & `_finalSubmitJoinRequest`
- **Dependencies:** A1.2
- **Next:** A2-02

### [CHECKPOINT_ID: A2-02 (Employee Quầy POS + Table Map)]
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Item:** A2-02 Employee Quầy POS + Table Map (Nhân viên Quầy POS nhìn thấy bàn, mở được bàn, nhìn thấy menu trong bàn).
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct real-device verification PASS on M51 and Note8 (Employee Quầy POS nhìn thấy bàn, mở được bàn và thấy menu trong bàn).
- **Protected Components:**
  - `packages/core_saas/lib/services/table_realtime_service.dart`
  - `packages/feature_fnb_pos/lib/controllers/table_map_controller.dart`
  - `packages/feature_fnb_pos/lib/widgets/table/zone_selector_widget.dart`
- **Dependencies:** A1.2, A2.2-01-FIX-02
- **Next:** Subsequent Phase / Work Item

### [CHECKPOINT_ID: A2.2-02-FIX-03-BUILD-001 (Debug Build & Device Install)]
- **Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Item:** Build Staging Debug APK chứa code FIX-03 (Loại bỏ Role-based Permission Bypass) và cài đặt/khởi động ứng dụng thành công trên Samsung Galaxy Note 8 (SM N950F) & Samsung Galaxy M51 (SM M515F).
- **Status:** PROTECTED / GOLDEN BUILD
- **Verified By:** Build & Device Install Pipeline (PO Verified Build)
- **Date:** 2026-06-25
- **Evidence:** `build/app/outputs/flutter-apk/app-debug.apk`, flutter analyze 0 errors/0 warnings, ADB streamed install PASS & monkey launch PASS on Note 8 and M51.
- **Protected Components:**
  - Build pipeline & Staging Debug APK (`app-debug.apk`)
  - Device installation on Note 8 & M51
- **Dependencies:** A2.2-01-FIX-02
- **Next:** A2.2-02-FIX-03-PO-TEST

### [CHECKPOINT_ID: A3.3-TABLEMAP-LOGOUT-LOGIN-FIX (Table Map Logout-Login & Real-Time Sync Fix)]
- **Phase:** Phase A4 / A3.3 — Table State Management & Real-Time Sync
- **Item:** Khắc phục triệt để lỗi Logout → Login lại làm Table Map bị kẹt "Đang nạp Profile", đảm bảo Watchdog active, xử lý race condition `_restartSync` / `_profileWorker`, reset `_lastSecurityRole` trên logout, nghiệm thu thực tế 100% PASS trên Samsung Galaxy M51 & Samsung Galaxy Note 8.
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-06-25
- **Evidence:** Real-device verification PASS on Samsung M51 and Samsung Note 8 across Initial Login, Logout → Login, Multitask Re-entry, and Force Close → Re-entry.
- **Protected Components:**
  - `packages/core_saas/lib/services/table_realtime_service.dart`
- **Dependencies:** A2.2-02-FIX-03-BUILD-001
- **Next:** GP-01-SURGICAL-FIX-02

### [CHECKPOINT_ID: GP-01-SURGICAL-FIX-02 (Orders Tenant Rules Alignment & Canonical Path Verification)]
- **Phase:** Phase G2 / Golden Path Execution
- **Item:** Đồng bộ Firestore Security Rules theo CONTRACT-A (`/stores/{storeId}/orders/{orderId}` và `/stores/{storeId}/orders/{orderId}/lines/{lineId}`), deploy thành công lên Firebase (`fnb-smart-dev` / `fnb-smart`), và xác nhận thực tế trên thiết bị thật thành công (Sơ đồ bàn → Bàn 01 → MỞ BÀN MỚI).
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-24
- **Evidence:** PO direct real-device verification PASS (Sơ đồ bàn → Bàn 01 → MỞ BÀN MỚI thành công, không còn lỗi `permission-denied`). Rules compiled and released to `cloud.firestore`.
- **Protected Components:**
  - `firestore.rules` (match /stores/{storeId}/orders/{orderId} & lines/{lineId})
- **Dependencies:** A1.2, A2.2-01-FIX-02
- **Next:** GP-02 — Menu & Catalog
- **Next:** Tiếp tục các hạng mục tiếp theo trong Roadmap.

### [CHECKPOINT_ID: GOV-025-CLOSURE-PROTECTION-RULE (Work Item Closure & Protection Rule)]
- **Phase:** Governance & Administration (GOV-025)
- **Item:** Bổ sung chính thức luật đóng, nghiệm thu, bảo vệ và khóa Work Item/nghiệp vụ vào Kim Chỉ Nam của dự án F&B SMART V5.
- **Status:** PO_VERIFIED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Protected Rule:** WORK ITEM CLOSURE & PROTECTION RULE
- **Protected Principle:** PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED
- **Unlock Authority:** PO only (Tuấn)
- **File Protection:** Không khóa cứng file; bảo vệ hành vi nghiệp vụ, invariants, acceptance criteria và evidence.
- **Date:** 2026-09-26
- **Evidence:** PO direct confirmation ("GOV-025 STATUS: PO_VERIFIED, PROTECTION: PROTECTED, CHECKPOINT: LOCKED"). Documentation updated in `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md` (§ 5.1), `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md` (§ 9B), `docs/rehabilitation/05_DECISION_LOG.md` (DEC-GOV-025), and `docs/rehabilitation/03_CHECKPOINTS.md`.
- **Protected Components:**
  - `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md` (§ 5.1)
  - `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md` (§ 9B)
- **Dependencies:** None
- **Next:** Áp dụng làm luật chung bắt buộc cho toàn bộ các Work Item tiếp theo trong F&B SMART V5.

### [CHECKPOINT_ID: GOV-026 (Governance Consistency Audit & Work Item Closure Synchronization)]
- **Phase:** Governance & Administration (GOV-026)
- **Item:** Kiểm tra forensic toàn bộ governance hiện tại sau khi PO chép bộ Governance Replacement CLEAN vào repository, đồng bộ hóa trạng thái closure.
- **Status:** PO_VERIFIED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** Codex audit result PASS, zero stale/conflict findings, zero missing evidence, governance V2 confirmed DRAFT / NOT YET ADOPTED, zero mutation, PO direct confirmation ("PO_VERIFIED GOV-026").
- **Protected Components:** Governance consistency across rehabilitation documentation set.
- **Dependencies:** GOV-025
- **Next:** Subsequent Work Items designated by PO.

### [CHECKPOINT_ID: GOV-027 (LAW-016 PO Decision Bridge & Repository Recording)]
- **Phase:** Governance & Administration (GOV-027)
- **Item:** Implement LAW-016 PO Decision Bridge establishing formal repository recording of PO decisions and direct PO verification.
- **Status:** PO_VERIFIED (Protected: No, Locked: No — pending regression check per GOV-025)
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct confirmation ("PO_VERIFIED GOV-027"), documentation updates in Kim Chỉ Nam and decision log.
- **Protected Components:** Governance rule enforcement (LAW-016).
- **Dependencies:** GOV-025, GOV-026
- **Next:** Money / Currency / Int64 Representation

### [CHECKPOINT_ID: GOV-028 (LAW-017 Session Reentry & No-Memory Authority)]
- **Phase:** Governance & Administration (GOV-028)
- **Item:** Implement LAW-017 Session Reentry & No-Memory Authority rule ensuring AI relies on repository governance rather than session memory.
- **Status:** PO_VERIFIED (Protected: No, Locked: No — pending regression check per GOV-025)
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct confirmation ("PO_VERIFIED GOV-028"), documentation updates in Kim Chỉ Nam and decision log.
- **Protected Components:** Governance rule enforcement (LAW-017).
- **Dependencies:** GOV-025, GOV-026, GOV-027
- **Next:** A3-01 — Money / Currency / Int64 Representation

### [CHECKPOINT_ID: A3-01 (Money / Currency / Int64 Representation)]
- **Phase:** Phase A3 — Money / Currency / Int64 Representation (A3-01)
- **Item:** Full Money Boundary surgical refactor (OrderModel, OrderItemModel, CartService, CheckoutService, CheckoutPricingService, CheckoutState & CurrencyUtils) to Int64 VNĐ integer arithmetic; Pi payment code isolated.
- **Status:** PO_VERIFIED & PROTECTED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct real-device verification PASS on Samsung M51 (Owner) and Samsung Note 8 (Employee); `flutter analyze` 0 errors, `core_saas` test suite 69/69 PASS, debug APK build success (`build/app/outputs/flutter-apk/app-debug.apk`, SHA256: `83EDD6AB87AA012633515586F4BF8BE2D331BE51244F07739EA76CEEEC9C5856`).
- **Protected Components:**
  - `packages/core_saas/lib/models/order_model.dart`
  - `packages/core_saas/lib/models/order_item_model.dart`
  - `packages/core_saas/lib/services/cart_service.dart`
  - `packages/core_saas/lib/services/checkout_service.dart`
  - `packages/core_saas/lib/utils/currency_utils.dart`
  - `packages/feature_fnb_pos/lib/controllers/checkout/checkout_pricing_service.dart`
  - `packages/feature_fnb_pos/lib/controllers/checkout/checkout_state.dart`
- **Dependencies:** A0-FOUNDATION, A1.2, A2.2-01-FIX-02, A2-02
- **Next:** A3-02 — Orders & Order Lines State Engine

### [CHECKPOINT_ID: A3-04 (Payment & Table Closure Synchronization Fix)]
- **Phase:** Phase A3 — Payment & Table Closure Synchronization (A3-04)
- **Item:** Fix payment success order closure and table reset by correcting table collection path mismatch in backend Cloud Functions (`completePosPaymentHandler` & `loyalty_order.ts`) to target store-scoped `/stores/{storeId}/tables/{tableId}` and transition order status to `"closed"`.
- **Status:** READY_FOR_PO_VERIFICATION
- **Verified By:** Coding Agent (Technical & Build Verified)
- **Date:** 2026-09-26
- **Evidence:** `flutter analyze` 0 errors, `core_saas` test suite 69/69 PASS, debug APK build success (`build/app/outputs/flutter-apk/app-debug.apk`, SHA256: `83EDD6AB87AA012633515586F4BF8BE2D331BE51244F07739EA76CEEEC9C5856`).
- **Protected Components:** Backend payment completion handler & table reset pathway.
- **Dependencies:** A0-FOUNDATION, A1.2, A2.2-01-FIX-02, A2-02, A3-01, A3-02, A3-03
- **Next:** PO Real-Device Verification
- **Phase:** Phase A3 — Orders & Order Lines State Engine (A3-02)
- **Item:** Enforce canonical Order Header states (`active`, `finalized`, `closed`, `cancelled`), SaleLine states (`draft`, `submitted`, `preparing`, `ready`, `served`, `draft_cancelled`), dine-in (`tableId` required) vs takeaway (`tableId` absent) invariants, optimistic concurrency (CAS), and submission idempotency.
- **Status:** PO_VERIFIED & PROTECTED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct real-device verification PASS on Samsung M51 (Owner) and Samsung Note 8 (Employee); `flutter analyze` 0 errors, `core_saas` test suite 69/69 PASS, debug APK build success (`build/app/outputs/flutter-apk/app-debug.apk`, SHA256: `83EDD6AB87AA012633515586F4BF8BE2D331BE51244F07739EA76CEEEC9C5856`).
- **Protected Components:**
  - `packages/core_saas/lib/models/order_model.dart`
  - `packages/core_saas/lib/models/order_item_model.dart`
  - `packages/core_saas/lib/data/repos/order_repository.dart`
  - `packages/feature_fnb_pos/lib/controllers/table_order_controller.dart`
- **Dependencies:** A0-FOUNDATION, A1.2, A2.2-01-FIX-02, A2-02, A3-01
- **Next:** Subsequent Phase / Work Item (e.g. A3.3 / A4)

### [CHECKPOINT_ID: A3-06 (Shift Management UI & Active Shift Recovery)]
- **Phase:** Phase A3 — Shift Management UI & Canonical Backend Read Contract (A3-05 / A3-06)
- **Item:** Shift Management UI (`ShiftController`, `OpenShiftDialog`, `CloseShiftDialog`, `ShiftStatusBar`), canonical backend read contract `getActiveShift`, `getCommandReceipt`, mutationId preservation & Receipt reconciliation, and multi-device installation/verification.
- **Status:** PO_VERIFIED & PROTECTED & LOCKED
- **PO Verified By:** Tuấn (Chủ đầu tư / PO)
- **Date:** 2026-09-26
- **Evidence:** PO direct real-device verification PASS on Samsung Galaxy Note 8 (Close Shift 100.000 VNĐ → Phase 2 → Confirm → CLOSED; Open Shift 200.000 VNĐ → OPEN). APK SHA256: `6A264904D9DE6F6F5DAEFDFE48BA910E015DB7A240B3B585FD8637F83D4D65A0`.
- **Protected Components:**
  - `functions/src/shift/shift_canonical.ts`
  - `packages/core_saas/lib/models/shift_model.dart`, `shift_lock_model.dart`, `cash_entry_model.dart`
  - `packages/core_saas/lib/data/repos/shift_repository.dart`
  - `packages/core_saas/lib/services/shift_service.dart`
  - `packages/feature_fnb_pos/lib/controllers/shift_controller.dart`
  - `packages/feature_fnb_pos/lib/widgets/shift/open_shift_dialog.dart`, `close_shift_dialog.dart`, `shift_status_bar.dart`
- **Dependencies:** A0-FOUNDATION, A1.2, A2-02, A3-01, A3-02, A3-03, A3-05
- **Next:** Subsequent Phase / Work Item


## 4. Canonical parent / branch interpretation — 2026-09-26
Theo quyết định PO, A0/A1/A2/A3/A4... là parent stages; decimal IDs là nhánh/checkpoint bên dưới cùng parent prefix. Các record phía trên giữ nguyên như đã ghi tại thời điểm lịch sử.

- A2.2-01-FIX-02 là claim ở cấp nhánh A2; không có nghĩa A2 PASS.
- A2.2-02-FIX-03-BUILD-001 chỉ ghi nhận build/install scope; log nói PO test chức năng deferred.
- A3.3 là nhánh thuộc A3 theo taxonomy PO, nhưng checkpoint lịch sử mô tả table-map/logout-login. Không đổi tên/scope lịch sử và không dùng nó để chứng minh toàn A3 nếu thiếu crosswalk.
- A0/A1 whole-stage PO_VERIFIED/LOCKED claims trong hồ sơ lịch sử được giữ nguyên; thiếu crosswalk chi tiết là vấn đề truy xuất evidence, không hạ cấp kết quả đã ghi.
- LOCKED bảo vệ behavior/invariant và phạm vi checkpoint được chấp nhận. Danh sách file/component là impact reference, không mặc định mọi file từng chạm đều vĩnh viễn bất biến.
- Parent stage chỉ PASS khi toàn bộ scope/acceptance criteria của chính parent stage được chứng minh. Nhánh PASS không tự nâng parent.

Protection map và impact procedure: PROJECT_JOURNAL_V2.md.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.