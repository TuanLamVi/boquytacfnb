STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# MÔ HÌNH CHECKPOINT

Checkpoint ghi nhận PO chấp nhận phạm vi xác định và bảo vệ phạm vi khỏi hồi quy. Registry không tự cấp thẩm quyền.

## Quy trình
1. Coding Agent đề xuất phạm vi, tiêu chí, evidence, branch/HEAD, file ảnh hưởng, vấn đề, vùng bảo vệ và điều kiện hồi quy.
2. Agent thực hiện trong phạm vi được phép, kiểm tra theo prompt và báo AI PASS/lỗi kèm evidence. AI PASS không phải READY_FOR_PO_VERIFICATION.
3. ChatGPT thẩm định phạm vi, tiêu chí, evidence và Kim Chỉ Nam. Chỉ khi đủ hồ sơ, ChatGPT xác nhận READY_FOR_PO_VERIFICATION; nếu thiếu thì nêu phần thiếu.
4. PO trực tiếp kiểm tra thực tế và duy nhất quyết định PO PASS/FAIL. ChatGPT không quyết định thay PO.
5. PO PASS chưa cho phép ghi PO_VERIFIED. PO phải gửi lệnh ghi nhận riêng, rõ CHECKPOINT-ID/phạm vi, ví dụ:
   GHI NHẬN PO_VERIFIED:
   [CHECKPOINT-ID]
   PO đã trực tiếp kiểm tra và xác nhận PASS.
   Ghi nhận vào hồ sơ dự án.
6. Agent xác nhận có evidence PO PASS đúng phạm vi và lệnh hợp lệ rồi mới ghi PO_VERIFIED vào registry hiện hữu. Thiếu/sai lệnh, ID hoặc evidence: dừng; ghi UNPROVEN/UNRESOLVED; không ghi PO_VERIFIED, không LOCKED.
7. Chỉ sau PO_VERIFIED hợp lệ mới ghi LOCKED cho đúng phạm vi, khi registry có ID, ngày, nguồn PO, evidence, branch/HEAD nếu có, protected scope, giới hạn và điều kiện hồi quy. Thiếu thông tin bảo vệ thì không tuyên bố LOCKED.
8. Nghi hồi quy: dừng, giữ evidence, ghi và báo cáo. Chỉ PO cho phép mở lại; Agent không tự unlock, xóa hoặc viết lại lịch sử.

## Quy tắc hồ sơ
ChatGPT READY chỉ mở cổng PO kiểm tra. Registry ghi, không quyết định. Build/test/deploy/install thành công không tạo PO PASS. So khớp checkpoint theo ID, phạm vi, evidence, ngày và vùng bảo vệ; chỉ gộp khi cùng danh tính được chứng minh và có authorization. Nếu không rõ, giữ riêng, ghi UNRESOLVED. Claim lịch sử không tự được xác minh lại hoặc di trú bởi V2.

## Parent-stage versus branch checkpoint
Canonical A-stage hierarchy per PO (2026-09-26): A0/A1/A2/A3/A4... are parent stages; A2.x/A3.x/A4.x are branches. A child checkpoint records only its recorded branch scope. It cannot promote the parent. Parent PASS requires evidence for all parent acceptance criteria and an applicable PO acceptance record. Preserve legacy branch statuses; do not rewrite them to match a parent.

## Protection impact, not blanket file lock
Before a task, identify CURRENT A-STAGE, TASK, RELATED A-STAGES and LOCKED SCOPE IMPACT (NONE / DETECTED / UNKNOWN). Map checkpoints to accepted behaviors, business rules, contracts/invariants and protected scope. File/component lists are impact references, not automatic permanent file locks. DETECTED impact: stop before mutation, identify checkpoint and behavior, explain the change and request PO decision. UNKNOWN: investigate read-only; if it remains unknown, STOP. NONE requires evidence that protected behaviors/invariants are not affected. An explicit PO authorization is required to reopen or change a locked acceptance; the Agent never unlocks it.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.