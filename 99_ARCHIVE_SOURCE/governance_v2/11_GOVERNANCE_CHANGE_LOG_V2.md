STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# NHẬT KÝ THAY ĐỔI QUẢN TRỊ V2
STATUS: DRAFT / REVIEW CANDIDATE. Ghi lịch sử dự thảo, không phải adoption.

## Tạo bộ V2
- Ngày: 2026-09-26.
- Thực hiện: Codex.
- Prompt: VÒNG 3 — SOẠN BỘ QUẢN TRỊ MỚI SONG SONG.
- Tạo 15 file dưới docs/governance_v2/ làm bộ dự thảo để xem xét.
- Nguồn liệt kê tại 14_SOURCE_INDEX.md.
- Tài liệu legacy sửa: KHÔNG.
- PO approval/adoption: KHÔNG TUYÊN BỐ.

## Chỉnh lý dự thảo V2
- Ngày: 2026-09-26.
- Thực hiện: Codex.
- Prompt: VÒNG 5 — HOÀN THIỆN BỘ QUẢN TRỊ F&B SMART V2.
- Phạm vi thực tế: 15 file hiện có trong docs/governance_v2/.
- Thay đổi: Việt hóa nội dung chính; nêu vai trò Coding Agent/ChatGPT/PO; thêm READY_FOR_PO_VERIFICATION và lệnh ghi nhận riêng PO_VERIFIED; đề xuất một CURRENT_STATE duy nhất sau adoption/migration; phân biệt UNPROVEN/UNRESOLVED; giữ claim lịch sử và conflict chưa được quyết định.
- Nguồn legacy, audit và 4 G0 docs sửa: KHÔNG.
- PO phê duyệt/adoption: KHÔNG TUYÊN BỐ.
- Code/Firebase/database/build/deploy/install/commit/push: KHÔNG THỰC HIỆN.

## A-stage canonicalization and Project Memory — 2026-09-26
- Source: PO prompt “GOVERNANCE V2 / A-STAGE CANONICALIZATION + PROJECT MEMORY”.
- Added: parent/branch status distinction, Project Journal role and read path, locked-scope impact gate, A-stage handoff fields, source-attributed A-stage state frame.
- Added rehabilitation Project Journal V2, canonical roadmap note and dated state/checkpoint/handoff addenda. Legacy event records were preserved.
- A2 revalidation: NOT performed; explicitly deferred by PO until Kim Chỉ Nam completion and a separate instruction.
- Governance V2 status: remains DRAFT — REVIEW CANDIDATE / NOT YET ADOPTED. No migration, PO stage pass, PO_VERIFIED or LOCKED was created.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## LAW-013 single-copy report rule — PO direction
- Added a mandatory one-fenced-code-block final report rule and fixed field template to Kim Chỉ Nam V2 §10.
- Aligned AI Operating Rules, Session Handoff and AI Read First; aligned the rehabilitation report-template copy.
- The rule is documented in draft governance only; Governance V2 remains DRAFT — NOT YET ADOPTED. No adoption or PO verification is implied.

## LAW-014 Build Baseline & Build Safety — PO direction
- Added mandatory build authorization, PO-designated baseline, pre-build environment inspection, production protection, APK identity, forensic failure handling and required build-report fields to Kim Chỉ Nam V2.
- Preserved A0-BUILD-001 and audit snapshots as historical evidence. C06/C07 remain unresolved for actual runtime configuration; C02 is clarified for future task responsibility only.
- No build, install, Firebase operation, device action, code change or adoption was performed.
## C01–C13 PO decision consolidation — 2026-09-26
- Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”.
- Scope: source-attributed updates to Governance V2 Decision Register, Conflict Register, Current State, Source Index, Kim Chỉ Nam clarification and AI handoff/read-first references.
- Recorded: all 13 decisions with explicit limits; Firebase current designation `fnb-smart-dev`; PO toolchain target; A0-forward review; C02 technical launch versus PO business-test boundary.
- Preserved: legacy decisions, phase IDs, duplicate A1.2 records, checkpoint status/history, G0 contracts, existing code/config, and unresolved source-scope questions.
- Evidence: static current config identifies `fnb-smart`; static AGP/Kotlin differ from target. No runtime check, Firebase operation, build, test, device action, PO_VERIFIED, LOCKED, commit or push was performed.
- Governance V2 remains DRAFT — REVIEW CANDIDATE / NOT YET ADOPTED.
