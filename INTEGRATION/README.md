# Gói kết nối KIM CHỈ NAM với Android Studio

## Dùng để làm gì?

Gói này giúp **Codex và Gemini trong Android Studio** nhìn thấy cùng một bộ quy tắc.

## Cài vào project F&B SMART

Chép:

`INTEGRATION/AGENTS.md`

vào **thư mục ngoài cùng của project F&B SMART** và đổi tên thành:

`AGENTS.md`

Sau đó chép thư mục:

`00_KIM_CHI_NAM/`
`01_STATE/`
`02_CONTROL/`
`03_EVIDENCE/`
`05_SESSION/`

vào:

`docs/boquytacfnb/`

## Sau khi chép

Cấu trúc phải giống:

```
F&B SMART V5/
├── AGENTS.md
├── android/
├── lib/
├── docs/
│   └── boquytacfnb/
│       ├── 00_KIM_CHI_NAM/
│       ├── 01_STATE/
│       ├── 02_CONTROL/
│       ├── 03_EVIDENCE/
│       └── 05_SESSION/
└── ...
```

## Lưu ý

- `AGENTS.md` là bảng chỉ đường.
- Markdown trong `docs/boquytacfnb/` là nội dung để AI đọc.
- HTML chỉ để Tuấn đọc dễ hơn.
- Bộ chuẩn gốc vẫn nằm ở repository `TuanLamVi/boquytacfnb`.

## Khi bộ quy tắc thay đổi

Không sửa riêng bản trong Android Studio rồi quên GitHub.

Quy trình:

```
GitHub
→ cập nhật bộ chuẩn
→ đồng bộ xuống Android Studio
→ Codex/Gemini đọc bản mới
```
