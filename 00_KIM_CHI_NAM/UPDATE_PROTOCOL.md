# UPDATE PROTOCOL — CÁCH CẬP NHẬT QUY TRÌNH & GOVERNANCE

## Mục tiêu

Giữ bộ quy tắc thống nhất, ngăn chặn việc tự ý sửa đổi luật giữa chừng và bảo đảm tài liệu quản trị luôn phản ánh chính xác quyết định của PO.

---

## Quy trình Thay đổi Bộ luật Governance (PO Freeze Baseline Protocol)

Sau Work Item này, bộ KIM CHỈ NAM được xem là **BASELINE ĐÃ PHONG TOẢ (FREEZE)**.
Nghiêm cấm AI / Coding Agent tự ý sửa đổi nội dung luật trong quá trình thực hiện các Work Item sản phẩm.

Mọi điều chỉnh luật trong tương lai bắt buộc phải trải qua 7 bước nghiêm ngặt:

```text
1. PO DECISION (Quyết định điều chỉnh luật từ PO Tuấn)
2. GOVERNANCE CHANGE PROPOSAL (Đề xuất thay đổi cụ thể)
3. IMPACT REVIEW (Phân tích ảnh hưởng toàn bộ quy trình & hợp đồng)
4. PO APPROVAL (PO chính thức phê duyệt đề xuất)
5. UPDATE REPOSITORY (Codex cập nhật file governance)
6. VERIFY DIFF (Kiểm tra diff không làm phát sinh mâu thuẫn)
7. FREEZE AGAIN (Tái phong tỏa bộ luật baseline mới)
```

---

## Cập nhật Hồ sơ Vận hành Thường xuyên

Khác với bộ luật KIM CHỈ NAM, các hồ sơ vận hành (`CURRENT_STATE`, `WORK_ITEM_HISTORY`, `PO_DECISION_REGISTER`, `CHECKPOINTS`, `PROTECTION_MAP`, `AI_HANDOFF`) được cập nhật theo quy trình đóng task chuẩn (LAW-015):

```text
SỬA ĐÚNG HỒ SƠ TẬP TRUNG
→ KIỂM TRA DIFF
→ GHI COMMIT CHÍNH XÁC
→ PUSH/SYNC GITHUB
```

---

## Đồng bộ Bản đọc HTML

`00_KIM_CHI_NAM/KIM_CHI_NAM.html` là bản đọc trực quan cho con người.
Khi bộ luật `00_KIM_CHI_NAM/KIM_CHI_NAM.md` thay đổi chính thức, `KIM_CHI_NAM.html` phải được cập nhật tương ứng để bảo đảm tính đồng bộ giao diện hiển thị.
