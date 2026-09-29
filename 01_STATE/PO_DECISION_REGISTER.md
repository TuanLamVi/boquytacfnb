# 05 — NHẬT KÝ QUYẾT ĐỊNH (PO DECISION REGISTER)

## 1. NGUYÊN TẮC
- Tài liệu này ghi lại toàn bộ các quyết định chính thức của PO Tuấn (Product Owner) hoặc quyết định được PO phê duyệt theo LAW-016.
- AI tuyệt đối không tự ý giả định hoặc ghi nhận quyết định của PO khi chưa có xác nhận thực tế và lệnh ghi nhận chính thức.

---

## 2. DANH SÁCH QUYẾT ĐỊNH

### DEC-2026-GOV-OFFICIAL-CLEAN-REBUILD-SOURCE-RULE
- **Date:** 2026-09-29
- **Decision:** PO Tuấn chính thức quy định và phê duyệt (PROMPT-146): Ban hành 10 quy tắc bắt buộc về phân định 3 repository (`Official Clean Rebuild Source Repository` = `TuanLamVi/fnb-smart-v5-clean-rebuild`, `Governance Repository` = `TuanLamVi/boquytacfnb`, `Legacy Source Mirror` = `TuanLamVi/fnb-smart-source`). Mọi Work Item Clean Rebuild chỉ được công nhận `IMPLEMENTATION DONE` khi có source commit thực tế trên `TuanLamVi/fnb-smart-v5-clean-rebuild`. Cấm báo cáo false implementation chỉ dựa trên governance diff.
- **Affected Phase:** Governance V5.1 — Official Clean Rebuild Source Rule Baseline
- **Affected Files:** `00_KIM_CHI_NAM/KIM_CHI_NAM.md`, `KIM_CHI_NAM.html`, `SOURCE_OF_TRUTH.md`, `REPORT_TEMPLATE.md`, `CURRENT_STATE.md`, `CHECKPOINTS.md`, `PO_DECISION_REGISTER.md`, `WORK_ITEM_HISTORY.md`, `PROTECTION_MAP.md`, `AI_HANDOFF.md`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / BASELINE FREEZE`.

### DEC-2026-A0-REBUILD-01-AUTHORIZED
- **Date:** 2026-09-29
- **Decision:** PO Tuấn chính thức cho phép và ủy quyền: `Cho phép làm lại A0 Clean Rebuild thật sự` (`CLEAN-REBUILD-A0-FOUNDATION-REBUILD-01`), xây dựng nền móng A0 mới hoàn toàn từ đầu (`clean_rebuild_v5/`) tách biệt hoàn toàn với Legacy / Rehabilitation.
- **Affected Phase:** Clean Rebuild V5.1 — A0 Rebuild Foundation Gate
- **Affected Files:** `clean_rebuild_v5/**/*`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `AUTHORIZED FOR IMPLEMENTATION`.

### DEC-2026-GOV-AI-WORKING-DISCIPLINE
- **Date:** 2026-09-29
- **Decision:** PO Tuấn yêu cầu chính thức lưu quy tắc làm việc của AI / ChatGPT / Coding Agent (`AI Working Discipline & Prompt Quality Gate`) vào KIM CHỈ NAM để mọi phiên làm việc sau bắt buộc tuân thủ (Repository-First, No Work Item Guessing, Authorization Check, Prompt Self-Audit, Zero Stale Status, Next ≠ Authorization, Evidence-First, Implementation ≠ Verification, Close-Out Synchronization, Clean Rebuild/Legacy Boundary, Report Format Gate, No Assumption Rule, ChatGPT Role Boundary, Pre-Flight, Post-Prompt Review, Principle responsibility, Prompt as technical instruction).
- **Affected Phase:** Governance V5.1
- **Affected Files:** `00_KIM_CHI_NAM/KIM_CHI_NAM.md`, `KIM_CHI_NAM.html`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / BASELINE FREEZE`.

