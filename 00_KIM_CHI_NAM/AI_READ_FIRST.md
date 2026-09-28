# AI READ-FIRST — F&B SMART V5

## Mục đích

Đây là file đầu tiên ChatGPT/Codex/Gemini phải đọc khi bắt đầu session mới, trang chat mới hoặc tiếp nhận lại dự án (theo LAW-017).

## Thứ tự đọc bắt buộc (Read-First Order)

1. `00_KIM_CHI_NAM/KIM_CHI_NAM.md` (Bộ luật chính - BASELINE)
2. `00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md` (Xác định nguồn chuẩn)
3. `01_STATE/CURRENT_STATE.md` (Trạng thái dự án hiện tại)
4. `02_CONTROL/CHECKPOINTS.md` (Hệ thống Checkpoints)
5. `01_STATE/PO_DECISION_REGISTER.md` (Sổ nhật ký quyết định PO)
6. `01_STATE/WORK_ITEM_HISTORY.md` (Lịch sử Work Item)
7. `02_CONTROL/PROTECTION_MAP.md` (Bản đồ vùng bảo vệ)
8. `02_CONTROL/REGRESSION_LOG.md` (Nhật ký regression)
9. `05_SESSION/AI_HANDOFF.md` (Thông tin bàn giao phiên)
10. Bốn hợp đồng chuyên môn V5.1 (khi thực hiện Clean Rebuild):
    - `PRODUCT_CHARTER_V5.1.md`
    - `DATABASE_SCHEMA_V0.1.md`
    - `STATE_MACHINES_V0.1.md`
    - `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`

## Hai Chế độ Vận hành (Operating Modes)

- **REHABILITATION MODE:** Cải tạo hệ thống cũ. (Legacy System)
- **CLEAN_REBUILD MODE:** Xây dựng hệ thống mới F&B SMART V5.1 từ đầu.
  - Khi Clean Rebuild được kích hoạt bởi PO: **LEGACY SYSTEM = FROZEN** (chỉ dùng làm Read-Only Forensic Reference).
  - Tách biệt tuyệt đối Legacy và New V5.1 (source code, data, checkpoints, evidence).
  - Áp dụng nguyên tắc **Contract-First** và **Master Specification Gate** trước khi viết application code mới.

## Khi bắt đầu Work Item mới

Mỗi Work Item mới bắt buộc phải ghi rõ các thông số:
```text
WORK ITEM
BUILD MODE = [REHABILITATION | CLEAN_REBUILD]
OBJECTIVE
SCOPE
DEPENDENCY
PROTECTED SCOPE
EVIDENCE NEEDED
PO STATUS
NEXT
```

## Những việc NGHIÊM CẤM (Strict Prohibition)

- Không dùng trí nhớ chat (AI Memory) để thay thế Repository (`REPOSITORY WINS`).
- Không tự ý sửa KIM CHỈ NAM / LAW khi chưa có PO Decision riêng.
- Không tự cấp `PO_VERIFIED`, `PROTECTED`, `LOCKED`.
- Không tự đánh đồng `AI PASS` = `PO PASS` = `PO_VERIFIED`.
- Không sửa application code khi đang ở Chế độ Governance / Master Spec.
- Không tự ý sửa vùng đã bảo vệ khi chưa có lệnh `UNLOCK` từ PO kèm phạm vi giới hạn.
- Không bỏ qua mâu thuẫn (`UNRESOLVED`) hoặc thiếu bằng chứng (`UNPROVEN`).
- Không tự ý dùng các lệnh Git có nguy cơ xóa thay đổi (`reset`, `clean`, `restore`, `stash`, `force push`).
- Không coi `Build SUCCESS` là chức năng `PASS`.

## Khi gặp lỗi quan trọng (First Failure Stop)

```text
STOP
→ GIỮ BẰNG CHỨNG (EVIDENCE)
→ CÔ LẬP NGUYÊN NHÂN (ISOLATE)
→ NGUYÊN NHÂN GỐC (ROOT CAUSE)
→ SỬA CHÍNH XÁC ĐÚNG PHẠM VI (SURGICAL FIX) NẾU ĐƯỢC PHÉP
→ TEST LẠI
→ ĐỒNG BỘ HỒ SƠ & BÁO CÁO (LAW-013)
```

## Khi PO đưa quyết định trong ChatGPT (LAW-016)

Quyết định của PO trong ChatGPT chỉ là `PO DECISION INPUT`.
Quy trình ghi nhận chính thức vào repository:
```text
PO DECISION
→ CHATGPT TẠO PROMPT COPY-READY
→ PO GỬI CODEX
→ CODEX GHI NHẬN VÀO REPOSITORY
→ GOVERNANCE / STATE UPDATED
→ VERIFY DIFF & FINAL REPORT
```

## Cập nhật Hồ sơ sau mỗi Work Item (LAW-015)

Sau khi hoàn tất một Work Item và có kết quả được PO phê duyệt, kiểm tra và cập nhật đúng các hồ sơ bị ảnh hưởng:
- `CURRENT_STATE.md`
- `WORK_ITEM_HISTORY.md`
- `CHECKPOINTS.md`
- `PO_DECISION_REGISTER.md`
- `PROTECTION_MAP.md`
- `TEST_EVIDENCE.md`
- `AI_HANDOFF.md`
- `REGRESSION_LOG.md` (chỉ khi có regression thật)

## Nguyên tắc cốt lõi

`REPOSITORY WINS OVER AI MEMORY`
 Không được tuyên bố trạng thái nếu repository chưa có bằng chứng và chưa có xác nhận từ PO Tuấn.
