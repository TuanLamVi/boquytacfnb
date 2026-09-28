# 05 — NHẬT KÝ QUYẾT ĐỊNH (DECISION LOG)

## 1. NGUYÊN TẮC
- Tài liệu này ghi lại toàn bộ các quyết định quan trọng của PO (Product Owner) hoặc quyết định đồng thuận giữa PO và AI trong suốt quá trình phục hồi dự án.
- AI tuyệt đối không tự ý bịa đặt hoặc ghi nhận các quyết định của PO khi chưa có xác nhận thực tế.

---

## 2. MẪU GHI NHẬN QUYT ĐỊNH CHUẨN (TEMPLATE)

```markdown
### [DECISION_ID: e.g., DEC-2026-001]
- **Date:** YYYY-MM-DD
- **Decision:** [Mô tả ngắn gọn quyết định]
- **Reason:** [Lý do đưa ra quyết định]
- **Affected Phase:** Phase X
- **Affected Files:** [Danh sách file ảnh hưởng]
- **Decided By:** PO
```

---

## 3. DANH SÁCH QUYẾT ĐỊNH

### DEC-R0-001
- **Date:** 2026-03-31
- **Decision:** Phê duyệt thiết lập bộ khung kim chỉ nam và 11 tài liệu quản lý phục hồi dự án F&B SMART (`docs/rehabilitation/`).
- **Reason:** Cần chuẩn hóa kỷ luật kiểm soát dự án, ngăn chặn việc sửa đổi lan man, không kiểm soát và tách biệt rõ ràng AI Result với PO Verification.
- **Affected Phase:** Phase 0 — Rehabilitation Governance
- **Affected Files:** `docs/rehabilitation/*`
- **Decided By:** PO (Đang chờ xác nhận chính thức)

### DEC-A0-001
- **Date:** 2026-09-24
- **Decision:** A0 Foundation officially accepted by PO and locked.
- **Reason:** PO Tuấn verified application opens normally, no immediate crash, startup/login screen reachable, no critical Firebase/initialization error observed, initial startup routing works normally, and build baseline A0-BUILD-001 previously PO_VERIFIED.
- **Affected Phase:** Phase A0 & A1
- **Affected Files:** `docs/rehabilitation/*`
- **Decided By:** Tuấn — Chủ đầu tư
- **Result:** A0 PO_VERIFIED / LOCKED. Next Phase: A1 — Account & Store.

### DEC-A3.3-TABLEMAP-FIX-01
- **Date:** 2026-06-25
- **Decision:** Phê duyệt nghiệm thu PASS A3.3-TABLEMAP-LOGOUT-LOGIN-FIX-01 trên cả Samsung M51 và Samsung Note 8; khóa checkpoint A3.3.
- **Reason:** PO Tuấn kiểm chứng thực tế xác nhận 100% PASS cho Initial Login, Logout → Login (không còn kẹt "Đang nạp Profile"), Multitask Re-entry và Force Close Re-entry.
- **Affected Phase:** Phase A3.3 — Table State Management & Real-Time Sync
- **Affected Files:** `packages/core_saas/lib/services/table_realtime_service.dart`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A3.3 PO_VERIFIED & LOCKED.

### DEC-A1-05-PO-EVIDENCE
- **Date:** 2026-10-24
- **Decision:** Ghi nhận PO Evidence cho A1-05 (Surgical fix active membership routing). Tuấn trực tiếp kiểm thử trên Samsung Note8 (Serial: 988e50385a3931435330) với bản build A1-06 (v4.6.9-rc17 Debug).
- **Reason:** PO xác nhận đăng nhập thành công bằng tài khoản có sẵn, ứng dụng đi thẳng vào Dashboard ở trạng thái sẵn sàng bán hàng.
- **Affected Phase:** Phase A1 — Account & Store Routing
- **Affected Files:** `packages/core_saas/lib/services/auth_routing_service.dart`
- **Decided By:** Tuấn — Chủ đầu tư / PO (PO Evidence recorded; PO_VERIFIED: NO, PO Test in progress for inactive/revoked scenarios).

