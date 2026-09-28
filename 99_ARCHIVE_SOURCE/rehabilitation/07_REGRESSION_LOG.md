# 07 — NHẬT KÝ HỒI QUY (REGRESSION LOG)

## 1. NGUYÊN TẮC
- Khi phát hiện một phần đã được `PO_VERIFIED` trước đó bị hỏng hoặc ảnh hưởng bởi thay đổi mới:
  1. Lập tức DỪNG (STOP) mọi công việc hiện tại.
  2. Ghi nhận sự cố vào tài liệu này.
  3. Không tự ý sửa nếu chưa cô lập được nguyên nhân gốc.

---

## 2. MẪU GHI NHẬN HỒI QUY CHUẨN (TEMPLATE)

```markdown
### [REGRESSION_ID: e.g., REG-001]
- **Date:** YYYY-MM-DD
- **Affected Checkpoint:** CHK-XXX
- **First Failure:** [Mô tả triệu chứng lỗi đầu tiên xuất hiện]
- **Current Phase:** Phase X
- **Changed Files:** [Danh sách file gây nghi ngờ hoặc vừa sửa]
- **Evidence:** [Log / Screen / Error trace]
- **Root Cause:** UNRESOLVED (hoặc nguyên nhân đã xác thực)
- **Fix:** [Giải pháp khắc phục]
- **Retest Result:** PENDING / PASS
- **PO Verification:** PENDING
- **Status:** OPEN / RESOLVED
```

---

## 3. DANH SÁCH HỒI QUY

*Chưa ghi nhận lỗi hồi quy nào (Dự án đang ở Phase 0, chưa có Checkpoint nào được PO_VERIFIED).*
