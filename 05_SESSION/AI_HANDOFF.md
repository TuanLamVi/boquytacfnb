# 09 — AI HANDOFF — F&B SMART V5

> Dành cho AI/Coding Agent (ChatGPT, Codex, Gemini) tiếp nhận phiên làm việc tiếp theo.

---

## 1. BẮT BUỘC ĐỌC TRƯỚC (READ-FIRST — LAW-017)

Theo LAW-017, khi bắt đầu phiên mới, AI bắt buộc phải đọc các file theo thứ tự:
```text
1. 00_KIM_CHI_NAM/KIM_CHI_NAM.md
2. 00_KIM_CHI_NAM/AI_READ_FIRST.md
3. 00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md
4. 01_STATE/CURRENT_STATE.md
5. 02_CONTROL/CHECKPOINTS.md
6. 01_STATE/PO_DECISION_REGISTER.md
7. 02_CONTROL/PROTECTION_MAP.md
8. 05_SESSION/AI_HANDOFF.md
9. Bốn hợp đồng chuyên môn V5.1 (Product Charter, Schema, State Machines, Query Budget)
```

---

## 2. TRẠNG THÁI DỰ ÁN VÀ BẢO VỆ CHỐT

```text
GOVERNANCE BASELINE V5.1 = PO_VERIFIED / BASELINE FREEZE (DEC-2026-GOVERNANCE-BASELINE-V5.1)
REFERENCE ARCHITECTURE V5.1 = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-REF-ARCHITECTURE-V5.1)
OPERATING MODE           = CLEAN_REBUILD MODE ACTIVE
LEGACY SYSTEM STATUS     = FROZEN / READ-ONLY FORENSIC REFERENCE
APPLICATION CODE CHANGES = NONE (Legacy code untouched)

A0, A1, A2-01, A2-02, A3-01, A3-02, A3-03, A3-05, A3-06, GP-01 = PO_VERIFIED / LOCKED (Legacy Frozen)
GOV-025, GOV-026, GOV-027, GOV-028                             = PO_VERIFIED / PROTECTED / LOCKED
A6-02 (Legacy POS Payment Fix)                                 = BLOCKED / FIRST FAILURE / LEGACY FROZEN
CLEAN_REBUILD_V5.1                                             = ACTIVE / DESIGN & RESEARCH
```

---

## 3. RANH GIỚI VÀ QUY TẮC BẮT BUỘC CHO PHIÊN TIẾP THEO

1. **CLEAN REBUILD MODE IS ACTIVE:** Mọi công việc hiện tại tập trung vào F&B SMART V5.1 Clean Rebuild.
2. **LEGACY IS FROZEN:** Nghiêm cấm tiếp tục sửa chữa/patch legacy application code.
3. **CONTRACT-FIRST & MASTER SPECIFICATION GATE:**
   - Không được phép viết application code mới khi chưa hoàn thành **CLEAN REBUILD MASTER SPECIFICATION** và chưa được PO Tuấn phê duyệt (`PO_VERIFIED`).
   - Order bắt buộc: Requirements → Design → Data Schema → State Machines → Protocol Contracts → Acceptance Test Plan → Code.
4. **NO ARBITRARY MID-BUILD CHANGES:** Không tự ý sửa thiết kế/kiến trúc giữa chừng nếu chưa qua STOP → Impact Analysis → PO Decision.
5. **NO APPLICATION PO_VERIFIED:** Không tự ý ghi nhận `PO_VERIFIED` cho code ứng dụng mới.

---

## 4. TRỌNG TÂM VIỆC TIẾP THEO (NEXT)

```text
CURRENT WORKSTREAM: F&B SMART V5.1 CLEAN REBUILD
CURRENT STEP      : CLEAN REBUILD MASTER SPECIFICATION
```

Nhiệm vụ tiếp theo: Xây dựng bản thảo **CLEAN REBUILD MASTER SPECIFICATION** chốt toàn bộ phạm vi, chức năng, liên kết, schema, state machines, quy tắc tài chính, phân quyền và tiêu chuẩn kiểm thử cho F&B SMART V5.1 để trình PO Tuấn phê duyệt.
