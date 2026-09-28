# 09 — AI HANDOFF — F&B SMART V5

> Dành cho AI/Coding Agent tiếp nhận phiên mới.

## 1. ĐỌC TRƯỚC

```text
00_KIM_CHI_NAM_REHABILITATION.md
KIM_CHI_NAM_CAI_TAO_FNB_SMART.md
02_CURRENT_STATE.md
03_CHECKPOINTS.md
05_DECISION_LOG.md
09_AI_HANDOFF.md
```

Sau đó đọc tài liệu chuyên môn đúng với Work Item.

## 2. TRẠNG THÁI CHỐT

```text
A0       = PO_VERIFIED / LOCKED
A1       = PO_VERIFIED / LOCKED theo hồ sơ hiện hành
A2       = NOT VERIFIED
A2-01    = PO_VERIFIED / PROTECTED / LOCKED
A2-02    = PO_VERIFIED / PROTECTED / LOCKED
A3       = UNRESOLVED
A3-03    = PO_VERIFIED / LOCKED
GP-01    = PO_VERIFIED / LOCKED
GOV-025  = PO_VERIFIED / PROTECTED / LOCKED
GOV-026  = PO_VERIFIED
GOV-027  = PO_VERIFIED
GOV-028  = PO_VERIFIED
A3-01    = PO_VERIFIED / PROTECTED / LOCKED
A3-02    = PO_VERIFIED / PROTECTED / LOCKED
A3-05    = PO_VERIFIED / PROTECTED / LOCKED
A3-06    = PO_VERIFIED / PROTECTED / LOCKED
A6-02    = READY_FOR_PO_VERIFICATION
```

## 3. A2-02 — ĐÃ KHÓA

- Canonical ID: `A2-02`
- Historical ID: `A2.2-02-FIX-03`
- PO: Tuấn
- Result: `PO_VERIFIED / PROTECTED / LOCKED`
- PO evidence: Employee Quầy POS thấy bàn, mở bàn, thấy menu trong bàn.

**Không làm lại A2-02. Không tự unlock.**

## 4. BẢO VỆ KHI SỬA TASK MỚI

Nếu task mới liên quan POS permission, Table Map hoặc Table synchronization:

```text
CURRENT A-STAGE
TASK
RELATED A-STAGES
LOCKED SCOPE IMPACT
```

Đặc biệt bảo vệ `A2-02` và `A3-03`.

## 5. CLOSURE SYNCHRONIZATION

Sau PO PASS của mọi Work Item:

```text
CHECKPOINTS
DECISION_LOG
CURRENT_STATE
TEST_EVIDENCE
CHANGE_LOG
AI_HANDOFF
```

phải được kiểm tra/cập nhật đồng bộ. Các hồ sơ khác cập nhật khi điều kiện áp dụng.

## 6. BUILD

Dùng `docs/rehabilitation/BUILD_BASELINE.md`.

Không tự đổi toolchain.

## 7. GIT

Working tree DIRTY; bảo toàn thay đổi có sẵn.

## 8. NEXT

```text
CURRENT WORKSTREAM: F&B SMART V5.1 CLEAN REBUILD (DEC-2026-CLEAN-REBUILD-V5.1)
CURRENT MODE: CLEAN_REBUILD MODE ACTIVE
LEGACY STATUS: FROZEN / READ-ONLY FORENSIC REFERENCE
NEXT: Finalize Clean Rebuild Master Specification & Boundaries before application coding.
```

Không tự suy ra task mới từ lịch sử cũ.

## 9. LAW-016 & LAW-017 — PO DECISION BRIDGE & SESSION REENTRY
- **LAW-016:** Quyết định của PO trong ChatGPT chưa phải là repository record cho đến khi Codex ghi nhận vào repository. Khi PO ra quyết định qua ChatGPT, AI phải cung cấp prompt copy-ready cho PO gửi Codex.
- **LAW-017 (Session Reentry & No-Memory Authority):** Mỗi khi bắt đầu session mới, trang chat mới hoặc tiếp nhận lại project sau gián đoạn, AI KHÔNG ĐƯỢC dựa vào trí nhớ session trước (Repository Wins). AI bắt buộc phải đọc lại các tài liệu governance (00, KIM_CHI_NAM, 02, 03, 05, 09) trước khi thực thi bất kỳ task nào.
