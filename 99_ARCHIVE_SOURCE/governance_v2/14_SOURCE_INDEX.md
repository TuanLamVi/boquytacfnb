STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# CHỈ MỤC NGUỒN FORENSIC

“Đã đọc” chỉ xác nhận file được đọc trong quá trình lập/đối chiếu V2. Không xác nhận mọi claim trong file là đúng. Claim chỉ được xác minh riêng khi có evidence độc lập đúng phạm vi và ngày.

| Đường dẫn | Vai trò | Đã đọc | Claim đã xác minh bởi V2? | Cách sử dụng / vấn đề |
|---|---|---|---|---|
| docs/DATABASE_SCHEMA_V0.1.md | Hợp đồng dữ liệu G0 | Có | Không; chưa xác minh triển khai | Authority/SoT/conflict |
| docs/FIRESTORE_QUERY_COST_BUDGET_V0.1.md | Hợp đồng query/chi phí G0 | Có | Không; budget không phải số đo hiện tại | Freshness/giả định |
| docs/PRODUCT_CHARTER_V5.1.md | Hợp đồng sản phẩm G0 | Có | Không; không sửa trong Vòng 5 | Repo mới/phục hồi |
| docs/STATE_MACHINES_V0.1.md | Hợp đồng state machine G0 | Có | Không; chưa xác minh code/test | T4/invoice |
| docs/audits/REENTRY-001_FNB_SMART_PROJECT_STATUS.md | Audit snapshot | Có | Không; claim theo phạm vi/ngày audit | Không override state/PO |
| docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md | Kim Chỉ Nam A | Có | Không; giữ claim lịch sử | Khác biệt quy tắc/phạm vi |
| docs/rehabilitation/01_ROADMAP.md | Roadmap/state claims | Có | Không | Phase/status |
| docs/rehabilitation/02_CURRENT_STATE.md | State snapshot | Có | Không | Claim hiện trạng bất đồng |
| docs/rehabilitation/03_CHECKPOINTS.md | Checkpoint registry legacy | Có | Không; PO claims được quy cho hồ sơ | Duplicate/state |
| docs/rehabilitation/04_TEST_EVIDENCE.md | Test evidence legacy | Có | Không; không chạy lại/xác minh hồi tố | Claims chưa re-verified |
| docs/rehabilitation/05_DECISION_LOG.md | Quyết định legacy | Có | Không; ghi theo nội dung nguồn | Cần nguồn/phạm vi |
| docs/rehabilitation/06_CHANGE_LOG.md | Lịch sử thay đổi | Có | Không đối chiếu lại từng thay đổi | Giữ lịch sử |
| docs/rehabilitation/07_REGRESSION_LOG.md | Hồi quy legacy | Có | Không | Đối chiếu audit/issues |
| docs/rehabilitation/08_KNOWN_ISSUES.md | Sổ issue | Có | Không; audit không tự xác nhận xử lý | Khác audit |
| docs/rehabilitation/09_AI_HANDOFF.md | Handoff snapshot | Có | Không; claim vẫn gắn nguồn | State/checkpoint |
| docs/rehabilitation/10_REPORT_TEMPLATE.md | Bản tiện dùng của LAW-013 template; Kim Chỉ Nam V2 §10 là nội dung chuẩn trong V2 | Có | Không áp dụng | Phải khớp nguyên cấu trúc Kim Chỉ Nam; không có PO decision authority |
| LAW-014 PO prompt + docs/rehabilitation/BUILD_BASELINE.md | Historical A0-BUILD-001 plus PO-designated toolchain target | Có | PO target recorded; current static checkout has Firebase/AGP/Kotlin mismatches; runtime not verified | C06/C07 decision and config evidence cross-referenced in 09_CURRENT_STATE_V2.md |
| docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md | Kim Chỉ Nam B | Có | Không; giữ claim lịch sử | Track/device |

Nguồn legacy không bị sửa trong Vòng 5. Đọc không đồng nghĩa xác minh. Chỉ quy trình adoption riêng mới chỉ định nguồn có hiệu lực; chỉ mục này không tạo authority.

## Project Memory addition — 2026-09-26
| Path | Role | Claim verified by this index? | Use / limit |
|---|---|---|---|
| docs/rehabilitation/PROJECT_JOURNAL_V2.md | Historical rollup by canonical A-stage; Project Protection Map | No; this index only points to the source. | Navigate history and branch/parent distinctions. Verify cited claims in original evidence/checkpoint/decision records. Not source of truth, PO decision, adoption or current-state registry. |

The PO taxonomy decision establishes parent/branch naming only. It does not establish stage PASS or resolve all historical state conflicts.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## LAW-013 canonical template source
For Governance V2, the mandatory single-copy report rule and canonical field structure are defined in `00_KIM_CHI_NAM_FNB_SMART_V2.md` §10. `docs/rehabilitation/10_REPORT_TEMPLATE.md` is a convenience copy and must remain aligned. This index does not adopt V2 or change PO authority.

## LAW-014 build safety source
The PO LAW-014 prompt defines the V2 build procedure and PO-designated target. The legacy rehabilitation Kim Chỉ Nam §12 also used the LAW-014 label for device rules; preserve it as historical and do not rewrite it. `BUILD_BASELINE.md` remains a historical evidence record; it does not prove the current checkout matches. Verify runtime configuration before every authorized build. See Kim Chỉ Nam V2 §9 and C06/C07.
## PO C01–C13 decision source — 2026-09-26
| Source | Role | Decision scope | Limits |
|---|---|---|---|
| PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS” (2026-09-26) | Direct PO decision source | C01–C13 current governance directions; use `10_PO_DECISION_REGISTER_V2.md` and `13_CONFLICT_REGISTER_V2.md` for attributed record and residual evidence questions. | Does not adopt Governance V2, verify checkpoints, authorize code/Firebase/toolchain changes, or prove current runtime. Static configuration is separately reported in `09_CURRENT_STATE_V2.md`. |

This source index entry records provenance only; it does not itself grant authority beyond the stated PO decisions or convert static config into runtime verification.
