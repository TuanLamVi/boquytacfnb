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

### WORK ITEM: A6-02 — FRESH ARTIFACT VERIFICATION
- Date: 2026-09-28
- Objective: Khởi tạo Fresh Debug APK Artifact cho PO Verification A6-02 theo chỉ đạo chọn Phương án 2 của PO Tuấn.
- Technical Result: Build fresh debug APK thành công. Cài đặt và khởi động PASS trên Samsung Galaxy Note 8 (`SM-N950F`).
- Artifact History:
  - Artifact 1 (2026-09-26): SHA256 `4056223A8CA034D4BF68E58D8CDFFE1F2F56F25E22A5E700F680EE07DF0D3A52`
  - Fresh Artifact (2026-09-28 13:39:37): SHA256 `AB42AFBFD9BEB239DE71E5207DBF4742E289FD09CF0CD67DD8C37C139D5AA6C7` | Size: 216,954,169 bytes | Package: `com.tuan.fnbsmart` | Version: 1.4.0 (13)
- Device Verification:
  - Samsung Galaxy Note 8 (`SM-N950F`): Streamed Install SUCCESS | `versionName=1.4.0`, `versionCode=13`.
  - Samsung Galaxy M51 (`SM-M515F`): Streamed Install SUCCESS | `versionName=1.4.0`, `versionCode=13`.
- PO Verification: PENDING (READY_FOR_PO_VERIFICATION)
- Protection: NONE (Chưa PO_VERIFIED, duy trì bảo vệ A3-01, A3-02, A3-03, A3-05, A3-06, GP-01)
- Next: PO Verification A6-02 trên Samsung Note 8 và Samsung M51.


