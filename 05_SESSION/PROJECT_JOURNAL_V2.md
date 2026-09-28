DOCUMENT TYPE: PROJECT MEMORY — HISTORICAL ROLLUP
STATUS: DRAFT — evidence-indexed; not governance authority
AS OF: 2026-09-26
PO: Tuấn

# PROJECT JOURNAL V2 — A-STAGE MAP & PROTECTION

## Purpose and reading rules
This file organizes project history by canonical parent stage and records where each claim came from. It is not a Kim Chi Nam, source-of-truth registry, acceptance decision, or permission to edit. Preserve legacy records. A cited claim remains attributed to its source; this journal does not independently verify it.

Canonical IDs per PO direction (2026-09-26): A0, A1, A2, A3, A4... are parent stages; new child IDs use hyphens (A2-01, A2-02, deeper A2-02-01 only when needed). Existing decimal/legacy IDs remain historical and are not renumbered. Never infer crosswalk from appearance. A child result never promotes its parent. Parent PASS requires complete scope/criteria evidence, required PO testing, no relevant unresolved blocker, and direct PO confirmation. AI and PO result vocabularies remain separate; deferred PO tests remain TEST_DEBT.

Status labels:
- HISTORICAL DOC CLAIM: recorded in a legacy document, not re-performed here.
- GIT_CONFIRMED: named source change is present in commit history. This does not prove build, device test or PO acceptance.
- WORKTREE ONLY: difference exists in the current dirty worktree; not committed evidence.
- PO-PROMPT ASSERTION: explicitly stated in PO-provided prompt; original artifact may still need locating.
- UNPROVEN / UNRESOLVED: evidence or scope is insufficient/conflicting.

## Canonical A-stage map

### New-ID crosswalk register
Canonical child slots are not assigned by this forensic pass. Existing IDs remain historical; map to a hyphenated canonical ID only after scope identity is evidenced. Current crosswalk disposition: A0.1–A0.16 → UNRESOLVED; A1.1/A1.2 and A1.2-01…08 → UNRESOLVED; A2.2-01-FIX-02 and A2.2-02-FIX-03… → UNRESOLVED; A3.3-TABLEMAP-FIX-01 → UNRESOLVED; other legacy IDs → UNRESOLVED unless a source-specific verified mapping is later recorded. This does not change historical result claims.

### Per-stage canonical memory schema
Each stage entry records: A-stage ID; Canonical name; Purpose; Scope; Sub-items; Historical IDs; Canonical IDs; Crosswalk; Evidence; AI result; PO result; Test debt; Protected behavior; Known limitations; Revalidation required; Current status; Source references. For A0–A4 the schema fields are populated below; unknown canonical IDs remain UNRESOLVED.

### A0 — Foundation

**Canonical stage record**
- A-stage ID: `A0`
- Canonical name: as titled below; see Purpose
- Purpose: see Purpose section below
- Scope: see Scope section below
- Sub-items: see Sub-stages below
- Historical IDs: A0.1–A0.16; A0-BUILD-001; A0-FOUNDATION
- Canonical IDs: UNRESOLVED (no child ID assigned without verified scope crosswalk)
- Crosswalk: UNRESOLVED unless a source-specific verified mapping is explicitly listed
- Evidence: see Evidence and Source references below
- AI result: see Branch results; technical labels remain distinct
- PO result: historical claim only where cited; no new PO result created
- Test debt: see Known limitations; retain every explicitly deferred PO test
- Protected behavior: see Protection / LOCKED scope below
- Known limitations: see Known limitations below
- Revalidation required: see Revalidation required below
- Current status: see A-stage result below; not inferred from child results
- Source references: see Source references below
#### Purpose
Establish project/runtime foundation and governance/build baseline (legacy Roadmap A0; Kim B A0).

#### Scope
Legacy Kim B lists Git, Flutter/Dart, Android SDK, Firebase Staging, Auth, Firestore, Functions, App Check, region and Tab S3 deployment. Roadmap A0 adds current-state audit, Android/Firebase setup, debug build and real-device install.

#### Sub-stages
Current State mentions A0.1–A0.16, without a complete indexed breakdown here. A0-BUILD-001 is a build-baseline item; A0-FOUNDATION is a parent checkpoint claim.

