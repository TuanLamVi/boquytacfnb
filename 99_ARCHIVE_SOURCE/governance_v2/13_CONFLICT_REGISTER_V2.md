STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# SỔ XUNG ĐỘT V2
STATUS: DRAFT / REVIEW CANDIDATE. Không conflict nào được đóng trong Vòng 5.

| ID | Nguồn / claim | Phân loại hiện tại | Tác động có thể có | Trạng thái |
|---|---|---|---|---|
| C01 | KIM_CHI_NAM_REHABILITATION §8: R1 Security PASS_TEMPORARY/REGRESSION_REQUIRED; KIM_CHI_NAM_CAI_TAO_FNB_SMART §8: CURRENT_PHASE A0/NOT_STARTED | Chưa rõ cùng phạm vi hay không | Chọn nhầm phase/hành động | OPEN — UNRESOLVED; kiểm tra phạm vi, cần PO nếu xung đột quy tắc |
| C02 | Guide A §12 giao build/install cho Agent; Guide B §6 nói Tuấn thao tác thiết bị thật, AI làm kỹ thuật | PO LAW-014 làm rõ forward division: Agent phụ trách build/APK/install khi prompt cho phép; PO thực hiện thao tác nghiệp vụ và quyết định acceptance | Không phân biệt build/install với PO product test | Clarified for future tasks by PO LAW-014; legacy wording reconciliation remains unresolved. |
| C03 | Product Charter §§1,4 nêu repo/Firebase mới; PO prompt nêu phục hồi repo hiện hữu; Guide B nói dùng nền hiện tại | Hợp đồng/track | Tạo project mới do suy diễn hoặc bỏ qua hợp đồng | CONFLICT REQUIRES PO DECISION; hợp đồng không đổi |
| C04 | CURRENT_STATE ghi A2 đang làm/A3.3 locked; CHECKPOINTS header ghi A1 và có checkpoint sau | Trạng thái dự án | Chọn sai phase/phạm vi bảo vệ | OPEN — UNRESOLVED |
| C05 | ROADMAP khác CURRENT_STATE/CHECKPOINTS/AI_HANDOFF | Kế hoạch/trạng thái | Sai thứ tự hoặc bảo vệ | OPEN — UNRESOLVED |
| C06 | fnb-smart, fnb-smart-staging, fnb-smart-dev dùng khác nhau | Môi trường | Nhắm sai đích | OPEN — UNRESOLVED; ID riêng biệt, lựa chọn hiện tại UNPROVEN |
| C07 | PO LAW-014 designates Gradle 8.11.1/Kotlin 2.2.20/SDK 36 target baseline; REENTRY-001 snapshot records Gradle 9.3.0/Kotlin 2.2.21 | Normative target clarified by PO; actual checkout/runtime configuration remains unverified and may differ | Build with wrong toolchain or infer active config | OPEN — actual environment/toolchain unresolved until read-only inspection before authorized build |
| C08 | CHECKPOINTS có hai A1.2 cùng nội dung chính nhưng Next khác | Hồ sơ trùng | Mơ hồ sequence/lịch sử | OPEN — chưa xử lý; V2 không gộp hoặc sửa record |
| C09 | PASS, PASS_TECHNICAL, VERIFIED, COMPLETED, YES, PROTECTED, PO_VERIFIED lẫn nhau | Ngữ nghĩa legacy | AI suy ra PO approval | OPEN — không tự ánh xạ; cần giữ ngữ cảnh |
| C10 | REENTRY-001 findings chưa đối chiếu KNOWN_ISSUES; REGRESSION_LOG nói chưa ghi hồi quy | Audit/issue/regression | Bỏ sót hoặc phân loại sai | OPEN — UNRESOLVED |
| C11 | STATE_MACHINES §2 T4 ghi markTableClean/create_order | Mơ hồ hợp đồng | Sai cách hiểu command/permission | OPEN — UNRESOLVED |
| C12 | Invariant phân bổ invoice và ranh giới invoice đảo âm chưa diễn đạt rõ như nhau | Mơ hồ hợp đồng | Áp dụng sai invariant | OPEN — UNRESOLVED |
| C13 | ROADMAP lặp tiêu đề PHASE 3, đánh số chi tiết/tóm tắt khác | Cấu trúc kế hoạch | Sai thứ tự | OPEN — UNRESOLVED; không sửa legacy |