### DEC-2026-A0-FOUNDATION-PO-VERIFIED
- **Date:** 2026-09-29
- **Decision:** PO Tuấn chính thức phê duyệt (PO_VERIFIED) cho **Clean Rebuild A0 Foundation** (`CLEAN-REBUILD-A0-FOUNDATION`).
- **Reason:** Nghiệm thu thực tế cấu trúc workspace, packages/core_saas, core infrastructure skeleton, security baseline (Firebase Auth + App Check contracts), và tenant/store isolation foundation. Phê duyệt chuyển trạng thái thành `PO_VERIFIED / PROTECTED / LOCKED`.
- **Affected Phase:** Clean Rebuild V5.1 — A0 Foundation Gate
- **Affected Files:** `packages/core_saas/lib/*`, State & Control Records
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-SHIFT-CLOSING-S2-S3-RULE
- **Date:** 2026-09-29
- **Decision:** PO Tuấn chính thức xác nhận quy tắc đóng ca cho Clean Rebuild V5.1: `Closing Shift is blocked by pending payment attempts only.` Không dùng `active orders` làm guard bắt buộc của S2/S3 trong Clean Rebuild V5.1.
- **Supersedes:** Điểm 5 của `DEC-2026-A6-SHIFT`.
- **Scope:** Clean Rebuild V5.1 (S2/S3 require `pendingAttemptCount = 0`).
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** PO Decision Recorded & Superseded.

### DEC-2026-MASTER-SPEC-PO-VERIFIED
- **Date:** 2026-09-29
- **Decision:** PO Tuấn chính thức phê duyệt (PO_VERIFIED) cho **Clean Rebuild Master Specification V5.1** (`99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`).
- **Reason:** Hoàn tất toàn bộ các vòng kiểm toán kỹ thuật hợp đồng (Product Charter V5.1, Database Schema V0.1, State Machines V0.1, Query Cost Budget V0.1) và đóng 2-scope closure G1/G3. Phê duyệt chuyển trạng thái thành `PO_VERIFIED / PROTECTED / LOCKED` (Golden Governance Baseline).
- **Affected Phase:** Clean Rebuild V5.1 — Master Specification Gate
- **Affected Files:** `fnb-smart-v5/99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md`
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-GOV-PROMPT-110-112-APPROVAL
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức phê duyệt (PO APPROVAL):
  1. Prompt-110 (Governance Change Proposal & Impact Review)
  2. Prompt-111 (Governance Identity & Closure Reconciliation)
  3. Prompt-112 (A7 Reports & Analytics Canonical Status Reconciliation - maintained at FINAL CONFIRMED / READY FOR PO_VERIFIED)