### DEC-GOV-025
- **Date:** 2026-09-26
- **Decision:** Phê duyệt bổ sung chính thức luật quản trị "WORK ITEM CLOSURE & PROTECTION RULE" vào Kim Chỉ Nam của dự án F&B SMART V5.
- **Reason:** Chuẩn hóa chu trình đóng, nghiệm thu và bảo vệ Work Item qua 5 bước: `PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED`. Quy định rõ thẩm quyền PO_VERIFIED duy nhất thuộc về PO Tuấn, bảo vệ hành vi/invariant thay vì khóa cứng file vật lý, bắt buộc phân tích `LOCKED SCOPE IMPACT` khi thực hiện task mới và thiết lập quy trình UNLOCK chính thức.
- **Affected Phase:** Phase GOV — Dự án Governance & Administration
- **Affected Files:** `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md`, `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md`, `docs/rehabilitation/03_CHECKPOINTS.md`, `docs/rehabilitation/05_DECISION_LOG.md`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** PO_VERIFIED & LOCKED (PO Tuấn xác nhận quyết định quản trị GOV-025 chính thức áp dụng làm luật chung cho dự án).

### DEC-A2-02
- **Date:** 2026-09-26
- **Decision:** Phê duyệt nghiệm thu PASS A2-02 (Employee Quầy POS + Table Map) và khóa checkpoint A2-02.
- **Reason:** PO Tuấn trực tiếp kiểm tra trên thiết bị thật và xác nhận PASS (Nhân viên Quầy POS nhìn thấy bàn, mở được bàn, nhìn thấy menu trong bàn).
- **Affected Phase:** Phase A2 — Nhân viên & Phân quyền (Staff & Permissions)
- **Affected Files:** `packages/core_saas/lib/services/table_realtime_service.dart`, `packages/feature_fnb_pos/lib/controllers/table_map_controller.dart`, `packages/feature_fnb_pos/lib/widgets/table/zone_selector_widget.dart`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A2-02 PO_VERIFIED / PROTECTED / LOCKED.

### DEC-GOV-026
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức xác nhận `PO_VERIFIED GOV-026` sau khi kiểm tra kết quả audit consistency và closure synchronization (Codex audit result: PASS, mutation: NO, stale findings: NONE, missing evidence: NONE).
- **Reason:** Đảm bảo toàn bộ hệ thống tài liệu quản trị phản ánh đúng trạng thái thực tế đã được PO nghiệm thu, không còn khoảng trống trạng thái.
- **Scope:** Chỉ tài liệu quản trị; không sửa code, không build, không Firebase.
- **Status:** `PO_VERIFIED`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** GOV-026 PO_VERIFIED.

### DEC-PO-ASSIGN-MONEY-CURRENCY-INT64
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức chỉ định Work Item tiếp theo: `Money / Currency / Int64 Representation` (Phase 3).
- **Reason:** Tiếp tục tiến trình cải tạo F&B SMART V5 theo roadmap sau khi hoàn tất A2-02 và GOV-026.
- **Affected Phase:** Phase 3 — Money / Currency / Int64 Representation
- **Status:** `ASSIGNED / PENDING EXECUTION`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Work Item assigned.

### DEC-GOV-027
- **Date:** 2026-09-26
- **Decision:** PO Tuấn trực tiếp xác nhận `PO_VERIFIED GOV-027` cho LAW-016 (PO Decision Bridge & Repository Recording).
- **Reason:** Chuẩn hóa quy trình ghi nhận quyết định PO từ ChatGPT vào repository, tránh tranh chấp trạng thái và đảm bảo mọi quyết định vận hành đều có Codex evidence.
- **Affected Phase:** Phase GOV — Governance & Administration (GOV-027)
- **Affected Files:** `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md`, `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md`, `docs/rehabilitation/02_CURRENT_STATE.md`, `docs/rehabilitation/09_AI_HANDOFF.md`, `docs/rehabilitation/06_CHANGE_LOG.md`, `docs/rehabilitation/03_CHECKPOINTS.md`
- **Status:** `PO_VERIFIED` (Protected: No, Locked: No — pending regression check per GOV-025)
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** GOV-027 PO_VERIFIED.

### DEC-GOV-028
- **Date:** 2026-09-26
- **Decision:** PO Tuấn trực tiếp xác nhận `PO_VERIFIED GOV-028` cho LAW-017 (Session Reentry & No-Memory Authority).
- **Reason:** Đảm bảo mọi phiên làm việc mới, trang chat mới hoặc việc tiếp nhận lại project phải dựa hoàn toàn vào repository governance thay vì trí nhớ hay lịch sử chat cũ (Repository Wins).
- **Affected Phase:** Phase GOV — Governance & Administration (GOV-028)
- **Affected Files:** `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md`, `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md`, `docs/rehabilitation/02_CURRENT_STATE.md`, `docs/rehabilitation/09_AI_HANDOFF.md`, `docs/rehabilitation/06_CHANGE_LOG.md`, `docs/rehabilitation/03_CHECKPOINTS.md`
- **Status:** `PO_VERIFIED` (Protected: No, Locked: No — pending regression check per GOV-025)
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** GOV-028 PO_VERIFIED.

