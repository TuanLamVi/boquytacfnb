# CURRENT STATE — F&B SMART V5

> **Snapshot nguồn:** 2026-09-26.
> Dữ liệu dưới đây lấy từ `docs/rehabilitation/02_CURRENT_STATE.md` trong bộ tài liệu PO cung cấp.
> Đây là ảnh chụp lịch sử; không được coi là trạng thái runtime mới nhất nếu chưa kiểm tra repository ứng dụng.

## Repository governance

- Repository: `TuanLamVi/boquytacfnb`
- Branch chính: `main`
- Migration branch: `codex/migrate-kim-chi-nam-20260928`

## Snapshot dự án nguồn

- Project: F&B SMART V5 / FnB-Smart
- Project root: `C:\Users\Admin\Desktop\Android\fnb_smart`
- Branch lịch sử: `fix/v4.6.9-rc17-patch4b-auth-logging`
- HEAD lịch sử: `be00e47b7c69746d2d55e6c7a97ce55453b54c80`
- Worktree: `DIRTY`

## Trạng thái được ghi trong snapshot

| Item | Status | Ghi chú |
|---|---|---|
| A0 | `PO_VERIFIED / LOCKED` | Nền móng lịch sử |
| A1 | `PO_VERIFIED / LOCKED` | Theo record đã chấp nhận |
| A2 parent | `NOT VERIFIED` | Child không tự nâng parent |
| A2-01 | `PO_VERIFIED / PROTECTED / LOCKED` | Duplicate Join Prevention |
| A2-02 | `PO_VERIFIED / PROTECTED / LOCKED` | Employee Quầy POS + Table Map |
| A3 parent | `UNRESOLVED` | Phạm vi/taxonomy parent chưa giải quyết |
| A3-03 | `PO_VERIFIED / LOCKED` | Table Map Logout/Login recovery |
| A4 parent | `Not accepted` | Snapshot không có product task được giao |
| GP-01 | `PO_VERIFIED / LOCKED` | Orders tenant rules / open table scope |
| GOV-025 | `PO_VERIFIED / PROTECTED / LOCKED` | Work Item closure |
| GOV-026 | `PO_VERIFIED` | Governance consistency / closure sync |
| GOV-027 | `PO_VERIFIED` | LAW-016 |
| GOV-028 | `PO_VERIFIED` | LAW-017 |
| A3-01 | `PO_VERIFIED / PROTECTED / LOCKED` | Money / Currency / Int64 |
| A3-02 | `PO_VERIFIED / PROTECTED / LOCKED` | Orders & Order Lines |
| A3-04 | `PAUSED` | Payment & Table Closure Synchronization |
| A3-05 | `PO_VERIFIED / PROTECTED / LOCKED` | Shift foundation |
| A3-06 | `PO_VERIFIED / PROTECTED / LOCKED` | Shift Management UI |
| A6-02 | `READY_FOR_PO_VERIFICATION` | Canonical POS Payment UI Integration & Test Surface |
| AI START SCREEN | `READY_FOR_PO_REVIEW` | Màn hình tiện ích nội bộ AI Start Commands |

## A2-02

- Canonical ID: `A2-02`
- Historical ID: `A2.2-02-FIX-03`
- PO: Tuấn
- Date: 2026-09-26
- Result: `PO_VERIFIED / PROTECTED / LOCKED`
- PO evidence: Employee Quầy POS nhìn thấy bàn, mở được bàn và nhìn thấy menu trong bàn.

## Cảnh báo

- Snapshot này không tự chứng minh trạng thái ngày 2026-09-28.
- Trước khi xác định Work Item tiếp theo, phải READ-FIRST và đối chiếu các record hiện hành.
- Không suy diễn A4 hoặc Work Item tiếp theo từ tên file, chat history hoặc memory.
