STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# SỔ QUYẾT ĐỊNH PO V2
STATUS: DRAFT / REVIEW CANDIDATE. Chưa adoption.
## Chỉ dẫn PO có nguồn trong prompt Vòng 3
Nội dung: cho phép tạo bộ dự thảo V2 song song, không sửa tài liệu legacy, không coi V2 active/adopted.
Nguồn: Prompt PO “VÒNG 3 — SOẠN BỘ QUẢN TRỊ MỚI SONG SONG”.
Giới hạn: không phải phê duyệt/adoption V2, giải quyết conflict, PO_VERIFY checkpoint hoặc cho phép migration.
## Chờ quyết định PO
- Có adoption V2 hay không, phạm vi và ngày hiệu lực.
- G0 contract amendment, if separately proposed; current PO direction for this track is to rehabilitate the existing project (C03).
- Các claim phase/status/checkpoint legacy mâu thuẫn.
- Thiết bị cần được PO chỉ định cho nhiệm vụ cụ thể; actual Firebase/toolchain checkout mismatches require a separate authorized action before build/config change.
- Remaining evidence/scope questions in C01–C13 disposition addendum; the explicit decisions recorded there are not awaiting a second decision.
Chỉ thêm quyết định PO rõ ràng kèm nguồn/ngày/phạm vi. Agent ghi log không phải bằng chứng PO đã quyết định. PO PASS chưa đủ để ghi PO_VERIFIED nếu thiếu lệnh riêng theo 00 và 04. Prompt Vòng 5 cho phép sửa dự thảo, không phải adoption.

## PO direction — canonical A-stage hierarchy
Date/source: 2026-09-26, PO prompt “GOVERNANCE V2 / A-STAGE CANONICALIZATION + PROJECT MEMORY”.
Decision: A0/A1/A2/A3/A4... are parent stages; identifiers A2.x/A2.2.x/A3.x/A4.x are branches/items/checkpoints under their numeric parent.
Effect: keep branch and parent results separate; no automatic promotion; parent PASS requires complete parent scope/criteria evidence.
Limit: this decision defines taxonomy only. It does not declare A0–A4 newly passed, verify any checkpoint, adopt Governance V2, or resolve conflicting historical stage/status claims. PO separately directed A2 revalidation from zero after Kim Chỉ Nam completion; not performed here.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## PO decision register — C01–C13 consolidation — 2026-09-26
Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”. These are PO-provided decisions, not decisions inferred by Codex. Governance V2 remains DRAFT — REVIEW CANDIDATE / NOT YET ADOPTED. Preserve earlier entries as historical; this addendum supersedes the prior “C01–C13 awaiting PO decision” wording only for the issues explicitly decided below.

| ID | PO decision | Scope / limitation |
|---|---|---|
| C01 | A — do not choose between conflicting sources; compare scope/time and retain UNRESOLVED when needed. | No rewriting sources to erase conflict. |
| C02 | A — Agent may build, install, open app and verify launch when authorized; PO alone performs business UI testing and decides business PASS, PO_VERIFIED, LOCKED. | Launch is not business PASS; Agent must not operate business UI. |
| C03 | A — continue rehabilitating the existing project. | No repository/project/architecture/platform/Firebase switch absent a new PO decision; this does not rewrite the Product Charter. |
| C04 | A — re-review from A0; keep per-stage history/evidence/result/lock rationale and active-stage IN_PROGRESS details; protect locked scope. | Documentation consolidation did not perform stage revalidation or checkpoint changes. |
| C05 | A — canonical parent stages A0/A1/A2/A3/A4… and hyphenated child IDs. | Old IDs remain historical; crosswalk only with evidence. |
| C06 | B — Firebase Project Name is `fnb-smart-dev`, Firebase Project ID is `fnb-smart`. C06 is NOT BLOCKED (historical BLOCKED conclusion cancelled due to confusion between Project Name and Project ID). | `project_id: fnb-smart` in codebase/config matches Firebase Project ID `fnb-smart`. |
| C07 | A — PO toolchain baseline updated per A0-C07-05 evidence: Flutter 3.41.0; Dart 3.11.0; Java 17.0.20.1+1; Gradle 8.13; AGP 8.11.1; Kotlin 2.2.20; compileSdk 36; targetSdk 35; minSdk 24. | Proven via A0-C07-05 build success and real-device verification on Note 8 & M51. |
| C08 | A — preserve both A1.2 records; do not choose, merge, delete, or rewrite. | Cross-reference only if needed; unresolved successor remains visible. |
| C09 | A — Technical PASS ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED. | No automatic promotion of historical labels. |
| C10 | A — audit/AI finding is not automatically an Official Bug. | Assess evidence/source/Known Issues/Regression Log/actual behavior first. |
| C11 | A — do not assert command/state conflict absent actual-behavior evidence; distinguish COMMAND/PERMISSION/STATE/ACTUAL BEHAVIOR. | Do not change docs/code based on speculation. |
| C12 | A — nonnegative allocation applies to ordinary Sale invoice; Reversal may be negative. | No business-logic changes without a separate prompt. |
| C13 | A — official roadmap sequence is A0→A1→A2→A3→A4…; old phase numbering is historical reference. | No inferred mapping from old roadmap phases. |

Implementation evidence and remaining documentary/configuration mismatches are recorded in `09_CURRENT_STATE_V2.md` and `13_CONFLICT_REGISTER_V2.md`. This register entry does not adopt Governance V2, verify a checkpoint, create PO_VERIFIED, or LOCK any scope.