### DEC-PO-ASSIGN-MONEY-CURRENCY-INT64
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức gán Canonical Work Item ID `A3-01` cho `Money / Currency / Int64 Representation` (Phase 3) và phê duyệt phạm vi triển khai:
  1. Canonical Work Item ID: `A3-01`
  2. Pi code: `Option B — Cô lập / Disable khỏi canonical money flow`.
  3. OrderModel scope: `Option B — Full Money Boundary` (Refactor OrderModel + Checkout & Cart services + CurrencyUtils sang Int64 VNĐ).
- **Reason:** Chuẩn hóa toàn bộ tính toán tiền tệ sang Int64 VNĐ ở phạm vi Order & Checkout theo đúng Database Schema V0.1 và Product Charter V5.1, đồng thời cô lập Pi code khỏi luồng money chính thức dưới Canonical Work Item ID `A3-01`.
- **Affected Phase:** Phase 3 / A3 — Money / Currency / Int64 Representation
- **Status:** `ASSIGNED / SCOPE APPROVED`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Canonical Work Item ID A3-01 assigned with approved boundary scope.

### DEC-A3-01-VERIFIED
- **Date:** 2026-09-26
- **Decision:** Phê duyệt nghiệm thu PASS A3-01 (Money / Currency / Int64 Representation — Full Money Boundary + Pi Isolation) và khóa checkpoint A3-01.
- **Reason:** PO Tuấn trực tiếp kiểm tra trên thiết bị thật (Samsung M51 Owner & Samsung Note 8 Employee) xác nhận toàn bộ luồng Order, Cart, Pricing và Checkout hoạt động chính xác với Int64 VNĐ integer VNĐ arithmetic, không có lỗi tiền tệ hay hồi quy.
- **Affected Phase:** Phase A3 — Money / Currency / Int64 Representation (A3-01)
- **Affected Files:** `packages/core_saas/lib/models/order_model.dart`, `packages/core_saas/lib/models/order_item_model.dart`, `packages/core_saas/lib/services/cart_service.dart`, `packages/core_saas/lib/services/checkout_service.dart`, `packages/core_saas/lib/utils/currency_utils.dart`, `packages/feature_fnb_pos/lib/controllers/checkout/checkout_pricing_service.dart`, `packages/feature_fnb_pos/lib/controllers/checkout/checkout_state.dart`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A3-01 PO_VERIFIED / PROTECTED / LOCKED.

### DEC-PO-ASSIGN-ORDERS-STATE-ENGINE
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức gán Canonical Work Item ID `A3-02` cho `Orders & Order Lines State Engine` (Phase 3).
- **Reason:** Tiếp tục tiến trình cải tạo F&B SMART V5 theo roadmap sau khi hoàn tất A3-01 dưới Canonical Work Item ID `A3-02`.
- **Affected Phase:** Phase 3 / A3 — Orders & Order Lines State Engine
- **Canonical Work Item ID:** `A3-02`
- **Status:** `ASSIGNED / PENDING EXECUTION`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Canonical Work Item ID A3-02 assigned.

### DEC-A3-02-VERIFIED
- **Date:** 2026-09-26
- **Decision:** Phê duyệt nghiệm thu PASS A3-02 (Orders & Order Lines State Engine) và khóa checkpoint A3-02 thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Reason:** PO Tuấn trực tiếp kiểm tra trên thiết bị thật (Samsung M51 Owner & Samsung Note 8 Employee) xác nhận luồng Orders & Order Lines State Engine hoạt động chính xác với Int64 VNĐ integer arithmetic, không có lỗi trạng thái hay hồi quy.
- **Affected Phase:** Phase A3 — Orders & Order Lines State Engine (A3-02)
- **Affected Files:** `packages/core_saas/lib/models/order_model.dart`, `packages/core_saas/lib/models/order_item_model.dart`, `packages/core_saas/lib/data/repos/order_repository.dart`, `packages/feature_fnb_pos/lib/controllers/table_order_controller.dart`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A3-02 PO_VERIFIED / PROTECTED / LOCKED.

