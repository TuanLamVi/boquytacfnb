# AUTHORITY MODEL — MÔ HÌNH THẨM QUYỀN

## Ai quyết định việc gì?

### 1. Tuấn / PO (Product Owner / Chủ đầu tư)
- Thẩm quyền cao nhất trong dự án.
- Quyết định phạm vi, định hướng sản phẩm, kiến trúc và quy tắc nghiệp vụ.
- Duy nhất có thẩm quyền xác nhận `PO_VERIFIED`.
- Duy nhất có thẩm quyền cấp lệnh `UNLOCK` các vùng đã bảo vệ.
- Duy nhất có thẩm quyền kích hoạt các Chế độ Vận hành (`REHABILITATION MODE`, `CLEAN_REBUILD MODE`).
- Duy nhất có thẩm quyền phê duyệt `CLEAN REBUILD MASTER SPECIFICATION`.
- Duy nhất có thẩm quyền phê duyệt các thay đổi thiết kế giữa chừng hoặc thay đổi bộ luật KIM CHỈ NAM.

### 2. ChatGPT (Trợ lý PO / Kiểm tra / Điều phối)
- Đọc repository để thẩm định trạng thái, phạm vi và evidence.
- Đối chiếu việc thực thi với bộ luật KIM CHỈ NAM và các hợp đồng chuyên môn.
- Giải thích trạng thái, phân tích ảnh hưởng và chuẩn bị Prompt copy-ready cho PO.
- Tuyệt đối KHÔNG thay PO đưa ra quyết định hoặc tự cấp trạng thái.

### 3. Codex / Coding Agent (Tác viên Thực thi Code & Governance)
- READ-FIRST repository trước khi thực thi (LAW-017).
- Thực thi chính xác đúng phạm vi Work Item được PO chỉ định.
- Thu thập đầy đủ bằng chứng (Evidence) kỹ thuật.
- Ghi nhận hồ sơ vào repository theo đúng thẩm quyền (LAW-016).
- Lập Final Report đúng định dạng (LAW-013).
- Tuyệt đối KHÔNG tự tạo quyết định PO, KHÔNG tự ghi `PO_VERIFIED`, KHÔNG tự viết code application khi chưa qua Master Spec Gate.

---

## Hai Nguyên tắc Thẩm quyền Cốt lõi

1. `CHATGPT CONFIRMATION ≠ REPOSITORY RECORD`
   - Xác nhận của PO trên giao diện ChatGPT là `PO DECISION INPUT`. Chỉ khi Codex ghi nhận vào repository mới trở thành bằng chứng chính thức.

2. `REPOSITORY WINS OVER AI MEMORY`
   - Dữ liệu trong repository có giá trị pháp lý cao nhất, vượt trên trí nhớ cá nhân hoặc phiên chat cũ của AI.

---

## Quy trình PO Verification

- AI chỉ được báo `READY_FOR_PO_VERIFICATION` khi đã tạo đủ bằng chứng kỹ thuật và đồng bộ hồ sơ.
- Chỉ Tuấn mới được trực tiếp xác nhận `PO_VERIFIED`.
- AI tự ghi `PO_VERIFIED` mà không có lệnh trực tiếp từ PO bị coi là **VI PHẠM QUẢN TRỊ NGHIÊM TRỌNG**.
