# CODEX — KIM CHỈ NAM / GOVERNANCE MIGRATION

## Mục tiêu

Migrate bộ tài liệu chuẩn do PO cung cấp vào repository `TuanLamVi/boquytacfnb`, giữ nguyên ý nghĩa và khả năng truy vết.

Nguồn đầu vào hiện tại trên máy PO:

`docs - chuan- đang thực thi.rar`

## Quy tắc bắt buộc

1. READ-FIRST:
   - Đọc file này trước.
   - Sau đó kiểm tra toàn bộ repository hiện tại.
   - Không dùng trí nhớ hội thoại để thay thế nội dung nguồn.
2. Không tự ý sửa, diễn giải lại hoặc hạ cấp một LAW/governance rule.
3. Không xóa dữ liệu nguồn. Dữ liệu chưa xác định phải được giữ trong khu vực archive/source.
4. Không coi một file là Source of Truth chỉ vì tên file có chữ "final", "latest", "v2", v.v.
5. Khi có trùng lặp hoặc mâu thuẫn, phải ghi nhận vào migration report và giữ nguyên các bản nguồn.
6. Không chạm vào source code của ứng dụng F&B SMART trong migration này.
7. Chỉ làm việc trên branch:
   `codex/migrate-kim-chi-nam-20260928`
8. Không merge vào `main`.

## Quy trình

### A. Inventory

- Giải nén RAR vào thư mục tạm.
- Liệt kê toàn bộ file/folder, kích thước, ngày sửa đổi nếu có, loại file.
- Tính SHA-256 cho các file nguồn quan trọng nếu có thể.
- Ghi inventory vào:
  `docs/00_MIGRATION/SOURCE_INVENTORY.md`

### B. Classification

Phân loại từng tài liệu vào một trong các nhóm:

- GOVERNANCE / LAW
- AUTHORITY / PO DECISION
- CURRENT STATE
- WORK ITEM HISTORY
- PROTECTION / LOCK
- REGRESSION / CONTROL
- EVIDENCE
- PROJECT REFERENCE
- SESSION / HANDOFF
- DUPLICATE
- CONFLICT
- ARCHIVE

Không xóa bản nguồn trong bước này.

Ghi kết quả vào:
`docs/00_MIGRATION/MIGRATION_MAP.md`

### C. Canonical repository layout

Sau khi đọc nội dung thật, tổ chức bản canonical theo cấu trúc:

```
00_KIM_CHI_NAM/
01_STATE/
02_CONTROL/
03_EVIDENCE/
04_PROJECT_REFERENCE/
05_SESSION/
99_ARCHIVE/
00_MIGRATION/
```

Chỉ tạo file canonical khi đã xác định đúng vai trò từ nội dung.

### D. Source preservation

Mọi tài liệu gốc chưa được xác định là canonical phải được giữ trong:

`99_ARCHIVE/source_material/`

Không biến bản archive thành canonical.

### E. Human-readable HTML

Tạo:

`00_KIM_CHI_NAM/KIM_CHI_NAM.html`

HTML phải:
- dễ đọc trên Chrome;
- có mục lục;
- có điều hướng nội bộ;
- highlight LAW / MUST / MUST NOT / STOP / PASS / LOCKED / PROTECTED / UNLOCK REQUIRED;
- không làm thay đổi nội dung quy tắc;
- ghi rõ tài liệu Markdown/source nào là canonical.

HTML chỉ là bản đọc; không phải database governance chính.

### F. AI READ-FIRST

Tạo:

`00_KIM_CHI_NAM/AI_READ_FIRST.md`

Tài liệu này phải chỉ rõ thứ tự đọc trước mỗi Work Item, dựa trên governance thật sau migration.

### G. Canonical state records

Chỉ tạo các record nếu nguồn có nội dung phù hợp:

- `01_STATE/CURRENT_STATE.md`
- `01_STATE/PO_DECISION_REGISTER.md`
- `01_STATE/WORK_ITEM_HISTORY.md`
- `01_STATE/PROTECTION_MAP.md`
- `02_CONTROL/REGRESSION_LOG.md`
- `02_CONTROL/CONFLICT_REGISTER.md`
- `02_CONTROL/CHECKPOINTS.md`
- `03_EVIDENCE/EVIDENCE_INDEX.md`

### H. Migration report

Tạo:

`00_MIGRATION/MIGRATION_REPORT.md`

Báo cáo phải có:
- số file nguồn;
- số file canonical;
- số file archive;
- số duplicate;
- số conflict;
- các điểm chưa thể xác định;
- Source of Truth cuối cùng cho từng nhóm;
- commit SHA;
- branch.

## Git safety

- Chỉ commit thay đổi phục vụ migration.
- Commit message rõ ràng, ví dụ:
  `docs: migrate canonical FNB governance package`
- Push branch `codex/migrate-kim-chi-nam-20260928`.
- KHÔNG merge main.
- Sau push, báo lại:
  - branch;
  - commit SHA;
  - số file added/changed;
  - migration verdict;
  - các conflict cần PO quyết định.

## Completion condition

Chỉ báo "MIGRATION COMPLETE" khi:
1. toàn bộ RAR đã được inventory;
2. nguồn đã được phân loại;
3. canonical docs đã được tạo;
4. HTML đã được tạo;
5. archive/source preservation đã hoàn tất;
6. migration report đã ghi nhận;
7. branch đã push lên GitHub.

Nếu bất kỳ điều kiện nào chưa đạt, phải báo "MIGRATION INCOMPLETE" và nêu rõ lý do.
