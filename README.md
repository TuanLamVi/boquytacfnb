# BO QUY TAC FNB SMART

Repository nguồn chuẩn cho bộ Governance / KIM CHỈ NAM của F&B SMART V5.

## Nguyên tắc nguồn dữ liệu

- Repository GitHub (`TuanLamVi/boquytacfnb` / branch `main`) là Source of Truth của governance và các record vận hành được kiểm soát.
- KIM CHỈ NAM / LAW không được tự ý sửa bởi AI/Codex.
- Các record như CURRENT_STATE, WORK_ITEM_HISTORY, PROTECTION_MAP, REGRESSION_LOG được cập nhật theo quy trình.
- Mọi thay đổi phải có Git history để có thể truy vết.
- Trước mỗi Work Item, Codex phải READ-FIRST các tài liệu governance bắt buộc tại root (`00_KIM_CHI_NAM/`, `01_STATE/`, `02_CONTROL/`, v.v.).
- Sau khi hoàn tất Work Item, Codex phải cập nhật record cần thiết và push lên GitHub `boquytacfnb/main`.

## Cấu trúc Governance hiện tại (Branch: main)

- `00_KIM_CHI_NAM/`
- `01_STATE/`
- `02_CONTROL/`
- `03_EVIDENCE/`
- `05_SESSION/`

## Phân tách Repository

- **Governance Repository:** `https://github.com/TuanLamVi/boquytacfnb` (branch `main`)
- **Application Source Repository:** `https://github.com/TuanLamVi/fnb-smart-v5-clean-rebuild` (riêng biệt, không trộn lẫn)
- **Legacy Source Repository:** `https://github.com/TuanLamVi/fnb-smart-source` (riêng biệt)
