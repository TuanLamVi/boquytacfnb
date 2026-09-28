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

### WORK ITEM: AI START SCREEN — F&B SMART V5
- Date: 2026-09-28
- Objective: Tạo màn hình tiện ích nội bộ AI Start Commands và tích hợp route `/ai-start`
- Scope: `lib/features/ai_start/ai_start_commands_page.dart` và `lib/main.dart`
- Technical Result: Màn hình utility hiển thị 2 nút copy prompt cho ChatGPT và Codex/Gemini bằng Flutter Clipboard API (`Clipboard.setData`), có SnackBar thông báo. Chạy `flutter analyze` thành công.
- PO Verification: PENDING (READY_FOR_PO_REVIEW)
- Evidence: `flutter analyze` PASSED, UI tiện ích độc lập không đụng chạm POS/Firestore/Business logic.
- Checkpoint: AI-START-01
- Protection: None (Chưa PO_VERIFIED, không đụng tới vùng LOCKED)
- Commit: Uncommitted (DIRTY worktree)
- Next: PO Verification

