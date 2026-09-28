# AI READ-FIRST — F&B SMART V5

## Mục đích

Đây là file đầu tiên ChatGPT/Codex phải đọc khi bắt đầu hoặc tiếp nhận lại dự án.

## Thứ tự đọc bắt buộc

1. `00_KIM_CHI_NAM/KIM_CHI_NAM.md`
2. `00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md`
3. `01_STATE/CURRENT_STATE.md`
4. `02_CONTROL/CHECKPOINTS.md`
5. `01_STATE/PO_DECISION_REGISTER.md`
6. `01_STATE/WORK_ITEM_HISTORY.md`
7. `02_CONTROL/PROTECTION_MAP.md`
8. `02_CONTROL/REGRESSION_LOG.md`
9. `05_SESSION/AI_HANDOFF.md`
10. Tài liệu kỹ thuật liên quan trực tiếp đến Work Item.

## Khi bắt đầu Work Item mới

Phải xác định:

```
CURRENT A-STAGE
WORK ITEM
OBJECTIVE
SCOPE
RELATED A-STAGES
LOCKED / PROTECTED SCOPE
EVIDENCE NEEDED
PO STATUS
NEXT
```

## Không được làm

- Không dùng trí nhớ chat để thay repository.
- Không tự ý sửa KIM CHỈ NAM / LAW.
- Không tự cấp `PO_VERIFIED`, `PROTECTED`, `LOCKED`.
- Không coi child PASS là parent PASS.
- Không sửa vùng đã bảo vệ khi chưa có quyền mở khóa.
- Không bỏ qua conflict hoặc evidence thiếu.
- Không tự ý dùng thao tác Git có nguy cơ xóa thay đổi.
- Không tự coi build SUCCESS là chức năng PASS.

## Khi gặp lỗi quan trọng

```
STOP
→ GIỮ EVIDENCE
→ CÔ LẬP
→ ROOT CAUSE
→ SURGICAL FIX NẾU ĐƯỢC PHÉP
→ TEST
→ REPORT
```

## Khi PO đưa quyết định trong ChatGPT

PO decision trong ChatGPT chỉ là `PO DECISION INPUT`.

Theo LAW-016:

```
PO DECISION
→ PROMPT COPY-READY
→ CODEX RECORD
→ GOVERNANCE UPDATED
→ VERIFY DIFF
→ FINAL REPORT
```

## Khi mở lại một phiên

Theo LAW-017:

```
READ REPOSITORY
→ RECOVER CURRENT STATE
→ RECOVER DECISIONS
→ RECOVER CHECKPOINTS
→ CHECK PROTECTED/LOCKED SCOPE
→ XÁC ĐỊNH NEXT
→ SAU ĐÓ MỚI THỰC THI
```

Nếu không đọc đủ nguồn bắt buộc:

```
UNPROVEN / BLOCKED
→ STOP
```

## Sau mỗi Work Item

Cập nhật đúng các hồ sơ bị ảnh hưởng:

- Current State
- Work Item History
- Checkpoints
- PO Decision Register
- Protection Map
- Test Evidence
- Change Log
- AI Handoff

Regression Log và Known Issues chỉ cập nhật khi thực sự có thay đổi.

## Nguyên tắc cuối

`REPOSITORY WINS`

Không được tuyên bố trạng thái mà repository chưa có bằng chứng.
