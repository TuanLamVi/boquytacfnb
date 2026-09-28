# AGENTS — F&B SMART V5

## Project layout

Trong máy PO:

```
C:\Users\Admin\Desktop\Android\fnb_smart\
├── android\
├── lib\
├── pubspec.yaml
├── ...
└── fnb-smart-v5\
    └── bộ KIM CHỈ NAM / governance
```

**Thư mục `fnb_smart` là project ứng dụng.**

**Thư mục `fnb-smart-v5` là kho bộ quy tắc.**

## Việc phải làm trước

Đọc:

1. `fnb-smart-v5/00_KIM_CHI_NAM/AI_READ_FIRST.md`
2. `fnb-smart-v5/00_KIM_CHI_NAM/KIM_CHI_NAM.md`
3. `fnb-smart-v5/00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md`
4. `fnb-smart-v5/01_STATE/CURRENT_STATE.md`
5. `fnb-smart-v5/02_CONTROL/CHECKPOINTS.md`
6. `fnb-smart-v5/02_CONTROL/PROTECTION_MAP.md`
7. `fnb-smart-v5/02_CONTROL/REGRESSION_LOG.md`
8. `fnb-smart-v5/00_KIM_CHI_NAM/LOGGING_PROTOCOL.md`
9. Tài liệu kỹ thuật liên quan trực tiếp đến việc đang làm.

## Vai trò

- Tuấn = PO / người quyết định.
- ChatGPT = trợ lý PO / kiểm tra / điều phối.
- Codex/Gemini = hỗ trợ thực hiện trong đúng phạm vi.

## Ghi nhật ký

Ghi vào các file đã quy định trong `fnb-smart-v5/`.

Không tạo một file nhật ký mới cho mỗi lần chạy.

## Đồng bộ máy → GitHub

Sau khi hoàn tất Work Item và cập nhật record:

```
powershell -ExecutionPolicy Bypass -File ".\fnb-smart-v5\INTEGRATION\SYNC_LOCAL_RECORDS_TO_GITHUB.ps1"
```

Không báo "đã đồng bộ" nếu lệnh chưa báo thành công.

## Đồng bộ GitHub → máy

Khi cần lấy bản governance mới:

```
powershell -ExecutionPolicy Bypass -File ".\fnb-smart-v5\INTEGRATION\SYNC_GOVERNANCE_FROM_GITHUB.ps1"
```

Script tạo bản sao lưu trước khi cập nhật.

## Bảo vệ luật

Không tự động đẩy thay đổi của:

`fnb-smart-v5/00_KIM_CHI_NAM/KIM_CHI_NAM.md`

lên GitHub bằng quy trình sync thường.

Thay đổi LAW/KIM CHỈ NAM phải có quyết định/authorization phù hợp của PO.

## Không được làm

- Không dùng memory thay repository.
- Không tự ghi `PO_VERIFIED`.
- Không tự mở `LOCKED`.
- Không coi child PASS là parent PASS.
- Regression ở vùng đã bảo vệ → STOP.
- Không xóa lịch sử.
- Không tự sửa/xóa thay đổi của PO.

## Nếu thiếu thông tin

Không đoán.

Báo `UNPROVEN / BLOCKED` và dừng.