#### Historical implementation
A0.1 change log records Gradle environment correction, local.properties, staging debug build/install and BUILD_BASELINE creation. DEC-A0-001 later records app startup observations and A0 acceptance. Git history available at this checkout begins 2026-06-03; cited baseline/change records date to 2026-03-31, so those early events are not independently matched to commits here.

#### Evidence
BUILD_BASELINE.md records toolchain, staging Firebase, build command and SM N950F install. Checkpoints and Roadmap record PO acceptance. These are HISTORICAL DOC CLAIMS; original build/device artifacts are referenced but not independently replayed.

#### Branch results
A0-BUILD-001: legacy records claim PO_VERIFIED for build/install. A0-FOUNDATION: Checkpoints claim PO_VERIFIED & LOCKED for full A0.

#### A-stage result
Whole-stage historical result: PASS — PO_VERIFIED & LOCKED is explicitly recorded for full A0 in Roadmap, Current State and A0-FOUNDATION. Preserve that stage-level decision; this journal does not revalidate it. Detailed item-by-item evidence links are incomplete, which is a traceability gap, not a reason to downgrade the historical status.

#### PO status
Legacy records claim PO verification for build baseline and full A0. No new PO decision is made here.

#### Protection / LOCKED scope
A0-FOUNDATION lists build-baseline and Android configuration paths as protected references. Preserve recorded foundation behavior/baseline; a file path is an impact clue, not a blanket ban on future edits.

#### Known limitations
A0.1–A0.16 acceptance map and original evidence artifacts are not linked individually. Current worktree has existing Android/build configuration changes; their relationship to A0 protection has not been reviewed as an implementation task.

#### Revalidation required
Do not silently revalidate or alter A0. Use a separately authorized revalidation if PO requests it.

#### Next
No A0 work is inferred. For any task, assess actual protected behavior and scope first.

#### Source references
rehabilitation/01_ROADMAP.md A0; 02_CURRENT_STATE.md; 03_CHECKPOINTS.md A0-FOUNDATION; 04_TEST_EVIDENCE.md; 05_DECISION_LOG.md DEC-A0-001; 06_CHANGE_LOG.md CHG-A0.1/CHG-A0-LOCKED; BUILD_BASELINE.md; Git HEAD and history.

### A1 — Account & Store

**Canonical stage record**
- A-stage ID: `A1`
- Canonical name: as titled below; see Purpose
- Purpose: see Purpose section below
- Scope: see Scope section below
- Sub-items: see Sub-stages below
- Historical IDs: A1.1; A1.2; A1.2-01…08
- Canonical IDs: UNRESOLVED (no child ID assigned without verified scope crosswalk)
- Crosswalk: UNRESOLVED unless a source-specific verified mapping is explicitly listed
- Evidence: see Evidence and Source references below
- AI result: see Branch results; technical labels remain distinct
- PO result: historical claim only where cited; no new PO result created
- Test debt: see Known limitations; retain every explicitly deferred PO test
- Protected behavior: see Protection / LOCKED scope below
- Known limitations: see Known limitations below
- Revalidation required: see Revalidation required below
- Current status: see A-stage result below; not inferred from child results
- Source references: see Source references below
#### Purpose
Provide account/store lifecycle, Owner and tenant-scoped access (Kim B A1).

#### Scope
Registration, login, store creation, Owner role and storeId scoping; legacy checkpoint adds membership and unauthorized-store access.

#### Sub-stages
A1.1 Account & Store Audit; A1.2 Real-World Verification. The A1.2 checkpoint is duplicated in 03_CHECKPOINTS.md.

#### Historical implementation
Change/evidence records describe account-to-store, membership and unauthorized access tests. Git history has account/store/auth work, but does not independently confirm the reported 2026-03-31 device session.

#### Evidence
TEST-A1-002 and A1.1/A1.2 checkpoint records claim PO verification, including a real Tab S3 run. Treat as HISTORICAL DOC CLAIM until cited raw evidence is available.

#### Branch results
A1.1 and A1.2: documents claim PO_VERIFIED & LOCKED. Duplicate A1.2 entries remain preserved.

#### A-stage result
Whole-stage historical result: Roadmap/Current State and A1.1/A1.2 records state A1 completed and PO_VERIFIED & LOCKED for the Account & Store flow. Preserve that recorded parent result; this journal does not revalidate it. Duplicate A1.2 records and missing raw artifact links are traceability issues, not a reason to downgrade the historical status.

