# AI READ-FIRST — F&B SMART V5

## Mục đích

Đây là file chỉ đường cho ChatGPT/Codex khi bắt đầu một phiên làm việc với repository này.

## Thứ tự đọc

1. `00_KIM_CHI_NAM/KIM_CHI_NAM.md`
2. `00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md`
3. `01_STATE/CURRENT_STATE.md`
4. `01_STATE/WORK_ITEM_HISTORY.md`
5. `02_CONTROL/PROTECTION_MAP.md`
6. `02_CONTROL/REGRESSION_LOG.md`
7. Các tài liệu dự án/evidence liên quan trực tiếp đến Work Item đang làm.

## Luật làm việc

- Không dùng trí nhớ cuộc trò chuyện để thay thế tài liệu trong repository.
- Không tự ý đổi luật trong KIM CHỈ NAM.
- Không coi một Work Item là PASS chỉ vì một phần nhỏ đã PASS.
- Không sửa một phần đã được bảo vệ nếu chưa có quy trình mở khóa phù hợp.
- Khi phát hiện hồi quy ở phần đã được xác nhận trước đó: STOP, ghi nhận, cô lập nguyên nhân, rồi mới xử lý theo quy tắc.
- Mọi thay đổi quan trọng phải có lịch sử Git.
- Sau mỗi Work Item hoàn tất, phải cập nhật các record liên quan và đồng bộ lên GitHub.

## Mục tiêu

Repository phải luôn đủ thông tin để một phiên ChatGPT/Codex mới có thể:
- biết dự án đang ở đâu;
- biết điều gì đã được bảo vệ;
- biết Work Item nào đã hoàn tất;
- biết Work Item nào đang làm;
- biết việc gì cần làm tiếp theo;
- truy lại được bằng chứng và lịch sử thay đổi.
