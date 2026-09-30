# LOGGING PROTOCOL — GHI NHẬT KÝ VẬN HÀNH

## Mục tiêu

Ghi nhật ký tập trung, chính xác và minh bạch trong repository để đảm bảo truy xuất nguồn gốc đầy đủ mà không làm rối repository bằng hàng chục file rác.

---

## Mẫu Khai báo Work Item chuẩn

Mọi Work Item mới khi triển khai phải khai báo đầy đủ các thông số:
```text
WORK ITEM: [Mã ID Work Item]
BUILD MODE: [REHABILITATION | CLEAN_REBUILD]
OBJECTIVE: [Mục tiêu công việc]
SCOPE: [Phạm vi file/component tác động]
DEPENDENCY: [Phụ thuộc kỹ thuật/tài liệu]
PROTECTED SCOPE: [Vùng ảnh hưởng bảo vệ]
EVIDENCE NEEDED: [Bằng chứng cần thiết]
PO STATUS: [Trạng thái phê duyệt của PO]
NEXT: [Bước tiếp theo]
```

---

## Các File Hồ sơ Cần Cập nhật (LAW-015)

Sau mỗi Work Item hoàn tất và có kết quả chính thức, cập nhật đúng các hồ sơ tập trung sau:

### 1. `01_STATE/WORK_ITEM_HISTORY.md`
Ghi nhận một mục tóm tắt ngắn gọn: Work Item, Ngày, Build Mode, Mục tiêu, Kết quả kỹ thuật, PO Status, Evidence, Checkpoint, Protection, Commit, Next.

### 2. `01_STATE/CURRENT_STATE.md`
Cập nhật khi trạng thái tổng quan dự án hoặc trạng thái của Work Item thay đổi.

### 3. `01_STATE/PO_DECISION_REGISTER.md`
Cập nhật ngay khi có quyết định/phê duyệt mới từ PO Tuấn được ghi nhận theo LAW-016.

### 4. `02_CONTROL/CHECKPOINTS.md` & `02_CONTROL/PROTECTION_MAP.md`
Cập nhật khi có checkpoint mới hoặc thay đổi trạng thái `PROTECTED / LOCKED / UNLOCK`.

### 5. `02_CONTROL/REGRESSION_LOG.md`
Chỉ cập nhật khi thực sự phát hiện lỗi regression ở tính năng đã xác nhận trước đây.

### 6. `03_EVIDENCE/TEST_EVIDENCE.md`
Lưu trữ bằng chứng kiểm thử (logs, screenshots, output test).

### 7. `05_SESSION/AI_HANDOFF.md`
Cập nhật thông tin bàn giao phiên cho AI tiếp nối.

---

## Những việc NGHIÊM CẤM

- **Không tạo file log lẻ tẻ:** Nghiêm cấm tạo `LOG_001.md`, `LOG_002.md`, `LOG_20260928.md` cho từng lần chạy.
- **Không chép toàn bộ Final Report vào mọi file:** Chỉ đưa thông tin tóm tắt cần thiết vào đúng file quy định.
- **Không ghi PASS giả:** Chưa qua test thật hoặc chưa có PO Verification thì ghi đúng trạng thái (`IN_PROGRESS`, `READY_FOR_PO_VERIFICATION`, `UNPROVEN`, `BLOCKED`).