#### PO status
Legacy records claim PO verification for A1.1/A1.2. No new verification here.

#### Protection / LOCKED scope
Historical protected behavior covers account/store lifecycle, membership binding and tenant isolation. Checkpoint names components; protect those outcomes/invariants, not every file regardless of future task.

#### Known limitations
Duplicate A1.2 record; evidence mostly described rather than linked as raw artifact; scope-to-criteria coverage not mapped.

#### Revalidation required
No revalidation requested here. Preserve branch claims and require PO authorization for any official revalidation.

#### Next
No A1 action inferred; reconcile duplicate record only under an explicitly authorized history-preserving task.

#### Source references
Kim B A1; 01_ROADMAP.md; 03_CHECKPOINTS.md A1.1/A1.2; 04_TEST_EVIDENCE.md TEST-A1-002; 06_CHANGE_LOG.md; 09_AI_HANDOFF.md.

### A2 — Staff & Permissions

**Canonical stage record**
- A-stage ID: `A2`
- Canonical name: as titled below; see Purpose
- Purpose: see Purpose section below
- Scope: see Scope section below
- Sub-items: see Sub-stages below
- Historical IDs: A2.2-01-FIX-02; A2.2-02-FIX-03; BUILD-001; PO-TEST
- Canonical IDs: UNRESOLVED (no child ID assigned without verified scope crosswalk)
- Crosswalk: UNRESOLVED unless a source-specific verified mapping is explicitly listed
- Evidence: see Evidence and Source references below
- AI result: see Branch results; technical labels remain distinct
- PO result: historical claim only where cited; no new PO result created
- Test debt: see Known limitations; retain every explicitly deferred PO test
- Protected behavior: see Protection / LOCKED scope below
- Known limitations: see Known limitations below
- Revalidation required: see Revalidation required below
- Current status: see A-stage result below; not inferred from child results
- Source references: see Source references below
#### Purpose
Manage staff, invitations/membership, roles and server-side permissions (Kim B A2).

#### Scope
Owner/Manager/Cashier/Waiter/Kitchen/Auditor roles, membership and tenant permissions. Legacy roadmap separately names duplicate-join prevention and a role-based permission bypass fix.

#### Sub-stages
A2.2-01-FIX-02 Duplicate Join Prevention; A2.2-02-FIX-03; A2.2-02-FIX-03-BUILD-001; A2.2-02-FIX-03-PO-TEST.

#### Historical implementation
Change log records duplicate-membership/request checks and role-based bypass removal. Current worktree has uncommitted differences in store_repository.dart and join_store_controller.dart. A Git diff proves only the present worktree delta; it does not prove when/why it was performed or a passed test.

#### Evidence
TEST-A2-FIX-02 records PO-reported real-device TEST 8A/8B/8C. BUILD-001 records build/install/launch evidence, while CHG-A2.2-02-FIX-03 and AI handoff explicitly say PO test deferred.

#### Branch results
A2.2-01-FIX-02: checkpoint/log claim PO_VERIFIED & LOCKED. A2.2-02-FIX-03-BUILD-001: PROTECTED / GOLDEN BUILD, not acceptance of permission behavior. A2.2-02-FIX-03: UNRESOLVED / WAITING PO-TEST; PO_UNVERIFIED / TEST_DEBT. AI_PASS is not established by the cited records, so do not assign it. Record the historically deferred Note 8/M51 test debt where present in the source logs; retain it for A0-forward revalidation.

#### A-stage result
A2 = NOT VERIFIED / UNRESOLVED. A branch PASS cannot establish the entire A2 scope.

#### PO status
PO explicitly requested A2 revalidation from zero after the Kim Chỉ Nam is complete. Do not start that revalidation under this journal task.

#### Protection / LOCKED scope
Retain the historical A2.2-01 duplicate-join protection claim. Do not regress existing member/request behavior. Keep A2.2-02 functional acceptance unresolved; build protection is not PO acceptance.

#### Known limitations
Full role/membership/tenant-permission acceptance is not mapped. The working tree is dirty in files named by the duplicate-join protection record.

