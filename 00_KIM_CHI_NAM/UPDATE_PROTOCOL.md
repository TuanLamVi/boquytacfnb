# UPDATE PROTOCOL — CÁCH CẬP NHẬT BỘ QUY TẮC

## Mục tiêu

Giữ repository gọn và để ChatGPT có thể đọc lại thông tin mới mà không phải lục hàng chục file.

## Những file thường xuyên cập nhật

### 1. Khi trạng thái dự án thay đổi
Cập nhật:
`01_STATE/CURRENT_STATE.md`

### 2. Khi Work Item có kết quả mới
Cập nhật:
`01_STATE/WORK_ITEM_HISTORY.md`

### 3. Khi có PO Decision chính thức
Cập nhật:
`01_STATE/PO_DECISION_REGISTER.md`

Theo LAW-016, PO decision trong ChatGPT chưa phải repository record cho đến khi được ghi nhận đúng quy trình.

### 4. Khi có checkpoint hoặc thay đổi bảo vệ
Cập nhật:
`02_CONTROL/CHECKPOINTS.md`
và/hoặc
`02_CONTROL/PROTECTION_MAP.md`

### 5. Khi có regression
Chỉ cập nhật:
`02_CONTROL/REGRESSION_LOG.md`

### 6. Khi có bằng chứng test
Cập nhật:
`03_EVIDENCE/TEST_EVIDENCE.md`

### 7. Khi cần bàn giao phiên
Cập nhật:
`05_SESSION/AI_HANDOFF.md`

## Không làm

Không tạo thêm file nhật ký mới chỉ vì một Work Item mới.

Không copy cùng một thông tin vào nhiều registry nếu không cần.

Không sửa KIM CHỈ NAM chỉ để cập nhật trạng thái công việc.

## Sau mỗi lần cập nhật

```
SỬA ĐÚNG FILE
→ KIỂM TRA DIFF
→ GHI COMMIT
→ PUSH GITHUB
```

## Để ChatGPT theo dõi

Sau khi push, ChatGPT có thể đọc repository để:
- xác định trạng thái mới;
- đọc quyết định;
- đọc Work Item history;
- kiểm tra vùng bảo vệ;
- đối chiếu thay đổi.

## Quy tắc đặc biệt

Nếu thay đổi là **LAW / KIM CHỈ NAM**, không sửa như một cập nhật Work Item bình thường. Phải có quyết định/authorization phù hợp.

Nếu chỉ là thay đổi trạng thái hoặc lịch sử, không sửa luật.

## HTML

`00_KIM_CHI_NAM/KIM_CHI_NAM.html` là bản đọc cho con người.

Không dùng HTML làm nơi ghi trạng thái chính.

Khi luật chính thay đổi, HTML cần được cập nhật lại để đồng bộ giao diện.
