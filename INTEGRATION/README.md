# KẾT NỐI F&B SMART VỚI KIM CHỈ NAM

## Cấu trúc thật

```
fnb_smart\
├── AGENTS.md
├── android\
├── lib\
├── pubspec.yaml
└── fnb-smart-v5\
    ├── 00_KIM_CHI_NAM\
    ├── 01_STATE\
    ├── 02_CONTROL\
    ├── 03_EVIDENCE\
    ├── 05_SESSION\
    └── INTEGRATION\
```

## Ý nghĩa

- `fnb_smart`: ứng dụng.
- `fnb-smart-v5`: bộ luật và hồ sơ quản trị.
- GitHub `TuanLamVi/boquytacfnb`: nơi giữ bản chuẩn.

## Sau Work Item

Codex/Gemini cập nhật các file trong `fnb-smart-v5`, sau đó chạy:

```
SYNC_LOCAL_RECORDS_TO_GITHUB.ps1
```

## Không đưa code ứng dụng lên repository governance

Script chỉ gửi các thư mục governance được chỉ định.

## Quy tắc

GitHub = bản chuẩn.
Máy tính = bản đang dùng.
Git history = lịch sử thay đổi.