#### Revalidation required
YES — A2 REVALIDATION FROM ZERO after the Kim Chỉ Nam is completed and under a separate PO instruction. Preserve historical A2.x results; do not promote them to A2 PASS.

#### Next
Wait for the separate authorized revalidation task; no tests or code changes in this task.

#### Source references
Kim B A2; 01_ROADMAP.md; 03_CHECKPOINTS.md A2.2 entries; 04_TEST_EVIDENCE.md; 05_DECISION_LOG.md; 06_CHANGE_LOG.md; 08_KNOWN_ISSUES.md; 09_AI_HANDOFF.md; worktree diff.

### A3 — Product, Catalog & Kitchen Stations

**Canonical stage record**
- A-stage ID: `A3`
- Canonical name: as titled below; see Purpose
- Purpose: see Purpose section below
- Scope: see Scope section below
- Sub-items: see Sub-stages below
- Historical IDs: A3.3-TABLEMAP-FIX-01
- Canonical IDs: UNRESOLVED (no child ID assigned without verified scope crosswalk)
- Crosswalk: UNRESOLVED unless a source-specific verified mapping is explicitly listed
- Evidence: see Evidence and Source references below
- AI result: see Branch results; technical labels remain distinct
- PO result: historical claim only where cited; no new PO result created
- Test debt: see Known limitations; retain every explicitly deferred PO test
- Protected behavior: see Protection / LOCKED scope below
- Known limitations: see Known limitations below
- Revalidation required: see Revalidation required below
- Current status: see A-stage result below; not inferred from child results
- Source references: see Source references below
#### Purpose
Manage categories/products, price/units, preparationMode and stationId (Kim B A3).

#### Scope
Kim B A3 describes categories, products, pricing, units and hot_kitchen/bar/cold_kitchen/oven/none station assignment.

#### Sub-stages
No reliable A3 product/station child-stage index found. A3.3 exists in legacy checkpoint records, but its title and evidence concern Table Map logout/login sync, not the A3 product/station scope in Kim B. Under PO taxonomy its identifier belongs beneath A3; the historical content mismatch is preserved and unresolved.

#### Historical implementation
Git contains product/menu and station-related history. Current worktree contains station-model/service/test additions and product/station edits; these are not all committed. They establish code artifacts, not completion or live station activation.

#### Evidence
Existing menu/product unit tests and current untracked tests are source artifacts; they were not run in this forensic task. No PO-approved A3-wide acceptance evidence was found.

#### Branch results
A3.3-TABLEMAP-LOGOUT-LOGIN-FIX is recorded PO_VERIFIED & LOCKED as a branch checkpoint, with real-device claims for M51 and Note 8. It does not establish A3 parent PASS.

#### A-stage result
A3 = UNRESOLVED / NOT VERIFIED.

#### PO status
No A3-wide PO decision established by the sources reviewed.

#### Protection / LOCKED scope
Preserve the A3.3 historical table-map behavior claim and assess impacts to it. Do not silently relabel its technical scope as product/station work.

#### Known limitations
A3.3 title/scope differs from Kim B A3. WP-03 station seed/activation and real KDS station acceptance are not established. The prompt reports a historical STATION_NOT_ACTIVE event; raw source evidence was not located.

#### Revalidation required
No A3-wide revalidation requested here. Resolve mapping/scope before claiming A3 complete.

#### Next
Keep product/station work and A3.3 table-map checkpoint as separate historical evidence until PO resolves the scope relationship.

#### Source references
Kim B A3; 01_ROADMAP.md; 03_CHECKPOINTS.md A3.3; 04_TEST_EVIDENCE.md TEST-A3.3; 05_DECISION_LOG.md; 06_CHANGE_LOG.md; current source/tests and Git status.

### A4 — Tables & Table State

**Canonical stage record**
- A-stage ID: `A4`
- Canonical name: as titled below; see Purpose
- Purpose: see Purpose section below
- Scope: see Scope section below
- Sub-items: see Sub-stages below
- Historical IDs: A3.3 table-map record and GP-01 appear in adjacent legacy records; relationship to A4 is not established
- Canonical IDs: UNRESOLVED (no child ID assigned without verified scope crosswalk)
- Crosswalk: UNRESOLVED unless a source-specific verified mapping is explicitly listed
- Evidence: see Evidence and Source references below
- AI result: see Branch results; technical labels remain distinct
- PO result: historical claim only where cited; no new PO result created
- Test debt: see Known limitations; retain every explicitly deferred PO test
- Protected behavior: see Protection / LOCKED scope below
- Known limitations: see Known limitations below
- Revalidation required: see Revalidation required below
- Current status: see A-stage result below; not inferred from child results
- Source references: see Source references below
#### Purpose
Manage zones, floor plan, tables/status, table-order association and race prevention (Kim B A4).

