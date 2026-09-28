# PROTECTION MAP

## Mục đích

Theo dõi các phần đã được PO chấp nhận và phải được kiểm tra tác động trước khi sửa.

## Chuỗi bảo vệ

```
PASS
→ PO_VERIFIED
→ REGRESSION CHECK
→ PROTECTED
→ LOCKED
```

## `LOCKED` nghĩa là gì?

Bảo vệ:
- hành vi đã chấp nhận;
- quy tắc;
- invariant;
- acceptance criteria;
- evidence;
- phạm vi đã chấp nhận.

**Không đồng nghĩa khóa cứng file.**

## Trước khi sửa Work Item mới

```
CURRENT A-STAGE
TASK
RELATED A-STAGES
LOCKED SCOPE IMPACT
```

Kết quả:
- `NONE` → không thấy ảnh hưởng vùng bảo vệ.
- `DETECTED` → `REGRESSION_REQUIRED`.
- `UNKNOWN` → `REGRESSION_RISK` + STOP.

## UNLOCK

Chỉ PO được UNLOCK.

Một lần mở khóa phải ghi:
- lý do;
- phạm vi;
- ảnh hưởng;
- kế hoạch kiểm tra;
- PO test;
- trạng thái bảo vệ sau khi hoàn tất.

## Snapshot bảo vệ từ bộ nguồn

Các vùng được ghi nhận lịch sử gồm A0, A1, A2-01, A2-02, A3-01, A3-02, A3-05, A3-06, GP-01 và GOV-025 cùng các checkpoint liên quan.

Chi tiết xem `02_CONTROL/CHECKPOINTS.md`.
