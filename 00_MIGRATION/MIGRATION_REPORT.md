# MIGRATION REPORT — 2026-09-28

## Kết quả

Đã đọc và phân loại bộ RAR nguồn do PO cung cấp.

**Tổng số file tài liệu thực: 36.**

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
05_SESSION/
00_MIGRATION/
99_ARCHIVE/
```

## Nguyên tắc loại bỏ trùng

Không tạo thêm một file nhật ký chỉ để ghi lại cùng một thông tin.

- Luật → `KIM_CHI_NAM.md`
- Trạng thái hiện tại → `CURRENT_STATE.md`
- Quyết định PO → `PO_DECISION_REGISTER.md`
- Lịch sử Work Item → `WORK_ITEM_HISTORY.md`
- Checkpoint → `CHECKPOINTS.md`
- Bảo vệ → `PROTECTION_MAP.md`
- Hồi quy → `REGRESSION_LOG.md`
- Bằng chứng test → `TEST_EVIDENCE.md`
- Bàn giao → `AI_HANDOFF.md`

Các file cũ chỉ giữ lại khi có giá trị lịch sử, bằng chứng hoặc nguồn riêng cần truy nguyên.