#### Scope
Table/zone state and real-time transaction behavior, as stated by Kim B and legacy Phase 4.

#### Sub-stages
No A4.x branch was confirmed in the reviewed roadmap/checkpoint index. GP-01 is a separately named Golden Path item; do not recast it as A4.x without explicit mapping.

#### Historical implementation
Git includes table-map and table-order work. A3.3 is a specific table-map logout/login fix; GP-01 is a specific rules/open-table fix. Neither establishes all of A4.

#### Evidence
A3.3 records PO real-device claims on M51/Note 8. GP-01 records a PO real-device claim for opening a new table, but its log date is later than current HEAD. No A4-wide acceptance record was found.

#### Branch results
A3.3 and GP-01 retain their own legacy status claims. They are not a parent A4 PASS.

#### A-stage result
A4 = OPEN / NOT VERIFIED. PO-directed current working stage is A4, based on PO-provided project context; the current product task within A4 is not specified in source records.

#### PO status
No A4-wide PO verification established.

#### Protection / LOCKED scope
Assess table-map sync behavior under A3.3 and orders tenant rules under GP-01 when relevant. Their individual protected claims do not lock all A4 files or establish A4 completion.

#### Known limitations
Current State, Checkpoints and Handoff disagree about stage/progress. Current worktree also has a pre-existing diff to table_realtime_service.dart and firestore.rules.

#### Revalidation required
No A4-wide revalidation authorized here.

#### Next
PO to provide the specific A4 product task and reconcile project state before product execution. This documentation task is not evidence that an A4 feature passed.

#### Source references
Kim B A4; 01_ROADMAP.md Phase 4; 02_CURRENT_STATE.md; 03_CHECKPOINTS.md A3.3/GP-01; 04_TEST_EVIDENCE.md; 09_AI_HANDOFF.md; Git HEAD/worktree.

## Later stages (scope map only; no parent acceptance)
- A5 Orders & Order Lines: headers/lines, receipt, mutationId, outbox and idempotency (Kim B). Git shows order/POS commits; no A5-wide PO acceptance found.
- A6 KDS: tickets, stations, states and kitchen flow (Kim B). Git shows KDS work; no A6-wide acceptance found.
- A7 Invoice & Payment: checkout, invoice, payment methods and duplicate-payment controls (Kim B). Git shows checkout/payment work; no A7-wide acceptance found.
- A8 Debt/recovery: debt lite, unallocated funds, adjustments, refunds/reversals. No stage-level acceptance found.
- A9 Offline/outbox: local queue, sync/retry, receipt recovery and deduplication. Worktree backup/artifacts show outbox code snapshots, not stage acceptance.
- A10 Shift/reporting/audit: shift lifecycle, cash drawer, logs and daily summary. Git contains reporting/finance changes, not stage acceptance.
- A11 Golden Path: end-to-end module flow. GP-01 evidence covers only opening a table; no A11-wide pass is established.
For A5–A11, stage results are UNRESOLVED unless separately evidenced. Legacy Phase 3–8 statuses are not automatically mapped to these A-stage parents.

## Historical work items that must remain distinct
- WP-01 Order Read Model: PO prompt states a Tab S3 Bàn 4 checkout showed bún bò huế, sinh tố bơ and 100.000đ. Preserve as PO-PROMPT ASSERTION of prior real-device evidence; original evidence pointer was not found in repository search. Current dirty diff adds canonical order-line reading and tests/files exist, but they are WORKTREE ONLY and were not run here. Neither status proves an A5 parent pass or creates a new PO decision.
- PROMPT 180 routing: /checkout and /table-order are present in lib/main.dart at HEAD; Git history includes route-related changes from June through August. The exact “PROMPT 180” label was not found.
- WP-02 Kitchen semantics: PO prompt states local enqueue did not equal server acceptance; server returned STATION_NOT_ACTIVE and UI changed to an explicit local-pending message. Preserve this PO-PROMPT ASSERTION; raw matching log was not found. A separate artifact plan describes existing-order revision initialization and server rejection risk; do not merge the two events.
- WP-03 Stations: stationId/preparationMode code and worktree tests/services exist; no full station seed/activation, server acceptance or PO verification record found. Status: UNRESOLVED / PO MEMORY REQUIRED.
- RC16/RC17: untracked RC16 artifact reports technical mini-gate/user verification and says production Play Integrity pending. Git confirms RC16/RC17/auth-session/store-recovery and app-ID commits through HEAD 2026-08-13. This is release/history evidence, not an A-stage parent decision.

