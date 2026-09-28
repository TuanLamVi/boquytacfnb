STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# BÀN GIAO PHIÊN AI

## Thứ tự đọc
1. Đọc `15_AI_READ_ME_FIRST.md` trước; sau đó chọn các file theo luồng nhiệm vụ. Đọc đủ toàn bộ tài liệu V2 chỉ khi được yêu cầu forensic toàn bộ; mọi file vẫn là dự thảo, chưa có hiệu lực.
2. Đọc bốn hợp đồng G0 liên quan.
3. Đọc hồ sơ legacy: CURRENT_STATE, CHECKPOINTS, TEST_EVIDENCE, DECISION_LOG, CHANGE_LOG, REGRESSION_LOG, KNOWN_ISSUES, AI_HANDOFF, ROADMAP, BUILD_BASELINE và audit liên quan.
4. Đọc PO_DECISION_REGISTER, CONFLICT_REGISTER và SOURCE_INDEX.
5. Ghi Git status/branch/HEAD; xác định đúng file được prompt cho phép sửa và vùng bảo vệ.

## Ngữ cảnh phải giữ
- V2 là DRAFT — REVIEW CANDIDATE, NOT YET ADOPTED; chưa có Kim Chỉ Nam V2 nào có hiệu lực.
- Hai Kim Chỉ Nam cũ vẫn tồn tại; không tự chọn khi claim/phạm vi khác nhau.
- Phase hiện tại UNRESOLVED trong khung V2. Claim cũ chỉ được quy cho nguồn.
- Hồ sơ cũ có claim A0, A1, A2.2-01-FIX-02, A3.3 và GP-01 là PO_VERIFIED/LOCKED; V2 chưa xác minh lại, phủ nhận hoặc sửa chúng. Handoff cũ ghi A2.2-02-FIX-03 là WAITING PO-TEST.
- Firebase IDs khác nhau; lựa chọn môi trường hiện tại UNPROVEN/UNRESOLVED. Không suy ra từ tên.
- BUILD_BASELINE là snapshot lịch sử; baseline/toolchain đang áp dụng UNPROVEN/UNRESOLVED.
- Thiết bị mục tiêu phải được PO chỉ định trong prompt; nếu thiếu thì UNPROVEN.
- REENTRY-001 là audit snapshot, không override checkpoint/state.
- 09_CURRENT_STATE_V2.md chỉ là nguồn trạng thái duy nhất được đề xuất sau adoption và migration riêng; trước đó không có registry V2 hiện hành.

## Phạm vi và điểm dừng
Trong Vòng 5 chỉ 15 file hiện có dưới docs/governance_v2 được phép sửa. Nguồn legacy, audit, bốn G0, code, Firebase, database và thiết bị được bảo vệ. Prompt khác xác định scope riêng. Không chứng minh được quyền, scope, evidence, môi trường hoặc trạng thái thì STOP, ghi UNPROVEN/UNRESOLVED và chờ quyết định; không dựa vào chat/trí nhớ.

## Project Memory handoff fields — PO direction 2026-09-26
Use PROJECT_JOURNAL_V2.md as a history index, not source of truth. Before coding, summarize:
PROJECT:
CURRENT A-STAGE:
CURRENT TASK:
COMPLETED A-STAGES:
PROTECTED A-STAGES / BRANCHES:
OPEN A-STAGES:
A-STAGE BRANCHES:
KNOWN UNRESOLVED:
LOCKED SCOPE IMPACT: NONE / DETECTED / UNKNOWN
NEXT ACTION:

Separate historical branch claims from parent results. In particular, A2.2 PASS ≠ A2 PASS and A3.3 PASS ≠ A3 PASS. If current-state sources conflict, retain UNRESOLVED and request the needed PO decision. No READY TO PROCEED conclusion while task scope or locked-scope impact is UNKNOWN.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## LAW-013 — REPORT TEMPLATE continuity
Every prompt handoff must preserve the requirement to return one final report in one fenced code block, following the fixed template in Kim Chỉ Nam V2 §10. Do not change the template fields/order without PO authorization. If the output format cannot be met, report `STATUS = REPORT_FORMAT_BLOCKED`; do not represent the prompt as fully governance-complete. Keep report outcomes evidence-based and distinguish AI results, PO decisions, and historical claims.

## LAW-014 build handoff
- PO-designated A0-BUILD-001 target: Flutter 3.41.0 / Dart 3.11.0 / Java 17.0.20.1+1 / Gradle 8.11.1 / AGP 8.11.1 / Kotlin 2.2.20 / compileSdk 36 / targetSdk 35 / minSdk 24.
- PO-designated environment reference: Firebase `fnb-smart`, STAGING, Default flavor; this is not runtime verification. C06/C07 remain unresolved for actual selected environment/toolchain until checked.
- `BUILD: NOT EXECUTED — OUT OF SCOPE` unless the prompt explicitly authorizes build.
- For authorized build, inspect current config first; stop on mismatch; never infer production/staging from a filename. Record full APK identity, install/device evidence and LAW-014 report fields. Build PASS is not product/PO PASS.
## PO C01–C13 decision consolidation — 2026-09-26
Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”. Governance V2 remains DRAFT / NOT ADOPTED. Read the source-attributed dispositions in `10_PO_DECISION_REGISTER_V2.md` and `13_CONFLICT_REGISTER_V2.md` before acting.

- C02: Agent may build/install/open the app and verify launch only when authorized; no business UI operations or business test. PO performs UI/business test and decides PASS/PO_VERIFIED/LOCKED. Launch success is not business PASS.
- C03: current track is rehabilitation of the existing project; do not change repo/project/architecture/platform/Firebase without a new PO decision.
- C04/C05/C13: review from A0; canonical stages A0→A1→A2→A3→A4…; hyphen child IDs only. Preserve old IDs as historical references; no inferred crosswalk. No revalidation is performed by documentation consolidation.
- C06: current PO-designated Firebase project is `fnb-smart-dev`; checkout config currently references `fnb-smart`. Do not change config without separate authorization.
- C07: preserve PO toolchain target and report static mismatches; do not change versions or build without authorization.
- C01 and C08–C12: follow the precise limits in the PO Decision Register; retain unresolved scope/evidence and historical records. Never infer PO verification, official bug status, or a contract behavior conflict.
