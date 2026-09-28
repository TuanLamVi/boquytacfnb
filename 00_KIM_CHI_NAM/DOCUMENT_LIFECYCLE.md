# DOCUMENT LIFECYCLE — VÒNG ĐỜI TÀI LIỆU

## Các Nhãn Vòng đời Tài liệu

- `CURRENT / ACTIVE`: Tài liệu đang có hiệu lực áp dụng thực tế.
- `BASELINE`: Hợp đồng/quy tắc nền tảng đã được PO phê duyệt và đóng băng (Freeze).
- `HISTORICAL`: Bằng chứng/nhật ký lịch sử được lưu giữ để phục vụ forensic.
- `FROZEN`: Tài liệu/hệ thống cũ bị đóng băng, chỉ dùng làm Read-Only Forensic Reference.
- `SUPERSEDED`: Tài liệu đã được thay thế chính thức bằng phiên bản mới theo PO Decision.
- `AUDIT SNAPSHOT`: Bức ảnh chụp trạng thái kiểm toán tại một thời điểm nhất định.
- `DRAFT`: Bản nháp chưa được PO phê duyệt chính thức (ví dụ: `governance_v2/*`).

---

## Nguyên tắc Quản lý Vòng đời

1. **Tên file không tự phong quyền:** Tên file hoặc ngày sửa đổi mới hơn không tự động biến tài liệu thành nguồn chuẩn nếu chưa có quyết định áp dụng từ PO.
2. **Khi thay thế tài liệu (Supersede):**
   - Giữ nguyên tài liệu lịch sử cũ;
   - Liên kết rõ ràng tài liệu mới thay thế tài liệu nào;
   - Ghi nhận số `PO DECISION` cho phép thay thế;
   - Cập nhật nhật ký `PO_DECISION_REGISTER.md`.
3. **Bảo tồn Forensic Evidence:** Bằng chứng lịch sử không được phép chỉnh sửa lại chỉ để khớp với trạng thái hiện tại.