## Project Protection Map
| Parent / item | Historical protection claim | Protected behavior/result | Limits / current classification |
|---|---|---|---|
| A0 / A0-FOUNDATION | PO_VERIFIED & LOCKED in legacy Checkpoints | Foundation/build baseline and listed Android build references | Historical parent-stage checkpoint claim is PO_VERIFIED & LOCKED; preserve it. File list is an impact reference, not blanket immutable files. |
| A1 / A1.1, A1.2 | PO_VERIFIED & LOCKED claims | Account/store lifecycle, membership, tenant isolation | A1.2 duplicate records; preserve both until authorized reconciliation. |
| A2 / A2.2-01-FIX-02 | PO_VERIFIED & LOCKED claim | Duplicate join/request prevention for recorded test scope | Child protection only; A2 parent NOT VERIFIED; A2 revalidation requested separately. |
| A2 / A2.2-02-FIX-03-BUILD-001 | PROTECTED / GOLDEN BUILD | Specific debug build/install artifact | Not permission-behavior acceptance; PO test deferred. |
| A3 / A3.3 table-map fix | PO_VERIFIED & LOCKED claim | Logout/login table map sync and recovery scenarios | Branch scope differs from Kim B A3 product/station purpose; parent not passed. |
| Golden Path / GP-01 | PO_VERIFIED & LOCKED claim | Orders path rules and opening a table | Not mapped to an A-stage parent; do not promote to A4/A11. |
| A4–A11 parent stages | No whole-stage lock found | None established at parent level in reviewed records | Do not infer absence of branch locks; inspect related branch records per task. |

A locked item protects the accepted behavior, business rule, contract/invariant and recorded checkpoint scope. Files/components are tracing aids for impact analysis. Do not edit when impact is detected without the required PO decision; do not declare every historical file permanently immutable.

## Historical chronology (source-attributed)
- 2026-03-31 records describe rehabilitation documentation, A0 build baseline and A1 account/store checks. Git history at this checkout does not reach those dates.
- 2026-06-03 onward: Git confirms table map, POS/cart, KDS, order sync, tenant isolation, RBAC, menu and dashboard commits.
- 2026-06-15–22: Git confirms checkout/payment, table/POS routing and releases; this does not establish whole A-stage acceptance.
- 2026-06-25: legacy logs record A2.2-02 build/install and A3.3 table-map real-device PO acceptance claims.
- 2026-07-01–08-13: Git confirms checkout/web fixes, module refactors, RC14/RC16/RC17 work, auth/session/store recovery and final app ID alignment at HEAD.
- 2026-09-24: current legacy logs claim A2.2-01 and GP-01 PO verification, later than HEAD. Treat as later document claims, not commit-confirmed source changes.
- 2026-09-26: PO defines canonical A-stage parent/child taxonomy and requests A2 revalidation after Kim Chỉ Nam completion. No revalidation was performed here.

## Sources and limits
Primary sources: PO taxonomy instruction; rehabilitation Kim B; 01_ROADMAP.md; 02_CURRENT_STATE.md; 03_CHECKPOINTS.md; 04_TEST_EVIDENCE.md; 05_DECISION_LOG.md; 06_CHANGE_LOG.md; 07_REGRESSION_LOG.md; 08_KNOWN_ISSUES.md; 09_AI_HANDOFF.md; BUILD_BASELINE.md; legacy Kim A; Governance V2 00–15; Git branch/HEAD/log/diff; named RC and implementation-plan artifacts. Read/test is not claim verification. Git commit proves committed change, not product acceptance. Dirty diff proves only present uncommitted difference.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.