Pre-consolidation note: at the time of the original register rows, C01/C02 had no recorded PO disposition in this draft. The dated Current PO disposition addendum below records the later explicit PO decisions; preserve the original rows as historical baseline and use the addendum for current PO direction. Bảo toàn nguồn và lịch sử của mọi claim.

## Taxonomy update — 2026-09-26
PO has resolved the forward-looking parent/branch naming rule: A0/A1/A2/A3/A4... are parent stages and decimal IDs are branches under the matching parent. This resolves which level A2.2/A3.3 belongs to; it does NOT resolve historical phase-to-A-stage crosswalks, parent-stage results, duplicate records, or current-state claims. Preserve those as UNRESOLVED pending evidence/PO decision. Do not close C13 or promote a child result solely because of this taxonomy instruction.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## Current PO disposition — C01–C13 — 2026-09-26
Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”. The original register entries above are preserved as historical baseline; this dated addendum records current PO direction and does not erase source conflicts, adopt Governance V2, or change contracts/config/checkpoints.

| ID | Current PO disposition | Remaining evidence / conflict state |
|---|---|---|
| C01 | Explicit rule: do not select a source; compare scope/time and preserve both. | UNRESOLVED wherever same-scope conflict is not proven. |
| C02 | Explicit forward split: Agent build/install/open/launch verification; PO device UI/business test and acceptance. | Launch is not business PASS. Legacy interpretation is clarified by this decision; retain original wording. |
| C03 | Existing-project rehabilitation is the current track. | Product Charter text remains unchanged; no migration or replacement project authorized. |
| C04 | A0-forward review and per-stage journal/protection requirements are decided. | Legacy operational phase disagreements remain unresolved; this consolidation does not revalidate stages. |
| C05 | Canonical A-stage and hyphen child-ID system is decided. | Historical IDs remain; crosswalk unresolved unless scope evidence proves identity. |
| C06 | PO-designated Firebase Project Name is `fnb-smart-dev`, Project ID is `fnb-smart`. | HISTORICAL CONCLUSION: BLOCKED — do nhầm Project Name / Project ID. CURRENT CONCLUSION: NOT BLOCKED — đã xác minh lại. PROJECT NAME: fnb-smart-dev, PROJECT ID: fnb-smart. Static checkout references `fnb-smart` as project_id which matches Firebase Project ID. |
| C07 | Toolchain baseline reconciled per A0-C07-05: Gradle updated to 8.13 to support AGP 8.11.1. | Resolved by proven build and real-device test on Note 8 & M51. |
| C08 | Preserve both A1.2 entries without choosing/merging/deleting. | Different Next values remain unresolved. |
| C09 | Keep technical PASS, PO PASS, PO_VERIFIED and LOCKED distinct. | Historical labels remain source-attributed, not remapped. |
| C10 | Audit findings are not automatically Official Bugs. | Individual findings require evidence and actual-behavior review before classification. |
| C11 | Do not assert conflict without behavior evidence; distinguish command/permission/state/behavior. | No behavior test in this consolidation; retain contract sources. |
| C12 | Sale allocation is nonnegative; Reversal may be negative. | Product Charter wording is less explicit about scope; record cross-reference, do not change contract or logic. |
| C13 | Canonical roadmap order is A0→A1→A2→A3→A4…; old numbering is historical. | Legacy Roadmap numbering/duplicate Phase 3 remains preserved; no crosswalk inferred. |

The prior “C01–C13 awaiting PO decision” wording is superseded only for the explicit decisions above. UNRESOLVED refers to remaining evidence/scope questions, not absence of the listed PO decisions.
