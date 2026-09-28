# WORK ITEM HISTORY

## Mục đích

Lưu lịch sử Work Item theo cách ngắn gọn, có thể truy lại bằng Git.

## Quy tắc

Mỗi Work Item cần ghi:
- ID;
- mục tiêu;
- phạm vi;
- kết quả kỹ thuật;
- PO status;
- evidence;
- checkpoint;
- protection;
- commit;
- ghi chú hồi quy nếu có.

Không dùng file này để thay thế CHECKPOINTS, DECISION LOG hoặc TEST EVIDENCE.

## Lịch sử nguồn

Bộ tài liệu PO cung cấp có một hồ sơ forensic riêng:
`docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`

Hồ sơ đó được giữ làm nguồn lịch sử. Các kết quả lịch sử không được viết lại để khớp trạng thái hiện tại.

## Mẫu thêm mục

### WORK ITEM: AI-START-01 — ROLLBACK & CANCELLED
- Date: 2026-09-28
- Objective: Gỡ bỏ hoàn toàn màn hình AI START khỏi ứng dụng F&B SMART theo chỉ đạo của PO.
- Scope: `lib/features/ai_start/ai_start_commands_page.dart` (DELETED), `lib/main.dart` (RESTORED), `packages/feature_fnb_pos/lib/views/main_layout_view.dart` (RESTORED).
- Technical Result: CANCELLED / VOID — WRONG TARGET. Đã thực hiện surgical rollback sạch sẽ, gỡ bỏ route `/ai-start`, xóa file `ai_start_commands_page.dart`. Chạy `flutter analyze` PASSED.
- PO Verification: NOT PERFORMED (CANCELLED BY PO)
- Code Rollback: COMPLETED
- Reason: PO clarified AI START must be an external HTML utility, not an F&B SMART application feature.
- Protection: NONE / NOT PROTECTED / NOT LOCKED
- Next: A6-02 — PO verification on Samsung Note 8 & Samsung M51.

