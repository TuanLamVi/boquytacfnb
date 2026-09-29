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
OFFICIAL FIREBASE PROJECT ID        = fnb-smart (DEC-2026-FIREBASE-PROJECT-FNB-SMART)
OFFICIAL CLEAN REBUILD SOURCE RULE = PO_VERIFIED / BASELINE FREEZE (DEC-2026-GOV-OFFICIAL-CLEAN-REBUILD-SOURCE-RULE)
CLEAN-REBUILD-A0-FOUNDATION         = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-A0-CLEAN-REBUILD-PO-VERIFIED, Commit 7e26108c6d37164447ff5409fc54a40bcca688c2 on TuanLamVi/fnb-smart-v5-clean-rebuild main)
CI/CD FUTURE WORK ITEM              = CI-01 — GitHub Automated Build & Test
AI WORKING DISCIPLINE V5.1          = PO_VERIFIED / BASELINE FREEZE (DEC-2026-GOV-AI-WORKING-DISCIPLINE)
CLEAN REBUILD MASTER SPECIFICATION V5.1 = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-MASTER-SPEC-PO-VERIFIED)
GOVERNANCE BASELINE V5.1            = PO_VERIFIED / BASELINE FREEZE (DEC-2026-GOVERNANCE-BASELINE-V5.1)
REFERENCE ARCHITECTURE V5.1         = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-REF-ARCHITECTURE-V5.1)
BUSINESS MODELS & MENU TEMPLATES V5.1 = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-BUSINESS-MODELS-MENU-V5.1)
TABLE MERGE & TRANSFER V5.1         = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-TM-03, TM-04, TM-05)
POS ORDERING & DISPATCH V5.1        = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-POS-03, POS-04)
KDS & KITCHEN OPERATIONS V5.1       = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-KDS-081)
CHECKOUT & PAYMENT V5.1             = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-CHECKOUT-PAYMENT-V5.1)
TABLE & PAYMENT OPERATING MODEL V5.1 = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-090, DEC-2026-091)
A6 SHIFT MANAGEMENT V5.1            = PO_VERIFIED / PROTECTED / LOCKED (DEC-2026-A6-SHIFT)
OPERATING MODE                      = CLEAN_REBUILD MODE ACTIVE
LEGACY SYSTEM STATUS                = FROZEN / READ-ONLY FORENSIC REFERENCE

A0, A1, A2-01, A2-02, A3-01, A3-02, A3-03, A3-05, A3-06, GP-01 = PO_VERIFIED / LOCKED (Legacy Frozen)
GOV-025, GOV-026, GOV-027, GOV-028                             = PO_VERIFIED / PROTECTED / LOCKED
A6-02 (Legacy POS Payment Fix)                                 = BLOCKED / FIRST FAILURE / LEGACY FROZEN
CLEAN_REBUILD_V5.1                                             = ACTIVE / A0 FOUNDATION PO_VERIFIED, PROTECTED & LOCKED
```

---

## 3. RANH GIỚI VÀ QUY TẮC BẮT BUỘC CHO PHIÊN TIẾP THEO

1. **CLEAN REBUILD MODE IS ACTIVE:** Mọi công việc hiện tại tập trung vào F&B SMART V5.1 Clean Rebuild.
2. **LEGACY IS FROZEN:** Nghiêm cấm tiếp tục sửa chữa/patch legacy application code.
3. **CONTRACT-FIRST & MASTER SPECIFICATION GATE:**
   - Không được phép viết application code mới khi chưa hoàn thành **CLEAN REBUILD MASTER SPECIFICATION** và chưa được PO Tuấn phê duyệt (`PO_VERIFIED`).
   - Order bắt buộc: Requirements → Design → Data Schema → State Machines → Protocol Contracts → Acceptance Test Plan → Code.
4. **NO ARBITRARY MID-BUILD CHANGES:** Không tự ý sửa thiết kế/kiến trúc giữa chừng nếu chưa qua STOP → Impact Analysis → PO Decision.
5. **A0 IS PROTECTED & LOCKED:** A0 Foundation đã `PO_VERIFIED / PROTECTED / LOCKED` theo DEC-2026-A0-CLEAN-REBUILD-PO-VERIFIED. Mọi thay đổi chạm vào A0 phải qua UNLOCK REQUIRED.

---

## 4. TRỌNG TÂM VIỆC TIẾP THEO (NEXT)

```text
CURRENT WORKSTREAM: F&B SMART V5.1 CLEAN REBUILD
NEXT WORK ITEM    : CLEAN-REBUILD-A1-FOUNDATION — Store & Account Management Clean Rebuild Implementation
FUTURE WORK ITEM  : CI-01 — GitHub Automated Build & Test (PO Requested)
```

Clean Rebuild A0 Foundation đã hoàn tất chuỗi close-out chính thức (`PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED`).
Nhiệm vụ tiếp theo là sẵn sàng triển khai A1 Store & Account Management Clean Rebuild hoặc nhận chỉ đạo công việc tiếp theo từ PO Tuấn.