- **Reason:** Hoàn tất kiểm toán quản trị và hòa giải ID/Closure theo yêu cầu của PO Tuấn. Cho phép chuyển sang bước Governance Implementation trong prompt tiếp theo.
- **Affected Phase:** Governance V5.1
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_APPROVED / GOVERNANCE APPROVED`.

### DEC-R0-001
- **Date:** 2026-03-31
- **Decision:** Phê duyệt thiết lập bộ khung kim chỉ nam và 11 tài liệu quản lý phục hồi dự án F&B SMART (`docs/rehabilitation/`).
- **Reason:** Cần chuẩn hóa kỷ luật kiểm soát dự án, ngăn chặn việc sửa đổi lan man, không kiểm soát và tách biệt rõ ràng AI Result với PO Verification.
- **Affected Phase:** Phase 0 — Rehabilitation Governance
- **Affected Files:** `docs/rehabilitation/*`
- **Decided By:** PO Tuấn

### DEC-A0-001
- **Date:** 2026-09-24
- **Decision:** A0 Foundation officially accepted by PO and locked.
- **Reason:** PO Tuấn verified application opens normally, no immediate crash, startup/login screen reachable, no critical Firebase/initialization error observed.
- **Affected Phase:** Phase A0 & A1
- **Decided By:** Tuấn — Chủ đầu tư
- **Result:** A0 PO_VERIFIED / LOCKED.

### DEC-A3.3-TABLEMAP-FIX-01
- **Date:** 2026-06-25
- **Decision:** Phê duyệt nghiệm thu PASS A3.3-TABLEMAP-LOGOUT-LOGIN-FIX-01 trên cả Samsung M51 và Samsung Note 8; khóa checkpoint A3.3.
- **Reason:** PO Tuấn kiểm chứng thực tế xác nhận 100% PASS cho Initial Login, Logout → Login, Multitask Re-entry và Force Close Re-entry.
- **Affected Phase:** Phase A3.3
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A3.3 PO_VERIFIED & LOCKED.

### DEC-GOV-025
- **Date:** 2026-09-26
- **Decision:** Phê duyệt bổ sung chính thức luật quản trị "WORK ITEM CLOSURE & PROTECTION RULE" vào Kim Chỉ Nam của dự án F&B SMART V5.
- **Reason:** Chuẩn hóa chu trình đóng, nghiệm thu và bảo vệ Work Item qua 5 bước: `PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED`.
- **Affected Phase:** Governance
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** PO_VERIFIED & LOCKED.

### DEC-A2-02
- **Date:** 2026-09-26
- **Decision:** Phê duyệt nghiệm thu PASS A2-02 (Employee Quầy POS + Table Map) và khóa checkpoint A2-02.
- **Reason:** PO Tuấn trực tiếp kiểm tra trên thiết bị thật và xác nhận PASS (Nhân viên Quầy POS nhìn thấy bàn, mở được bàn, nhìn thấy menu trong bàn).
- **Affected Phase:** Phase A2
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** A2-02 PO_VERIFIED / PROTECTED / LOCKED.

### DEC-GOV-026
- **Date:** 2026-09-26
- **Decision:** PO Tuấn chính thức xác nhận `PO_VERIFIED GOV-026` sau khi kiểm tra kết quả audit consistency và closure synchronization.
- **Scope:** Tài liệu quản trị.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** GOV-026 PO_VERIFIED.

### DEC-2026-PO-PAYMENT-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chỉ định dừng vá luồng thanh toán cũ (A6-02 First Failure), chuyển sang triển khai nghiệp vụ Thanh toán mới theo chuẩn F&B SMART V5.1 và Database Schema V0.1.
- **Reason:** Phát hiện First Failure trong A6-02 giữa thanh toán ngay khi gọi món và thanh toán sau khi rời bàn quay lại.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** Transition from legacy payment fix to Clean Rebuild V5.1.

### DEC-2026-CLEAN-REBUILD-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức kích hoạt `CLEAN_REBUILD MODE` cho dự án F&B SMART V5.1.
- **Reason:** Khởi động xây dựng lại ứng dụng sạch từ đầu theo đúng bộ hợp đồng chuyên môn V5.1, chấm dứt chuỗi vá lỗi legacy.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** CLEAN_REBUILD MODE = ACTIVE, Legacy System = FROZEN.

### DEC-2026-GOVERNANCE-BASELINE-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức phê duyệt bộ luật quản trị KIM CHỈ NAM điều chỉnh cho hai chế độ REHABILITATION MODE và CLEAN_REBUILD MODE.
- **Content:**
  1. Điều chỉnh KIM CHỈ NAM thành bộ luật chung duy nhất làm BASELINE FREEZE cho cả hệ thống cũ và mới.
  2. Tuyệt đối không đụng vào application code trong Work Item này.
  3. Xác định hai chế độ vận hành: REHABILITATION MODE và CLEAN_REBUILD MODE.
  4. Quyết định LEGACY FREEZE: Khi CLEAN_REBUILD MODE kích hoạt, Legacy System bị đóng băng hoàn toàn làm Read-Only Forensic Reference. Nghiêm cấm tiếp tục patch legacy code.
  5. Tách biệt tuyệt đối Legacy và New System V5.1.
  6. Áp dụng nguyên tắc Contract-First: Yêu cầu → Thiết kế → Dữ liệu → Trạng thái → Quy tắc giao tiếp → Kiểm tra → Code.
  7. Thiết lập Cổng Master Specification Gate: Phải có Clean Rebuild Master Specification được PO duyệt trước khi viết application code mới.
  8. Cấm tự ý thay đổi thiết kế giữa chừng nếu chưa qua quy trình STOP → Impact Review → PO Decision.
  9. Giữ nguyên 4 hợp đồng chuyên môn V5.1 (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`).
  10. Chuẩn hóa tham số Work Item Clean Rebuild (`BUILD MODE = CLEAN_REBUILD`).
  11. Áp dụng quy tắc Provenance: `EXACT SOURCE COMMIT → EXACT BUILD → EXACT DEPLOYMENT`.
  12. Cập nhật CURRENT STATE: `A6-02 = BLOCKED / LEGACY FROZEN`, `CLEAN_REBUILD_V5.1 = ACTIVE`, `NEXT = CLEAN REBUILD MASTER SPECIFICATION`.
  13. Chuyển bộ luật KIM CHỈ NAM thành PO FREEZE BASELINE.
- **Affected Files:** All governance files in `fnb-smart-v5/00_KIM_CHI_NAM/`, `01_STATE/`, `02_CONTROL/`, `05_SESSION/`.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / BASELINE FREEZE`. Next Step: Clean Rebuild Master Specification.

### DEC-2026-REF-ARCHITECTURE-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận `PO_VERIFIED / PROTECTED / LOCKED` cho **F&B SMART V5.1 REFERENCE ARCHITECTURE LIBRARY** (Prompt 061).
- **Content:**
  1. Phê duyệt 12 reference repositories (REF-001 đến REF-012) làm tài liệu nghiên cứu kiến trúc tham khảo.
  2. Xác nhận ranh giới: `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`.
  3. Khẳng định F&B Smart Authority luôn thắng mọi xung đột thiết kế.
  4. Khóa cứng tài liệu thành Reference Architecture Library Baseline V5.1 trong repository.
- **Affected Files:** `docs-123/REFERENCE_ARCHITECTURE_LIBRARY_V5.1.md`, `fnb-smart-v5/99_ARCHIVE_SOURCE/REFERENCE_ARCHITECTURE_LIBRARY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-071-01, 071-02, 071-03 (PROMPT 071 DECISIONS)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 03 quyết định quan trọng cho F&B Smart V5.1:
  1. **DECISION 071-01 (Multi-Store Staff Confirmed):** Một User/nhân viên được phép làm việc tại nhiều Store (nhiều store trong cùng Tenant hoặc store của Tenant khác qua các Membership riêng biệt). Mỗi Store có Membership và Permission độc lập.
  2. **DECISION 071-02 (Table Merge + Transfer Confirmed):** Chính thức đưa tính năng Ghép bàn (`Table Merge`) và Chuyển bàn (`Table Transfer`) vào phạm vi V5.1. Nhân viên thực hiện theo quyền được Chủ quán cấp.
  3. **DECISION 071-03 (Permission Effective Immediately Confirmed):** Khi Chủ quán thay đổi quyền Lego của nhân viên, quyền mới có hiệu lực ngay lập tức (`Permission effective immediately`).
- **Affected Files:** `STAFF_LEGO_PERMISSION_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt quy tắc thu tiền nhiều lần và ranh giới công nợ cho F&B Smart V5.1 (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-CHECKOUT-PAYMENT-V5.1 (PROMPT 084/085/086 CHECKOUT & PAYMENT)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho toàn bộ phân hệ **Checkout & Payment Product Discovery** (Prompts 084/085/086):
  1. **Payment & KDS Independence:** Checkout, Cash, payOS QR, Split payment, and Debt Lite are completely independent of KDS readiness (`Ready ≠ Payment Gate`, `Served ≠ Payment Gate`).
  2. **Debt Lite (Sổ nợ):** `Ghi nợ ≠ Đã nhận tiền` (recording debt adds to customer ledger). Valid debt recording leads to Order closure and Table cleaning (`Occupied → Cleaning → Available`).
  3. **Promotions & Discounts:** Simple MVP scope covering item-level, order-level discounts, and vouchers/coupons with strict precedence/non-stacking rules.
  4. **Post-Invoice Immutable History:** Prohibits direct staff editing of historical monetary amounts post-invoice posting.
  5. **LEGO Permission Model:** Governed strictly by store membership capabilities; effective immediately.
  6. **Offline Boundary:** Financial settlement is strictly online-required / server final authority.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-TM-03, TM-04, TM-05 (PROMPT 074 DECISIONS)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức phê duyệt các quyết định Table Merge & Transfer cho F&B Smart V5.1:
  1. **DECISION-TM-03 (Table Merge Confirmed):** Ghép bàn bảo toàn Order gốc (Order A và Order B độc lập, quản lý qua service group reference, không xóa order cũ, giữ nguyên lịch sử).
  2. **DECISION-TM-04 (Post-Checkout Restriction Confirmed):** Cấm Ghép bàn và Chuyển bàn sau khi Order đã bắt đầu Checkout hoặc Invoice đã được post.
  3. **DECISION-TM-05 (Partial Transfer Deferred to Post-MVP):** Chuyển một phần SaleLine (Partial Transfer) bị hoãn sang Post-MVP; MVP chỉ hỗ trợ chuyển toàn bộ Order / toàn bộ nhóm khách.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt quy tắc thu tiền nhiều lần và ranh giới công nợ cho F&B Smart V5.1 (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-CHECKOUT-PAYMENT-V5.1 (PROMPT 084/085/086 CHECKOUT & PAYMENT)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho toàn bộ phân hệ **Checkout & Payment Product Discovery** (Prompts 084/085/086):
  1. **Payment & KDS Independence:** Checkout, Cash, payOS QR, Split payment, and Debt Lite are completely independent of KDS readiness (`Ready ≠ Payment Gate`, `Served ≠ Payment Gate`).
  2. **Debt Lite (Sổ nợ):** `Ghi nợ ≠ Đã nhận tiền` (recording debt adds to customer ledger). Valid debt recording leads to Order closure and Table cleaning (`Occupied → Cleaning → Available`).
  3. **Promotions & Discounts:** Simple MVP scope covering item-level, order-level discounts, and vouchers/coupons with strict precedence/non-stacking rules.
  4. **Post-Invoice Immutable History:** Prohibits direct staff editing of historical monetary amounts post-invoice posting.
  5. **LEGO Permission Model:** Governed strictly by store membership capabilities; effective immediately.
  6. **Offline Boundary:** Financial settlement is strictly online-required / server final authority.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-BUSINESS-MODELS-MENU-V5.1
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận `PO_VERIFIED / PROTECTED / LOCKED` cho **PROMPT 066 — 20 BUSINESS MODELS & MENU TEMPLATE STRUCTURE**.
- **Content:**
  1. Phê duyệt 20 mô hình kinh doanh và cấu trúc Menu Template.
  2. Xác nhận cơ chế Store Menu clone độc lập từ System Menu Template.
  3. Phê duyệt quy tắc Product Options có thể miễn phí hoặc có phụ phí tùy cấu hình.
  4. Phê duyệt Topping min/max áp dụng ở cấp từng Topping riêng lẻ.
  5. Xác nhận Bún/Phở và Cà phê là Representative Models.
  6. Các mô hình giá phức tạp (Seafood, Buffet, Combo) được xếp loại TBD / deferred sang post-MVP.
- **Affected Files:** `docs-123/BUSINESS_MODELS_MENU_TEMPLATES_V5.1.md`, `fnb-smart-v5/99_ARCHIVE_SOURCE/BUSINESS_MODELS_MENU_TEMPLATES_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-071-01, 071-02, 071-03 (PROMPT 071 DECISIONS)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 03 quyết định quan trọng cho F&B Smart V5.1:
  1. **DECISION 071-01 (Multi-Store Staff Confirmed):** Một User/nhân viên được phép làm việc tại nhiều Store (nhiều store trong cùng Tenant hoặc store của Tenant khác qua các Membership riêng biệt). Mỗi Store có Membership và Permission độc lập.
  2. **DECISION 071-02 (Table Merge + Transfer Confirmed):** Chính thức đưa tính năng Ghép bàn (`Table Merge`) và Chuyển bàn (`Table Transfer`) vào phạm vi V5.1. Nhân viên thực hiện theo quyền được Chủ quán cấp.
  3. **DECISION 071-03 (Permission Effective Immediately Confirmed):** Khi Chủ quán thay đổi quyền Lego của nhân viên, quyền mới có hiệu lực ngay lập tức (`Permission effective immediately`).
- **Affected Files:** `STAFF_LEGO_PERMISSION_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt quy tắc thu tiền nhiều lần và ranh giới công nợ cho F&B Smart V5.1 (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-CHECKOUT-PAYMENT-V5.1 (PROMPT 084/085/086 CHECKOUT & PAYMENT)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho toàn bộ phân hệ **Checkout & Payment Product Discovery** (Prompts 084/085/086):
  1. **Payment & KDS Independence:** Checkout, Cash, payOS QR, Split payment, and Debt Lite are completely independent of KDS readiness (`Ready ≠ Payment Gate`, `Served ≠ Payment Gate`).
  2. **Debt Lite (Sổ nợ):** `Ghi nợ ≠ Đã nhận tiền` (recording debt adds to customer ledger). Valid debt recording leads to Order closure and Table cleaning (`Occupied → Cleaning → Available`).
  3. **Promotions & Discounts:** Simple MVP scope covering item-level, order-level discounts, and vouchers/coupons with strict precedence/non-stacking rules.
  4. **Post-Invoice Immutable History:** Prohibits direct staff editing of historical monetary amounts post-invoice posting.
  5. **LEGO Permission Model:** Governed strictly by store membership capabilities; effective immediately.
  6. **Offline Boundary:** Financial settlement is strictly online-required / server final authority.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-TM-03, TM-04, TM-05 (PROMPT 074 DECISIONS)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức phê duyệt các quyết định Table Merge & Transfer cho F&B Smart V5.1:
  1. **DECISION-TM-03 (Table Merge Confirmed):** Ghép bàn bảo toàn Order gốc (Order A và Order B độc lập, quản lý qua service group reference, không xóa order cũ, giữ nguyên lịch sử).
  2. **DECISION-TM-04 (Post-Checkout Restriction Confirmed):** Cấm Ghép bàn và Chuyển bàn sau khi Order đã bắt đầu Checkout hoặc Invoice đã được post.
  3. **DECISION-TM-05 (Partial Transfer Deferred to Post-MVP):** Chuyển một phần SaleLine (Partial Transfer) bị hoãn sang Post-MVP; MVP chỉ hỗ trợ chuyển toàn bộ Order / toàn bộ nhóm khách.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt quy tắc thu tiền nhiều lần và ranh giới công nợ cho F&B Smart V5.1 (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_CONFIRMED`.

### DEC-2026-CHECKOUT-PAYMENT-V5.1 (PROMPT 084/085/086 CHECKOUT & PAYMENT)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho toàn bộ phân hệ **Checkout & Payment Product Discovery** (Prompts 084/085/086):
  1. **Payment & KDS Independence:** Checkout, Cash, payOS QR, Split payment, and Debt Lite are completely independent of KDS readiness (`Ready ≠ Payment Gate`, `Served ≠ Payment Gate`).
  2. **Debt Lite (Sổ nợ):** `Ghi nợ ≠ Đã nhận tiền` (recording debt adds to customer ledger). Valid debt recording leads to Order closure and Table cleaning (`Occupied → Cleaning → Available`).
  3. **Promotions & Discounts:** Simple MVP scope covering item-level, order-level discounts, and vouchers/coupons with strict precedence/non-stacking rules.
  4. **Post-Invoice Immutable History:** Prohibits direct staff editing of historical monetary amounts post-invoice posting.
  5. **LEGO Permission Model:** Governed strictly by store membership capabilities; effective immediately.
  6. **Offline Boundary:** Financial settlement is strictly online-required / server final authority.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-A6-SHIFT (PROMPT 089/094/095 SHIFT MANAGEMENT & CASH DRAWER)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho phân hệ **A6 — Shift Management & Cash Drawer Product Discovery** (Prompts 089/094/095):
  1. **No Fixed Cashier & Multi-Staff Service:** Không thu ngân cố định; nhiều nhân viên cùng phục vụ và thu tiền theo Lego permission.
  2. **Multi-Collection & Multi-Tender:** Thu tiền nhiều lần theo Bàn/Order, `Còn phải thu ≠ Nợ`, Ghi nợ là quyết định riêng (`Còn phải thu → Ghi nợ → Sổ nợ`).
  3. **Physical Cash Isolation:** Chỉ tiền mặt thực tế đã thu mới đi vào két tiền ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
  4. **Opening Cash Immutability:** Tiền đầu ca không sửa trực tiếp sau khi mở ca; sai sót dùng phiếu điều chỉnh/thu chi bổ sung.
  5. **Close Shift Blocking & Handover:** Đóng ca cấm khi còn bàn/order phục vụ hoặc payment pending; bàn giao ca linh hoạt giữa các nhóm nhân viên.
  6. **Table Flow Wording:** `Đang phục vụ → Chờ dọn (Cleaning) → Nhân viên xác nhận đã dọn → Bàn trống (Available)`. `Chờ dọn → Gọi thêm món → Đang phục vụ`.
- **Affected Files:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-091 (PROMPT 091 PARTIAL COLLECTION & DEBT BOUNDARY)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức xác nhận và phê duyệt `PO_VERIFIED / PROTECTED / LOCKED` cho **Partial Collection & Debt Boundary** (Prompt 091):
  1. **Còn phải thu ≠ Nợ:** Khoản tiền chưa thu đủ (`Còn phải thu`) chỉ có nghĩa là bill chưa thu xong; tuyệt đối không tự động chuyển thành `Nợ`. `Partial Payment ≠ Debt`.
  2. **Ghi nợ là quyết định riêng:** Chỉ khi quán chủ động đồng ý cho khách nợ thì `Còn phải thu` mới chuyển thành `Ghi nợ` (Sổ nợ).
  3. **Multi-Staff & Multi-Tender:** Hỗ trợ thu tiền nhiều lần, kết hợp nhiều hình thức (Cash + QR, Cash + Cash, v.v.), nhiều nhân viên cùng thu tiền (lưu vết operator ID, timestamp, tender method).
  4. **Tách bạch két tiền A6 Shift:** Chỉ phần tiền mặt thực tế thu mới đi vào két tiền mặt của ca. QR, `Còn phải thu` và `Ghi nợ` không thuộc két tiền mặt.
- **Affected Files:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md`, `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.

### DEC-2026-090-FLOW-UPDATE (TABLE FLOW ENTRY BRANCHES)
- **Date:** 2026-09-28
- **Decision:** PO Tuấn chính thức chốt 2 hướng từ BÀN TRỐNG: (1) BÀN TRỐNG → ĐẶT TRƯỚC → Vào bàn; (2) BÀN TRỐNG → KHÁCH TRỰC TIẾP → Vào bàn. `ĐẶT TRƯỚC` là tính năng tùy chọn, KHÔNG phải bước bắt buộc trước khi vào bàn.
- **Affected Files:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md`, Governance State files.
- **Decided By:** Tuấn — Chủ đầu tư / PO
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`.
