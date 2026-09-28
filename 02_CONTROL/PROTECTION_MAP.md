# PROTECTION MAP

## Mục đích

Theo dõi những phần của dự án đã được xác nhận và bảo vệ khỏi việc sửa đổi tùy ý.

## Trạng thái

- OPEN — đang mở, có thể làm việc theo Work Item.
- PASS — đã đạt yêu cầu của Work Item.
- LOCKED — đã khóa sau khi xác nhận.
- PROTECTED — được coi là baseline cần bảo vệ.
- UNLOCK REQUIRED — phải có bước mở khóa phù hợp trước khi sửa.

## Quy tắc

- Không tự ý chuyển trạng thái bảo vệ.
- Một Work Item PASS không tự động làm toàn bộ Phase PASS.
- Khi thay đổi ảnh hưởng phần PROTECTED/LOCKED: STOP và xác định quy trình mở khóa.
- Mỗi thay đổi quan trọng phải có Git history.

## Danh mục bảo vệ

Chưa nhập dữ liệu lịch sử từ bộ RAR nguồn.