## LAW-014 build baseline note — PO prompt
The PO designates A0-BUILD-001 values as the target baseline for future explicitly authorized builds. The 2026-03-31 A0-BUILD-001 success/install record remains historical. The prompt does not verify the current checkout or close C06/C07; inspect runtime configuration before build. Build success is not product PASS or A0 PASS.

## PROMPT A1-12 Record — Canonical Work Item ID Crosswalk / Index Standardized
- **Purpose**: Normalize Canonical Work Item IDs (`A0-01`, `A1-01`, `A1-05`, `A2-01`, `A3-03`, `GP-01`) and map historical aliases without altering historical records or code.
- **Normalized Index Location**: `docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md` (Section 8).
- **Sources**: `01_ROADMAP.md`, `02_CURRENT_STATE.md`, `03_CHECKPOINTS.md`, `05_DECISION_LOG.md`, `BUILD_BASELINE.md`, `WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`.
- **Result**: Established single canonical crosswalk table and completed lookup verification tests (`A0-01`, `A1-01`, `A1-05`, `A2-01`).
- **Gaps**: Granular sub-item execution logs (A0.1–A0.16) consolidated; A1.2 duplicate checkpoint record preserved as historical artifact.
- **PO Verification**: PENDING (Audit & Documentation Task).

## PROMPT A1-12-R2 Record — Canonical Work Item ID Index Corrections Applied
- **Purpose**: Apply verified Canonical Crosswalk corrections from A1-12-R1 forensic audit to `docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`.
- **Corrections Applied**:
  1. `A0.1–A0.16 → A0-01`: Explicitly classified as `SUPPORTED BUT CONSOLIDATED`. Disambiguated `A0-FOUNDATION` (CONFIRMED) & `A0-BUILD-001` (CONFIRMED) baseline from sub-items A0.1–A0.16.
  2. `A1-01..04 → A1-03`: Classified as `SUPPORTED BUT CONSOLIDATED` (audit prompt sequence grouping).
  3. `A1-06 / A1-07 → A1-06`: Classified as `SUPPORTED BUT CONSOLIDATED` (build and deploy pipeline grouping).
  4. `A2.2-01-FIX-02 → A2-01`: Classified as `CONFIRMED` for child item `A2-01`. Explicitly noted `Child PASS != Parent A2 Stage PASS` (`A2` parent stage remains `NOT VERIFIED / UNRESOLVED`).
  5. `A3.3-TABLEMAP-LOGOUT-LOGIN-FIX → A3-03`: Classified as `CONFIRMED` for historical checkpoint `A3.3`, but explicitly noted `PARENT TAXONOMY UNRESOLVED` (Table Map belongs conceptually to Table State A4/Kim B).
  6. **Unresolved Register**: Explicitly recorded unresolved parent stage items (`A3 parent taxonomy / stage mapping`, `Parent A2 stage revalidation required`).
- **Code Changed**: NO
- **PO Verification**: PENDING (Documentation Task)

## PROMPT A1-12-R3 Record — PO Official Adoption of Canonical ID A2-02
- **PO Decision**: PO officially adopts `A2-02` as the active Canonical Work Item ID for historical Work Item `A2.2-02-FIX-03` (Staff Permissions — Role-Based Permission Bypass Removal).
- **Historical Alias & Trace**: `A2.2-02-FIX-03` is preserved as the historical ID and alias. All historical build (`A2.2-02-FIX-03-BUILD-001`), change (`CHG-A2.2-02-FIX-03`), and test debt (`A2.2-02-FIX-03-PO-TEST`) records remain preserved and fully traceable.
- **Reason for Canonicalization**: Standardizing active Work Item naming using standard hyphenated taxonomy (`A2-02`), ensuring future AI instances query a single canonical index while preserving 100% backward historical traceability.
- **PO Test Status**: Preserved as `TEST DEBT / DEFERRED` (`UNRESOLVED / WAITING PO-TEST`). Adopting `A2-02` does NOT change business logic or mark functional testing as completed.
- **2-Way Lookup Tests**: Verified bidirectional lookup `A2-02 -> A2.2-02-FIX-03` and `A2.2-02-FIX-03 -> A2-02`.
- **Code Changed**: NO
- **PO Verification**: PENDING (Documentation Task)