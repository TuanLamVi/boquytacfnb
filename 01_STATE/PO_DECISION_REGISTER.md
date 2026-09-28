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

### DEC-2026-PO-PAYMENT-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chỉ định dừng vá luồng thanh toán cũ (A6-02 First Failure), chuyển sang triển khai nghiệp vụ Thanh toán mới theo chuẩn F&B SMART V5.1 và Database Schema V0.1 (beginCheckout, postInvoice, PaymentAttempt, Settlement, Cash, VietQR, Debt Lite, Split Payment).
- **Reason:** Phát hiện First Failure trong A6-02 giữa thanh toán ngay khi gọi món và thanh toán sau khi rời bàn quay lại. PO yêu cầu chuẩn hóa triệt để theo Product Charter V5.1 và Database Schema V0.1 thay vì tiếp tục vá luồng thanh toán cũ.
- **Affected Phase:** Phase 3 / Payment Domain (F&B SMART V5.1)
- **Affected Files:** `packages/core_saas/lib/data/repos/order_repository.dart`, `packages/core_saas/lib/models/order_model.dart`, `packages/feature_fnb_pos/lib/controllers/checkout/`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** PO_VERIFIED INPUT. Dependent on A3-02 (`PO_VERIFIED / PROTECTED / LOCKED`) → **UNLOCK REQUIRED FROM PO**.

### DEC-2026-A3-02-UNLOCK
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức cấp lệnh **UNLOCK CÓ PHẠM VI GIỚI HẠN** cho A3-02 (`PO_VERIFIED / PROTECTED / LOCKED`) phục vụ việc triển khai Payment V5.1.
- **Reason:** Cần chuẩn hóa canonical Order & Order Lines integration cho Checkout/Payment, khắc phục sự bất đồng bộ giữa Flow A và Flow B, bảo đảm cả hai flow sử dụng cùng canonical Order / Order Lines source (`/stores/{storeId}/orders/{orderId}/lines/{lineId}`).
- **Unlock Scope:** 
  1. Chuẩn hóa canonical Order / Order Lines integration cho Checkout/Payment.
  2. Sửa sự không đồng bộ giữa hai Payment entry points (Flow A và Flow B).
  3. Bảo đảm cả hai flow dùng cùng canonical Order / Order Lines source.
  4. Thực hiện regression test cho A3-02 liên quan Payment.
  5. Khôi phục lại Protection / LOCKED sau khi hoàn tất và được PO xác nhận.
- **Affected Invariants:** Order items vs Canonical order lines subcollection sync.
- **Test Plan:** Regression testing for Flow A (Pay immediately) and Flow B (Leave table -> return -> pay), ensuring no missing items.
- **Relock Condition:** Sau khi hoàn thành implementation và test PASS theo xác nhận của PO.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** UNLOCK GRANTED (LIMITED SCOPE FOR PAYMENT V5.1).
