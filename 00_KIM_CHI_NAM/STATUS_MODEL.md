# STATUS MODEL

## Trạng thái công việc

- `NOT_STARTED`
- `IN_PROGRESS`
- `READY_FOR_PO_VERIFICATION`
- `PO_VERIFICATION_PENDING`
- `PO_VERIFIED`
- `PASS_TEMPORARY`
- `FAILED`
- `BLOCKED`
- `REGRESSION`
- `UNPROVEN`
- `REPORT_FORMAT_BLOCKED`

## Trạng thái bảo vệ

- `PROTECTED`
- `LOCKED`

## Không được đánh đồng

```
AI PASS
≠ READY_FOR_PO_VERIFICATION
≠ PO PASS
≠ PO_VERIFIED
≠ LOCKED
```

## Parent / Child

Child PASS không tự làm parent PASS.

Không tự tạo trạng thái mới.
