# STATUS MODEL — MÔ HÌNH TRẠNG THÁI

## 1. Các Trạng thái Công việc (Work Item Status)

- `NOT_STARTED`: Chưa bắt đầu.
- `IN_PROGRESS`: Đang triển khai thực thi.
- `READY_FOR_PO_VERIFICATION`: Đã hoàn thành phần kỹ thuật, đủ bằng chứng, chờ PO kiểm tra.
- `PO_VERIFICATION_PENDING`: Đang trong quá trình PO kiểm tra nghiệm thu.
- `PO_VERIFIED`: Đã được PO Tuấn kiểm tra thực tế và xác nhận PASS.
- `PASS_TEMPORARY`: Tạm thời trôi qua kiểm thử kỹ thuật, chưa được PO xác nhận.
- `FAILED`: Kiểm thử kỹ thuật hoặc nghiệm thu thất bại.
- `BLOCKED`: Bị nghẽn do phụ thuộc, mâu thuẫn hoặc lỗi First Failure.
- `REGRESSION`: Phát hiện tính năng đã chấp nhận trước đây bị hỏng.
- `UNPROVEN`: Thiếu bằng chứng kỹ thuật hoặc chưa qua kiểm thử.
- `REPORT_FORMAT_BLOCKED`: Báo cáo sai định dạng LAW-013.

---

## 2. Các Trạng thái Bảo vệ (Protection Status)

- `PROTECTED`: Đã được kiểm tra tác động và thiết lập rào chắn bảo vệ.
- `LOCKED`: Đã qua `PO_VERIFIED` và được đóng băng hành vi/invariant.

---

## 3. Các Trạng thái Chế độ Vận hành (Operating Mode Status)

- `REHABILITATION`: Đang trong chế độ phục hồi/sửa chữa hệ thống cũ.
- `CLEAN_REBUILD`: Đang trong chế độ xây mới F&B SMART V5.1 từ đầu.
- `FROZEN`: Hệ thống cũ đã bị đóng băng, chỉ dùng làm Read-Only Forensic Reference.

---

## 4. Nghiêm cấm Đánh đồng Trạng thái

```text
AI PASS ≠ READY_FOR_PO_VERIFICATION ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED
```

- AI PASS chỉ đại diện cho kết quả test tự động của AI.
- Không dùng kết quả build thành công (`Build SUCCESS`) để tự suy ra chức năng `PO_VERIFIED`.
- Child PASS không tự động nâng Parent thành PASS.
- Trạng thái của Legacy Codebase tuyệt đối KHÔNG tự động dùng để tuyên bố trạng thái PASS cho Clean Rebuild V5.1.
