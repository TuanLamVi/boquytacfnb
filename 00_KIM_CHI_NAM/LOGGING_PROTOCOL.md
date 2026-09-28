# GHI NHẬT KÝ — F&B SMART V5

## Mục tiêu

Ghi đủ để biết:
- đã làm gì;
- kết quả là gì;
- bằng chứng ở đâu;
- Tuấn đã xác nhận chưa;
- phần nào đã được bảo vệ;
- việc tiếp theo là gì.

Không tạo nhiều file nhật ký cho cùng một việc.

## Sau mỗi Work Item

Thông thường chỉ cần cập nhật:

### 1. WORK_ITEM_HISTORY.md
Ghi một mục ngắn:

- Work Item
- ngày
- mục tiêu
- kết quả
- PO status
- evidence
- checkpoint
- protection
- commit
- next

### 2. CURRENT_STATE.md
Chỉ cập nhật khi trạng thái hiện tại thay đổi.

### 3. PROTECTION_MAP.md
Chỉ cập nhật khi có thay đổi PROTECTED / LOCKED / UNLOCK.

### 4. REGRESSION_LOG.md
Chỉ cập nhật khi thật sự có regression.

### 5. TEST_EVIDENCE.md
Ghi bằng chứng test cần lưu lại.

### 6. PO_DECISION_REGISTER.md
Chỉ cập nhật khi có quyết định/xác nhận chính thức của PO cần ghi vào repository.

### 7. AI_HANDOFF.md
Chỉ cập nhật khi thông tin bàn giao thay đổi đáng kể.

## Không cần ghi

Không cần tạo:
- LOG_001.md
- LOG_002.md
- LOG_003.md
- một file mới cho mỗi lần Codex chạy;
- một file mới chỉ để chép lại Final Report.

GitHub commit history đã giữ lịch sử thay đổi của file.

## Khi Work Item chưa hoàn tất

Không ghi PASS giả.

Có thể ghi:
- IN_PROGRESS
- BLOCKED
- FAILED
- UNPROVEN
- READY_FOR_PO_VERIFICATION

theo đúng trạng thái thực tế.

## Khi phát hiện lỗi

Làm:

```
STOP
→ ghi lỗi vào REGRESSION_LOG nếu là regression
→ giữ evidence
→ xử lý theo KIM CHỈ NAM
→ test lại
→ cập nhật record
```

## Sau khi ghi

```
CHECK DIFF
→ COMMIT
→ PUSH GITHUB
```

## Quy tắc quan trọng

**Repository record là nhật ký chính thức.**

Nhật ký tạm thời trên máy, cửa sổ terminal hoặc lịch sử chat không thay thế repository record.

**Không cần chép toàn bộ Final Report vào mọi file.**
Chỉ đưa những thông tin cần thiết vào đúng nơi.

## Ví dụ

Một Work Item hoàn tất:

```
WORK_ITEM_HISTORY
→ A4-01 = READY_FOR_PO_VERIFICATION

CURRENT_STATE
→ A4-01 đang chờ PO

TEST_EVIDENCE
→ Evidence E-041

PROTECTION_MAP
→ chưa bảo vệ vì chưa PO_VERIFIED

GIT
→ commit abc123
→ push GitHub
```

Sau khi Tuấn xác nhận:

```
PO_DECISION_REGISTER
→ PO_VERIFIED

CURRENT_STATE
→ A4-01 = PO_VERIFIED

PROTECTION_MAP
→ PROTECTED / LOCKED
```

## Nguyên tắc cuối

**Một việc → một lịch sử chính.**

Không biến repository thành kho chứa hàng trăm nhật ký vụn.
