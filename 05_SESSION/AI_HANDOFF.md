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
APPLICATION CODE CHANGES            = NONE (Legacy code untouched)

A0, A1, A2-01, A2-02, A3-01, A3-02, A3-03, A3-05, A3-06, GP-01 = PO_VERIFIED / LOCKED (Legacy Frozen)
GOV-025, GOV-026, GOV-027, GOV-028                             = PO_VERIFIED / PROTECTED / LOCKED
A6-02 (Legacy POS Payment Fix)                                 = BLOCKED / FIRST FAILURE / LEGACY FROZEN
CLEAN_REBUILD_V5.1                                             = MASTER SPECIFICATION PO_VERIFIED / PROTECTED / LOCKED
```

---

## 3. RANH GIỚI VÀ QUY TẮC BẮT BUỘC CHO PHIÊN TIẾP THEO

1. **CLEAN REBUILD MODE IS ACTIVE:** Mọi công việc hiện tại tập trung vào F&B SMART V5.1 Clean Rebuild.
2. **LEGACY IS FROZEN:** Nghiêm cấm tiếp tục sửa chữa/patch legacy application code.
3. **CONTRACT-FIRST & MASTER SPECIFICATION GATE:**
   - **CLEAN REBUILD MASTER SPECIFICATION V5.1 đã được PO duyệt** ngày 2026-10-09 (`PO_VERIFIED / PROTECTED / LOCKED`). Mọi Work Item triển khai V5.1 vẫn cần được ủy quyền riêng và phải có bằng chứng kiểm thử.
   - **Ví trả trước V5.2 là phạm vi riêng:** chưa viết code ví cho đến khi phụ lục V5.2 được PO duyệt. Thời điểm cảnh báo đã được PO xác nhận là trước 3 ngày khi số dư dự kiến không đủ; chỉ kênh gửi, tần suất nhắc lại và chống gửi trùng còn mở.
   - Order bắt buộc: Requirements → Design → Data Schema → State Machines → Protocol Contracts → Acceptance Test Plan → Code.
4. **NO ARBITRARY MID-BUILD CHANGES:** Không tự ý sửa thiết kế/kiến trúc giữa chừng nếu chưa qua STOP → Impact Analysis → PO Decision.
5. **NO APPLICATION PO_VERIFIED:** Không tự ý ghi nhận `PO_VERIFIED` cho code ứng dụng mới.

---

## 4. TRỌNG TÂM VIỆC TIẾP THEO (NEXT)

```text
CURRENT WORKSTREAM: F&B SMART V5.1 CLEAN REBUILD
CURRENT STEP      : V5.2 PREPAID WALLET SPECIFICATION FINALIZATION
```

Nhiệm vụ tiếp theo: Hoàn thiện phụ lục ví trả trước V5.2, giữ nguyên quyết định cảnh báo trước 3 ngày, chỉ xử lý các chi tiết thông báo còn mở (kênh gửi, tần suất nhắc lại, chống gửi trùng), đối chiếu dữ liệu/trạng thái/bảo mật và trình PO duyệt trước khi mở Work Item lập trình ví.

## 4. Historical Remote Read-Back — Before PO Approval (2026-10-09)

- Selective reconciliation merged to canonical `main` at `f57e01b8fc274aaf917aeadcce9c2eb04e8a414f` (PR #1).
- Master Specification draft and all four V5.1 contracts are available under `99_ARCHIVE_SOURCE/`.
- V5.2 prepaid billing specification addendum is present as DRAFT only.
- Prepaid trial threshold direction (100 successful commercial orders excluding 5 test orders) is recorded in `01_STATE/PO_DECISION_REGISTER.md`.
- At the time of this historical snapshot, the Master Specification Gate was awaiting PO approval; this was superseded by Section 5 below.
- Decision 2 remains OPEN: low-wallet warning trigger, channel, frequency, and duplicate suppression.
- This section records the earlier pre-approval state only. The current status and NEXT are defined by Section 5 and `01_STATE/CURRENT_STATE.md`.
- Evidence record: `03_EVIDENCE/GOV-MASTER-SPEC-RECONCILIATION-01_2026-10-09.md`.

## 5. Latest PO Approval Update — 2026-10-09

- PO Tuấn approved the full F&B SMART V5.1 Master Specification and all four V5.1 baseline contracts.
- Master Specification Gate: PO_VERIFIED / APPROVED / PROTECTED / LOCKED.
- Evidence: 03_EVIDENCE/MASTER-SPEC-PO-APPROVAL-2026-10-09.md.
- This is specification approval, not a claim that all application code has been implemented or runtime-tested.
- V5.2 prepaid wallet addendum remains pending PO approval. Low-wallet warning lead time is confirmed as 3 days before projected insufficient balance; channel, repeat frequency, and duplicate suppression remain open.
- NEXT: finalize and approve the V5.2 prepaid wallet specification before opening its implementation Work Item.


## 6. Latest Work Item Handoff — V5.2 Prepaid Wallet (2026-10-09)

- **PO direction:** Proceed with V5.2 prepaid wallet implementation; PO says specification is complete.
- **Do not reopen:** 3,000 VND per service day per eligible employee/kitchen connection; owner exempt; 100 successful commercial orders excluding 5 test orders; low-wallet warning 3 days before projected insufficiency.
- **FIRST FAILURE / BLOCKED:** Official Clean Rebuild repository has exports to missing account source paths and lacks server-side `functions/` and `firestore.rules`.
- **Evidence/issue:** https://github.com/TuanLamVi/fnb-smart-v5-clean-rebuild/issues/1
- **Next:** Resolve the source-baseline and server-side security foundation in the official Clean Rebuild repository. Do not patch frozen legacy source or implement wallet financial mutations as client-authoritative writes.
- **No claims:** No application code changed, no tests/build/deployment passed, and no PO verification of app behavior.
