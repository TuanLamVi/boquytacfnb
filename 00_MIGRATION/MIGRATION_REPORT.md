# MIGRATION REPORT — 2026-09-28

## Kết quả

Đã đọc và phân loại bộ RAR nguồn do PO cung cấp.

Tổng số file nguồn: **40** (bao gồm các file Markdown và thư mục rỗng trong archive inventory; nội dung thực tế gồm 40 tài liệu).

## Kết luận phân loại

- Active governance: rehabilitation rulebook.
- Governance V2: DRAFT — NOT YET ADOPTED.
- Project contracts: giữ vai trò tài liệu chuyên môn.
- Audits: historical/forensic.
- Current state: snapshot theo ngày nguồn, không tự coi là trạng thái runtime mới nhất.
- HTML: bản đọc cho con người.
- Markdown: nguồn dữ liệu để Git/Codex/AI đọc và cập nhật.

## Canonical design

```
00_KIM_CHI_NAM/
01_STATE/
02_CONTROL/
03_EVIDENCE/
04_PROJECT_REFERENCE/
05_SESSION/
99_ARCHIVE/
```

## Luật cập nhật

Work Item hoàn tất → cập nhật đúng record → commit → push → GitHub.

Không tạo thêm nhật ký trùng chỉ để báo cáo.
