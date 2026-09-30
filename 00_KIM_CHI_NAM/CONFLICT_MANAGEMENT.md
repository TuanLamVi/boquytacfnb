# CONFLICT MANAGEMENT — QUẢN LÝ VÀ GIẢI QUYẾT MÂU THUẪN

## Nguyên tắc khi phát hiện Mâu thuẫn giữa các Tài liệu

Khi phát hiện hai tài liệu, thông số hoặc hợp đồng có nội dung mâu thuẫn nhau:

1. **Nghiêm cấm tự chọn:** AI tuyệt đối không tự ý chọn một bản dựa trên cảm tính, tên file (`FINAL`, `LATEST`, `V2`), hoặc ngày commit mới hơn.
2. **Nghiêm cấm tự xóa:** Không tự ý xóa bỏ bản tài liệu cũ hoặc sửa lại lịch sử.
3. **Xác định nguồn gốc:** Truy xuất nguồn gốc, thời điểm ban hành và tác giả của từng bản.
4. **Xác định phạm vi:** Kiểm tra xem mỗi bản áp dụng cho Legacy System hay Clean Rebuild V5.1.
5. **Ghi nhận Mâu thuẫn:** Đánh dấu trạng thái `CONFLICT / UNRESOLVED` vào registry và báo cáo rõ nét.
6. **Thẩm quyền PO:** Nếu mâu thuẫn ảnh hưởng đến quy trình quản trị, kiến trúc hoặc nghiệp vụ V5.1, bắt buộc phải dừng lại (`STOP`) và trình PO Tuấn đưa ra quyết định chính thức (`PO DECISION`).

---

## Mâu thuẫn giữa các Hợp đồng Chuyên môn V5.1

Nếu phát hiện mâu thuẫn giữa 4 tài liệu hợp đồng V5.1 (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`):
- AI không tự ý điều chỉnh chuyên môn.
- Lập bảng so sánh điểm mâu thuẫn → Trình PO quyết định bản chuẩn chính thức.

---

## Những việc NGHIÊM CẤM

Không dùng:
- Trí nhớ AI (Memory);
- Giả định cá nhân;
- Tên file "FINAL" / "LATEST";
- Suy diễn ngầm

để tự động giải quyết mâu thuẫn mà không có `PO DECISION` được ghi nhận theo LAW-016.