### DEC-PAYMENT-TABLE-CLOSE-FIX
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức gán Canonical Work Item ID `A3-04` cho `Payment & Table Closure Synchronization Fix` và phê duyệt triển khai surgical fix cho lỗi thanh toán thành công nhưng order và bàn không đóng.
- **Reason:** Cập nhật backend Cloud Function `completePosPaymentHandler` và `loyalty_order.ts` để chuyển Order status sang `"closed"` và cập nhật đúng collection path `/stores/{storeId}/tables/{tableId}` sang status `"available"` và xóa `currentOrderId`.
- **Affected Phase:** Phase 3 / A3-04 — Payment & Table Closure Synchronization
- **Canonical Work Item ID:** `A3-04`
- **Affected Files:** `functions/src/loyalty/loyalty_payment.ts`, `functions/src/loyalty/loyalty_order.ts`
- **Status:** `IMPLEMENTED / READY_FOR_PO_VERIFICATION`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Canonical Work Item ID A3-04 assigned and surgical fix implemented.

### DEC-FINANCIAL-FOUNDATION-DECOMPOSE-001
- **Date:** 2026-09-26
- **Decision:** PO Tuấn đồng ý tạm dừng A3-04, chuyển trọng tâm sang xây dựng Financial System theo STATE MACHINES V0.1, và phê duyệt định nghĩa phân rã Financial Foundation Work Item trước khi implementation.
- **Reason:** Thiết lập nền tảng tài chính chuẩn (Shift/ShiftLock & PaymentAttempt/Settlement) thay vì tiếp tục vá legacy payment flow.
- **Affected Phase:** Phase 6 / Financial System Canonical Build
- **Canonical ID:** NOT YET DEFINED (Pending PO / Governance Assignment)
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Financial Foundation Work Item defined; awaiting PO assignment.

### DEC-PO-ASSIGN-A3-05
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức ASSIGN Work Item Foundation đầu tiên cho Financial System với Canonical ID `A3-05`: `Shift & ShiftLock State Machine & Data Model Foundation`.
- **Reason:** Bắt đầu xây dựng nền tảng tài chính chuẩn theo STATE MACHINES V0.1 và DATABASE_SCHEMA V0.1, bắt đầu từ Shift/ShiftLock và CashEntry foundation với đầy đủ bảo vệ hồi quy cho A3-01, A3-02, A3-03.
- **Affected Phase:** Phase 3 / A3-05 — Financial System Foundation (Shift & ShiftLock)
- **Canonical Work Item ID:** `A3-05`
- **Status:** `ASSIGNED / READ-FIRST PENDING`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Canonical Work Item ID A3-05 officially assigned by PO.

### DEC-PO-FINANCIAL-SHIFT-UI-DEFINE-001
- **Date:** 2026-09-26
- **Decision:** PO Tuấn đồng ý mở Work Item cho Shift Management UI, phụ thuộc A3-05, để có thể sử dụng và PO nghiệm thu Shift / ShiftLock trên thiết bị thực tế.
- **Reason:** Cung cấp giao diện PO Verification Surface cho Shift Management (mở ca, đóng ca, kiểm đếm tiền) tích hợp trực tiếp với backend A3-05.
- **Affected Phase:** Phase 3 / Financial UI
- **Canonical ID:** NOT YET DEFINED (Pending PO / Governance Assignment; proposed: A3-06)

### DEC-A3-06-VERIFIED
- **Date:** 2026-09-26
- **Decision:** Phê duyệt nghiệm thu PASS A3-06 (Shift Management UI & Active Shift Recovery) và khóa checkpoint A3-06 thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Reason:** PO Tuấn trực tiếp kiểm tra trên thiết bị thực tế (Samsung Galaxy Note 8) và xác nhận PASS (App nhận ca đang mở → Đóng ca 100.000 VNĐ → Chuyển đúng Phase 2 → Xác nhận chênh lệch → Hoàn tất đóng ca thành công → Mở ca lại 200.000 VNĐ thành công).
- **Affected Phase:** Phase 3 / A3-06 — Shift Management UI & Canonical Read Contract (getActiveShift)
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A3-06 PO_VERIFIED / PROTECTED / LOCKED.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Shift Management UI Work Item defined; awaiting PO assignment.
