STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# QUY TẮC HOẠT ĐỘNG CỦA AI VÀ CODING AGENT

## Phạm vi
Chỉ đọc, phân tích, kiểm tra Git, đề xuất, sửa file được prompt cho phép, chạy xác minh được yêu cầu và build/deploy/install khi được phép. Quy tắc này không tự cấp authorization.

## Không tự quyết định hoặc cấp trạng thái
Coding Agent không được tự cấp PO PASS, PO_VERIFIED, LOCKED hoặc UNLOCK; tự mở rộng scope; tự chọn Firebase, baseline, môi trường hoặc checkpoint đúng; tự giải quyết conflict thuộc PO; suy đoán; đổi AI PASS thành READY_FOR_PO_VERIFICATION/PO PASS; ghi PO_VERIFIED nếu thiếu PO PASS trực tiếp và lệnh riêng; sửa lịch sử hoặc xóa evidence.
ChatGPT thẩm định evidence/scope và có thể xác nhận READY_FOR_PO_VERIFICATION; không quyết định thay PO. Evidence không tự thành decision.

## An toàn và dừng
Không sửa Firebase, production data, code, test, build config hoặc thiết bị ngoài phạm vi. Không phá dirty state. Không commit/push/reset/clean/restore/checkout/rebase/stash nếu PO chưa cho phép rõ.
Đọc records/contracts liên quan, ghi branch/HEAD/status, xác định scope/vùng bảo vệ. Lỗi có ý nghĩa thì dừng và giữ evidence. Sau việc được phép, kiểm tra diff/status và báo UNPROVEN/UNRESOLVED cùng giới hạn. Build/install chỉ khi prompt cho phép và thiết bị được chỉ định; kết quả build/cài không phải PO PASS.

## A-stage continuity and locked-scope gate — 2026-09-26
Before implementation, report:
- CURRENT A-STAGE:
- TASK:
- RELATED A-STAGES:
- LOCKED SCOPE IMPACT: NONE / DETECTED / UNKNOWN

Use the PO-defined parent/branch hierarchy. Branch PASS never promotes its parent. Determine impact against protected behavior, invariant, contract and checkpoint scope; do not equate a listed code file with a permanent file lock. NONE requires read-only impact evidence. DETECTED means STOP before mutation and ask PO with the checkpoint, affected behavior and reason. UNKNOWN permits read-only investigation only; if unresolved, STOP — CONFLICT / IMPACT UNRESOLVED. Do not repeat a protected stage unless PO expressly requests revalidation. A2 revalidation from zero is deferred until the Kim Chỉ Nam is completed and separately authorized.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## LAW-013 — Single Copy Final Report
For every performed prompt, output the entire final report inside exactly one fenced code block using the mandatory template in Kim Chỉ Nam V2 §10. Do not put any report content outside it, split it into blocks, ask PO to combine sections, or alter its fields/order without PO authorization. Report actual outcomes; never overstate AI evidence as PO verification or historical evidence as current verification. If one block cannot be produced, state `STATUS = REPORT_FORMAT_BLOCKED` and do not claim governance completion.

## LAW-014 — Build Baseline & Build Safety
Before any authorized build, inspect the actual checkout/toolchain/Android SDK/Firebase configuration read-only and capture Git state. Follow the PO-designated target and the full procedure in Kim Chỉ Nam V2 §9 LAW-014. The stated baseline does not prove the current checkout matches it. Do not build unless the task explicitly authorizes it; production/release remains protected. If toolchain/environment mismatch or first build failure appears, stop dependent work, preserve evidence and report to PO; do not guess, switch environment, mass-edit config or clean caches. Keep build success separate from app behavior and PO acceptance. Record APK identity and install evidence whenever those actions are authorized. Every build report includes the LAW-014 BUILD fields; if no build, state `NOT EXECUTED — OUT OF SCOPE`.