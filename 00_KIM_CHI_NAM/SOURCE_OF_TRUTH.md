# SOURCE OF TRUTH — NGUỒN SỰ THẬT

## Quy tắc chung

Repository GitHub (`boquytacfnb` / `fnb-smart-v5`) là nơi duy nhất lưu bản chuẩn của bộ quy tắc quản trị (Governance) và các ghi chép vận hành được kiểm soát.

---

## Thứ bậc Nguồn sự thật (Hierarchy)

### 1. KIM CHỈ NAM / LAW (Bộ luật Quản trị Cao nhất)
Nguồn quy tắc quản trị cao nhất điều chỉnh quy trình, thẩm quyền, trạng thái, bảo vệ và hai chế độ vận hành.

- File chính: `00_KIM_CHI_NAM/KIM_CHI_NAM.md`
- Bản đọc phụ: `00_KIM_CHI_NAM/KIM_CHI_NAM.html`
- Không được tự ý sửa đổi trong quá trình làm Work Item sản phẩm. Mọi thay đổi quy trình phải có PO Decision chính thức.

### 2. HỢP ĐỒNG CHUYÊN MÔN V5.1 (V5.1 Technical Contracts)
Nguồn sự thật chính thức về nghiệp vụ, kiến trúc, schema và quy tắc hệ thống cho F&B SMART V5.1:
1. `PRODUCT_CHARTER_V5.1.md`
2. `DATABASE_SCHEMA_V0.1.md`
3. `STATE_MACHINES_V0.1.md`
4. `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`

*(Nằm trong `99_ARCHIVE_SOURCE/` hoặc thư mục được PO quy định).*
Governance điều chỉnh quy trình; không tự ý thay đổi nội dung chuyên môn của các hợp đồng này.

### 3. LEGACY SYSTEM (Hệ thống cũ — Reference Only)
- Khi `CLEAN_REBUILD MODE` được kích hoạt: **LEGACY SYSTEM = FROZEN**.
- Legacy codebase, database cũ và tài liệu liên quan chỉ đóng vai trò là **Read-Only Forensic Reference** (tham khảo nghiệp vụ, lịch sử, lỗi đã xảy ra và bài học kỹ thuật).

### 4. HỒ SƠ VẬN HÀNH VÀ TRẠNG THÁI (Operational Records)
Hồ sơ phản ánh trạng thái thực tế và lịch sử vận hành của repository:
- `01_STATE/CURRENT_STATE.md`: Trạng thái dự án và Work Items hiện tại.
- `01_STATE/WORK_ITEM_HISTORY.md`: Lịch sử các Work Item đã thực hiện, kết quả và bằng chứng.
- `01_STATE/PO_DECISION_REGISTER.md`: Nhật ký quyết định chính thức của PO.
- `02_CONTROL/CHECKPOINTS.md`: Registry danh sách checkpoint.
- `02_CONTROL/PROTECTION_MAP.md`: Bản đồ các vùng đã `PROTECTED / LOCKED`.
- `02_CONTROL/REGRESSION_LOG.md`: Nhật ký ghi nhận lỗi regression.
- `03_EVIDENCE/TEST_EVIDENCE.md` & `BUILD_BASELINE.md`: Bằng chứng kiểm thử và thông số build.
- `05_SESSION/AI_HANDOFF.md`: Thông tin bàn giao giữa các phiên AI.

---

## Quy tắc Chống Nhầm lẫn & Giải quyết Mâu thuẫn

1. **Tên file không quyết định bản chuẩn:** Ngày tạo hay tên file như `LATEST`, `FINAL`, `V2` không tự động biến tài liệu thành nguồn chuẩn.
2. **Khi có hai tài liệu mâu thuẫn:**
   - Không tự ý xóa tài liệu nào;
   - Không tự chọn bản theo ý AI;
   - Xác định nguồn gốc và mốc thời gian;
   - Ghi nhận trạng thái `CONFLICT / UNRESOLVED`;
   - Trình PO Tuấn đưa ra quyết định chính thức (`PO DECISION`).
3. **Repository Wins over AI Memory:** Mọi tuyên bố trạng thái bắt buộc phải dựa trên tài liệu thực tế trong repository, không dựa vào trí nhớ phiên chat của AI.
