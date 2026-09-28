# CURRENT CORRECTION — 2026-09-26

This audit is historical/index material. The current verified result for canonical `A2-02` is now:

- Historical ID: `A2.2-02-FIX-03`
- Current result: `PO_VERIFIED / PROTECTED / LOCKED`
- PO evidence: Employee Quầy POS nhìn thấy bàn, mở được bàn, nhìn thấy menu trong bàn.
- Parent A2 remains `NOT VERIFIED`.
- Older `WAITING PO-TEST / TEST DEBT` text later in this audit is preserved as historical state at that time and must not override the current checkpoint.

---

# F&B SMART — WORK ITEM HISTORY & PROTECTION MAP (A0 TO A2)

STATUS: PROVEN / RECORDED AUDIT EVIDENCE & CANONICAL PROTECTION MAP
AUTHORITY: REHABILITATION GOVERNANCE & KIM CHỈ NAM (PROMPT A1-10)
SCOPE: Comprehensive forensic audit and structured work item history, behavior/invariant protection map, impact surface, and lookup rules from Phase A0 through Phase A2.

---

## 1. EXECUTIVE SUMMARY & RECOVERED WORK ITEMS

This document establishes the canonical structured work item history and protection map from Phase A0 through Phase A2. Its purpose is to provide future Coding Agents and AI instances with precise context on what behaviors are locked, what invariants must be preserved, and when regression testing or stop-and-report workflows are strictly mandatory.

Per project governance, passed and protected work items (`PROTECTED` / `LOCKED`) are never treated as mere status lines. Every work item has an immutable historical profile defining its objective, actual work performed, evidence, PO verification status, protected behaviors, impact surface, and change rules.

### Summary of Recovered Work Items:
1. **A0-FOUNDATION (A0 Overall & Build Baseline / A0.1–A0.16)**: Environment setup, Gradle/AGP toolchain, Firebase Staging configuration, debug APK build (`A0-BUILD-001`), and baseline installation on physical devices (Samsung Galaxy Tab S3 / Note 8). Status: `PO_VERIFIED & LOCKED`.
2. **A1.1 (Account & Store Audit)**: Firestore region `asia-southeast1`, security rules deployment, and E2E account → user → create store → owner → membership flow verification. Status: `PO_VERIFIED & LOCKED`.
3. **A1.2 (Account & Store Real-World Verification)**: Real-device verification on Samsung Galaxy Tab S3 (registration, login, logout, user without store, create store, owner & membership, reopen app, unauthorized store access blocking A1.2-01 to A1.2-08). Status: `PO_VERIFIED & LOCKED`.
4. **A1-01 through A1-04 (Security & Routing Read-Only Audit)**: Comprehensive forensic audit of authentication state, tenant isolation, Firestore rules, and client-side post-login routing architecture. Status: `HISTORICAL / PASS`.
5. **A1-05 (Post-Login Routing Active Membership Filter Fix)**: Surgical fix in `AuthRoutingService.scanAndRoute` to filter memberships by `status == 'active'`, ignoring inactive or revoked memberships. Status: `READY_FOR_PO_VERIFICATION` / `PO_EVIDENCE_RECORDED`.
6. **A1-06 & A1-07 (Samsung Note 8 Build, Deploy & PO Evidence)**: Debug build verification, ADB install on Samsung Note 8 (SM-N950F), and PO evidence recording. Status: `READY_FOR_PO_VERIFICATION` / `PO_EVIDENCE_RECORDED`.
7. **A2.2-01-FIX-02 (Duplicate Join Prevention)**: Prevention of duplicate staff join requests and active membership collision (`TEST 8A`, `8B`, `8C`) while protecting Golden Baseline `TEST 1–7`. Status: `PO_VERIFIED & LOCKED`.

---

## 2. MASTER WORK ITEM SUMMARY TABLE (A0 TO A2)

| Work Item ID | Work Item Name | Roadmap Location | Actual Work Performed | Result / Evidence | PO Status | Status | Protected Behavior | History / Evidence Gaps |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **A0-FOUNDATION** | Foundation & Build Baseline (A0.1–A0.16) | Phase A0 | Environment setup, Gradle configuration, Firebase Staging setup, debug APK build (`A0-BUILD-001`), device installation on SM N950F. | Build success, adb install PASS, PO sign-off. (`BUILD_BASELINE.md`) | `PO_VERIFIED` (Tuấn) | `PO_VERIFIED & LOCKED` | Base Android app configuration, package name (`com.fnb.smart`), and Firebase staging project initialization. | Granular audit trail for A0.1–A0.16 individual items is consolidated under A0-FOUNDATION (`HISTORY GAP — GRANULAR A0.1-A0.16`). |
| **A1.1** | Account & Store Audit | Phase A1 | Firestore region `asia-southeast1` setup, security rules deployment, E2E account/store provisioning. | Firestore rules verified, auth/store flow verified. (`firestore.rules`) | `PO_VERIFIED` (Tuấn) | `PO_VERIFIED & LOCKED` | Tenant isolation under `stores/{storeId}/...` enforcing active membership (`isMemberOf`). | None for core audit; raw individual test run sheets referenced in description rather than standalone logs. |
| **A1.2** | Account & Store Real-World Verification | Phase A1 | Real-device test execution on Samsung Tab S3 (A1.2-01 to A1.2-08: registration, login, logout, store creation, unauthorized access blocking). | 100% PASS verified by PO on Tab S3. (`03_CHECKPOINTS.md`) | `PO_VERIFIED` (Tuấn) | `PO_VERIFIED & LOCKED` | Absolute tenant isolation and unauthorized cross-store access blocking (`permission-denied`). | Duplicate checkpoint entries in registry; resolved by canonical consolidation. |
| **A1-01 to A1-04** | Security & Routing Read-Only Audit | Phase A1 | Forensic inspection of auth routing, Firestore rules, and tenant security boundaries. | Audit report generated identifying active membership filtering gap. | `UNKNOWN` / `PENDING` | `PASS` (Technical) | Structural security posture and routing requirements mapping. | None. |
| **A1-05** | Post-Login Routing Membership Filter Fix | Phase A1 | Surgical fix in `AuthRoutingService.scanAndRoute` filtering memberships by `status == 'active'`. | Code diff, 69/69 tests passed in `core_saas`. (`AuthRoutingService.dart`) | `PENDING` | `READY_FOR_PO_VERIFICATION` / `PO_EVIDENCE_RECORDED` | Post-login workspace routing ignores inactive or revoked memberships. | PO final test verification pending formal sign-off. |
| **A1-06 & A1-07** | Samsung Note 8 Build & PO Evidence | Phase A1 | Debug build generation (`app-debug.apk`), adb install on Note 8 (SM-N950F), PO evidence record. | Device installation success, PO review record. (`DEC-A1-05-PO-EVIDENCE`) | `PO_VERIFIED` (Evidence Recorded) | `READY_FOR_PO_VERIFICATION` / `PO_EVIDENCE_RECORDED` | Staging debug build reproducibility and device launch stability. | None. |
| **A2.2-01-FIX-02** | Duplicate Join Prevention | Phase A2 | Transaction/query checks preventing duplicate join requests and active membership collision (`TEST 8A`, `8B`, `8C`). | PO real-device verification PASS on Samsung Tab S3 / Note 8. (`StoreRepository`, `JoinStoreController`) | `PO_VERIFIED` (Tuấn) | `PO_VERIFIED & LOCKED` | Staff join requests are strictly unique per user-store pair; active membership collision is blocked. | None. |

---

## 3. DETAILED WORK ITEM PROFILES

### 3.1. A0-FOUNDATION (A0 Overall & Build Baseline / A0.1–A0.16)
- **WORK ITEM ID:** `A0-FOUNDATION` (incorporating historical sub-items `A0.1` through `A0.16`)
- **WORK ITEM NAME:** Foundation & Build Baseline
- **ROADMAP LOCATION:** Phase A0 — Nền móng & Khung quản lý
- **OBJECTIVE:** Establish foundational development environment, Gradle/AGP toolchain, Firebase Staging configuration, and baseline APK generation.
- **ORIGINAL SCOPE:** Setup Android project structure, configure Gradle wrappers, setup Firebase staging project (`fnb-smart`), and build initial debug APK.
- **ACTUAL WORK PERFORMED:** Configured `google-services.json`, gradle properties (`local.properties`), resolved build errors (`AndroidLocationsBuildService`), successfully built debug APK (`A0-BUILD-001`), and installed on physical device (SM N950F).
- **FILES / COMPONENTS:** `android/app/build.gradle.kts`, `android/gradle.properties`, `android/local.properties`, `docs/rehabilitation/BUILD_BASELINE.md`.
- **TEST / VERIFICATION:** Build execution (`flutter build apk --debug`), adb install success, and PO startup verification.
- **EVIDENCE:** `BUILD_BASELINE.md`, build output logs, adb install success record.
- **RESULT:** Success (`app-debug.apk` generated and deployed).
- **PO VERIFICATION:** `YES` (Verified by Tuấn, DEC-A0-001).
- **CHECKPOINT:** `A0-FOUNDATION` (`PO_VERIFIED & LOCKED`).
- **STATUS:** `PROTECTED / LOCKED`.
- **PROTECTED BEHAVIOR:** Base Android app packaging, applicationId (`com.fnb.smart`), and Firebase staging project initialization stability.
- **PROTECTED INVARIANTS:** App package name and staging project configuration must not be arbitrarily altered.
- **KNOWN LIMITATIONS:** Individual itemized logs for granular sub-items A0.1–A0.16 are consolidated under A0-FOUNDATION (`HISTORY GAP`).
- **DEPENDENCIES:** None (Root foundation).
- **IMPACT SURFACE:** `android/app/build.gradle.kts`, `google-services.json`, gradle settings.
- **CHANGE RULE:** Any modification to build configuration or package identity requires full rebuild and re-verification on physical target devices.
- **SOURCE REFERENCES:** `docs/rehabilitation/01_ROADMAP.md`, `docs/rehabilitation/03_CHECKPOINTS.md`, `docs/rehabilitation/BUILD_BASELINE.md`, `docs/rehabilitation/05_DECISION_LOG.md` (DEC-A0-001).

---

### 3.2. A1.1 & A1.2 (Account, Store & Tenant Isolation Verification)
- **WORK ITEM ID:** `A1.1` & `A1.2`
- **WORK ITEM NAME:** Account, Store & Tenant Isolation Real-World Verification
- **ROADMAP LOCATION:** Phase A1 — Security, Account & Store
- **OBJECTIVE:** Validate account creation, store provisioning, membership association, and absolute multi-tenant data isolation.
- **ORIGINAL SCOPE:** Deploy strict Firestore Security Rules enforcing tenant boundaries (`isMemberOf`, `isStoreOwner`) and execute 8 real-device test scenarios (A1.2-01 to A1.2-08).
- **ACTUAL WORK PERFORMED:** Deployed `firestore.rules` with strict tenancy checks; PO Tuấn executed 8 test scenarios on Samsung Tab S3 (registration, login, logout, store creation, owner binding, reopen app, unauthorized store access blocking).
- **FILES / COMPONENTS:** `firestore.rules`, `AuthService`, `AuthRepository`, `StoreRepository`.
- **TEST / VERIFICATION:** Real-device execution (A1.2-01 to A1.2-08) on Samsung Tab S3.
- **EVIDENCE:** PO verification sign-off in `03_CHECKPOINTS.md` and test evidence logs.
- **RESULT:** 100% PASS across all 8 scenarios.
- **PO VERIFICATION:** `YES` (Verified by Tuấn).
- **CHECKPOINT:** `A1.1` & `A1.2` (`PO_VERIFIED & LOCKED`).
- **STATUS:** `PROTECTED / LOCKED`.
- **PROTECTED BEHAVIOR:** Unauthorized store access blocking (`permission-denied` on cross-tenant read/write attempts) and secure membership validation.
- **PROTECTED INVARIANTS:** Every document under `/stores/{storeId}/...` must enforce server-side active membership validation.
- **KNOWN LIMITATIONS:** Duplicate checkpoint registry entries for A1.2 in `03_CHECKPOINTS.md`.
- **DEPENDENCIES:** A0-FOUNDATION.
- **IMPACT SURFACE:** `firestore.rules`, `AuthRepository`, `StoreRepository`.
- **CHANGE RULE:** Any change to `firestore.rules` or tenant isolation queries requires full security rule unit testing (`test_p0_security_rules.js`) and PO review.
- **SOURCE REFERENCES:** `docs/rehabilitation/03_CHECKPOINTS.md`, `docs/rehabilitation/01_ROADMAP.md`.

---

### 3.3. A1-01 through A1-07 (Security Audit & Active Membership Routing Fix)
- **WORK ITEM ID:** `A1-01` through `A1-07`
- **WORK ITEM NAME:** Security & Access Control Audit & Active Membership Routing Fix
- **ROADMAP LOCATION:** Phase A1 — Security & Routing
- **OBJECTIVE:** Audit authentication and routing architecture, identify client-side routing vulnerabilities regarding inactive/revoked memberships, apply surgical fix, and deploy to Samsung Note 8.
- **ORIGINAL SCOPE:** Read-only audit (A1-01 to A1-04), surgical fix in `AuthRoutingService.scanAndRoute` (A1-05), build and deploy on Note 8 (A1-06), and PO evidence recording (A1-07).
- **ACTUAL WORK PERFORMED:** Executed read-only audit; identified and fixed client-side routing flaw where inactive memberships were evaluated; updated `AuthRoutingService.scanAndRoute` to filter `status == 'active'`; ran core saas test suite (69/69 passed); built debug APK and deployed to Samsung Note 8; recorded PO test evidence with Tuấn.
- **FILES / COMPONENTS:** `packages/core_saas/lib/services/auth_routing_service.dart`.
- **TEST / VERIFICATION:** `flutter test packages/core_saas`, device installation logs, PO Note 8 test evidence.
- **RESULT:** Technical PASS (69/69 tests passed, device launch verified).
- **PO VERIFICATION:** PO Evidence Recorded (`DEC-A1-05-PO-EVIDENCE`), final PO sign-off for inactive/revoked scenarios pending.
- **CHECKPOINT:** `READY_FOR_PO_VERIFICATION` / `PO_EVIDENCE_RECORDED`.
- **STATUS:** `PROTECTED` (Routing invariant).
- **PROTECTED BEHAVIOR:** Client-side workspace routing engine strictly ignores inactive, pending, or revoked memberships (`status == 'active'` filter mandatory).
- **PROTECTED INVARIANTS:** `AuthRoutingService.scanAndRoute` must never resolve a store workspace using non-active memberships.
- **KNOWN LIMITATIONS:** Full multi-account revocation scenario testing pending final PO sign-off.
- **DEPENDENCIES:** A1.1, A1.2.
- **IMPACT SURFACE:** `packages/core_saas/lib/services/auth_routing_service.dart`, `AuthRoutingCoordinator`.
- **CHANGE RULE:** Any change to post-login routing or membership evaluation logic requires running `flutter test packages/core_saas` and verifying workspace resolution.
- **SOURCE REFERENCES:** `docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`, `docs/rehabilitation/PROJECT_JOURNAL_V2.md`, `DEC-A1-05-PO-EVIDENCE`.

---

### 3.4. A2.2-01-FIX-02 (Duplicate Join Prevention)
- **WORK ITEM ID:** `A2.2-01-FIX-02`
- **WORK ITEM NAME:** Duplicate Staff Join Prevention & Membership Collision Fix
- **ROADMAP LOCATION:** Phase A2 — Staff & Permissions
- **OBJECTIVE:** Prevent staff from submitting duplicate join requests or creating active membership collisions when attempting to join a store (`TEST 8A`, `8B`, `8C`), while protecting Golden Baseline `TEST 1–7`.
- **ORIGINAL SCOPE:** Implement query and transaction checks in store repository and join controller to reject duplicate join submissions.
- **ACTUAL WORK PERFORMED:** Updated `StoreRepository#hasExistingMembershipOrRequest` and `JoinStoreController` to validate active membership or pending join state prior to submission. PO Tuấn verified on real devices.
- **FILES / COMPONENTS:** `packages/core_saas/lib/data/repos/store_repository.dart`, `packages/core_saas/lib/controllers/join_store_controller.dart`.
- **TEST / VERIFICATION:** Real-device tests `TEST 8A`, `8B`, `8C` verified by PO Tuấn.
- **RESULT:** 100% PASS.
- **PO VERIFICATION:** `YES` (Verified by Tuấn).
- **CHECKPOINT:** `A2.2-01-FIX-02` (`PO_VERIFIED & LOCKED`).
- **STATUS:** `PROTECTED / LOCKED`.
- **PROTECTED BEHAVIOR:** Users cannot submit redundant join requests to a store where they already hold an active membership or pending request.
- **PROTECTED INVARIANTS:** Join request uniqueness per user-store pair.
- **KNOWN LIMITATIONS:** None.
- **DEPENDENCIES:** A1.2.
- **IMPACT SURFACE:** `StoreRepository`, `JoinStoreController`.
- **CHANGE RULE:** Any modification to staff joining logic requires executing duplicate join tests (`TEST 8A`, `8B`, `8C`).
- **SOURCE REFERENCES:** `docs/rehabilitation/03_CHECKPOINTS.md`, `docs/rehabilitation/06_CHANGE_LOG.md` (CHG-A2.2-01-FIX-02-LOCKED).

---

## 4. PROTECTION MAP HIERARCHY

```text
Work Item (e.g. A1-05, A2.2-01)
    ↓
Protected Behavior (e.g. Active membership filtering / Duplicate join blocking)
    ↓
Invariant (e.g. status == 'active' mandatory / 1 active membership per user-store)
    ↓
Impact Surface (e.g. AuthRoutingService.dart / StoreRepository.dart)
    ↓
Dependent Work Items (e.g. Future POS/KDS workspace loading, Staff management)
    ↓
Change Rule (e.g. IMPACT DETECTED → UNLOCK REQUIRED → STOP & REPORT)
```

| Protected Area | Work Item | Protected Behavior / Invariant | Impact Surface (Files) | Change Rule & Regression Trigger |
| :--- | :--- | :--- | :--- | :--- |
| **Authentication & User Profile** | A0 / A1.1 | `users/{userId}` requires `request.auth.uid == userId`. | `firestore.rules`, `AuthService` | Rule modification triggers `test_p0_security_rules.js`. |
| **Tenant Isolation & Store Access** | A1.1 / A1.2 | `stores/{storeId}/...` enforces `isMemberOf(storeId)`. | `firestore.rules`, `StoreRepository` | Repository or rules edit requires tenant isolation security audit. |
| **Active Membership Routing** | A1-05 | `AuthRoutingService.scanAndRoute` filters by `status == 'active'`. | `AuthRoutingService.dart` | Routing edit requires running `flutter test packages/core_saas`. |
| **Duplicate Join Prevention** | A2.2-01 | Preventing duplicate join requests and membership collision (`TEST 8A, 8B, 8C`). | `StoreRepository`, `JoinStoreController` | Staff logic edit requires running join verification tests. |

---

## 5. NEW WORK ITEM CHANGE & IMPACT VERIFICATION WORKFLOW

When an AI agent is executing a new Work Item (e.g., A7-09), it **must strictly follow** this impact verification and gating protocol:

```text
NEW WORK ITEM (e.g., A7-09)
      ↓
CHECK IMPACT: Does the change touch a PROTECTED zone (A0 to A2)?
      ↓
     YES
      ↓
IMPACT DETECTED (Mark in execution notes)
      ↓
Analyze affected behavior / invariants
      ↓
Can safety be mathematically and empirically proven without breaking invariants?
      ↓
   NO → STOP & REPORT `BLOCKER` (Do not modify)
      ↓
   YES
      ↓
UNLOCK REQUIRED: Provide explicit justification, evidence, and regression test plan
      ↓
STOP & REPORT to PO for authorization
      ↓
(PO Approval Granted?) → PROCEED WITH REGRESSION TEST; otherwise ABORT.
```

### Absolute Prohibitions:
- **RULE 1:** Never arbitrarily modify a previously passed/protected Work Item.
- **RULE 2:** If an older Work Item needs modification, **do not modify it within the new Work Item**. Stop and report.
- **RULE 3:** No chain reaction modifications (`A7-09 → A6-09 → A5-02 → A4-xx`). Each out-of-scope change must be separated into an independent issue/Work Item.
- **RULE 4:** Build PASS does not prove older Work Items remain correct. Touching a `PROTECTED` zone requires regression testing.

---

## 6. GAP LIST & UNRESOLVED REGISTER

1. **HISTORY GAP — GRANULAR A0.1–A0.16:** Individual step-by-step raw execution logs for historical sub-items A0.1 through A0.16 are consolidated under the whole-stage checkpoint `A0-FOUNDATION`. This is a traceability gap, not a reason to invalidate A0.
2. **DUPLICATE CHECKPOINT RECORD:** `03_CHECKPOINTS.md` contains duplicate entries for checkpoint `A1.2`. Preserved for historical fidelity; canonicalized in summary tables.
3. **PO TEST DEFERRALS:** Certain granular device tests (such as multi-device inactive membership edge cases) remain as `TEST_DEBT` awaiting formal revalidation queues, but do not block established checkpoints.
4. **UNRESOLVED — PARENT A2 STAGE REVALIDATION:** Child item `A2-01` (`A2.2-01-FIX-02 Duplicate Join Prevention`) is `PO_VERIFIED & LOCKED`, but parent stage `A2` as a whole remains `NOT VERIFIED / UNRESOLVED` requiring revalidation from zero per PO direction.
5. **UNRESOLVED — PARENT A3 TAXONOMY ALIGNMENT:** Historical checkpoint `A3.3` (`A3-03 Table Map Logout-Login Sync Fix`) is `PO_VERIFIED & LOCKED`, but parent stage `A3` (Products, Catalog & Kitchen Stations in Kim B) taxonomy is unresolved. Table Map belongs conceptually to Table State (A4 / Kim B). Child checkpoint PASS does not imply parent A3 stage PASS.

---

## 7. AI LOOKUP RULE (QUICK REFERENCE)

When a future AI instance or prompt references a specific Work Item ID (e.g., `"A0-FOUNDATION"`, `"A1.1"`, `"A1-05"`, `"A2.2-01"`), it must immediately locate its profile in this document (`docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`), read its **Protected Behavior**, **Protected Invariants**, and **Change Rules**, and ensure any proposed task respects those boundaries.

---

## 8. CANONICAL WORK ITEM ID INDEX & CROSSWALK TABLE (PROMPT A1-12 & A1-12-R2 CORRECTIONS APPLIED)

### 8.1. Canonical ID Rule & Operational Guidance
1. **ONE CANONICAL ID -> ONE CANONICAL RECORD -> MANY HISTORICAL REFERENCES**.
2. **Canonical ID Structure**: Standard hyphenated format (`A0-01`, `A1-01`, `A1-05`, `A2-01`, `A3-03`, `GP-01`).
3. **Historical Aliases & Classification**:
   - `CONFIRMED`: Direct 1-to-1 evidence proves equivalence (e.g. `A1.1` == `A1-01`, `A1.2` == `A1-02`, `A1-05` == `A1-05`, `A2.2-01-FIX-02` == `A2-01` child item).
   - `SUPPORTED BUT CONSOLIDATED`: Grouped for document management (e.g. `A0.1–A0.16` under `A0-01`, `A1-01..04` under `A1-03`, `A1-06/07` under `A1-06`). Consolidated != Historically identical.
4. **Child PASS != Parent PASS**: A passed child Work Item does NOT automatically pass its parent A-stage (e.g. `A2-01 PASS` does NOT make parent `A2 PASS`).
5. **Lookup Procedure for Future AI**:
   - Receive prompt referencing any Work Item ID -> Lookup Canonical Index in `docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`.
   - Retrieve Canonical Record, Historical Aliases, Mapping Classification, and Checkpoint/Protection status.
   - Inspect Impact Surface & Protected Invariants before initiating any work.

### 8.2. Master Canonical Crosswalk Table

| Canonical ID | Canonical Name | Stage | Historical Alias | Classification | Source | Status | PO Status | Checkpoint | Protection | Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **A0-01** | Foundation & Build Baseline | A0 | `A0-FOUNDATION`, `A0-BUILD-001` (CONFIRMED); `A0.1–A0.16` (CONSOLIDATED) | `CONFIRMED / SUPPORTED BUT CONSOLIDATED` | `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `BUILD_BASELINE.md`, `DEC-A0-001` | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `A0-FOUNDATION` | Base Android app package (`com.fnb.smart`), staging Firebase config | `BUILD_BASELINE.md`, ADB install on SM-N950F |
| **A1-01** | Account, Store & Security Rules Audit | A1 | `A1.1` | `CONFIRMED` | `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `firestore.rules` | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `A1.1` | Tenant isolation `/stores/{storeId}/...` enforcing active membership | `firestore.rules`, staging verification |
| **A1-02** | Account & Store Real-World Verification | A1 | `A1.2` (CONFIRMED); `A1.2-01–A1.2-08` (CONSOLIDATED) | `CONFIRMED / SUPPORTED BUT CONSOLIDATED` | `03_CHECKPOINTS.md`, Tab S3 Test logs | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `A1.2` | Unauthorized store access blocking (`permission-denied`) | Real-device 100% PASS on Tab S3 |
| **A1-03** | Security & Auth Routing Audit | A1 | `A1-01` to `A1-04` | `SUPPORTED BUT CONSOLIDATED` | `WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md` | `PASS` (Technical) | `PENDING` | `NONE` | Auth routing security architecture findings | Audit report generated |
| **A1-05** | Post-Login Active Membership Routing Fix | A1 | `A1-05` | `CONFIRMED` | `AuthRoutingService.dart`, `DEC-A1-05-PO-EVIDENCE` | `READY_FOR_PO_VERIFICATION` | `PO_EVIDENCE_RECORDED` (Tuấn) | `A1-05-ROUTING-FIX` | Workspace routing ignores non-active memberships (`status == 'active'`) | 69/69 core_saas tests PASS, ADB install Note 8, PO login test |
| **A1-06** | Debug Build & Note 8 Deployment | A1 | `A1-06`, `A1-07` | `SUPPORTED BUT CONSOLIDATED` | `DEC-A1-05-PO-EVIDENCE`, `app-debug.apk` | `READY_FOR_PO_VERIFICATION` | `PO_EVIDENCE_RECORDED` (Tuấn) | `A1-06-BUILD-NOTE8` | Staging debug build reproducibility & launch stability | ADB stream install PASS, SM-N950F launch |
| **A2-01** | Duplicate Staff Join Prevention | A2 | `A2.2-01-FIX-02` | `CONFIRMED` (Child item only) | `03_CHECKPOINTS.md`, `StoreRepository`, `JoinStoreController` | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `A2.2-01-FIX-02` | Unique join request per user-store pair (`TEST 8A, 8B, 8C`) | PO real-device test PASS on Note 8 & Tab S3 |
| **A2-02** | Employee Quầy POS + Table Map | A2 | `A2.2-02-FIX-03` | `PO-ADOPTED CANONICALIZATION` | `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `04_TEST_EVIDENCE.md`, `05_DECISION_LOG.md`, `09_AI_HANDOFF.md` | `PO_VERIFIED / PROTECTED / LOCKED` | `CLOSED` | `A2.2-02-FIX-03-BUILD-001` (historical build reference) | Employee Quầy POS thấy bàn, mở bàn, thấy menu trong bàn; giữ tenant isolation và A3-03 recovery | `TEST-A2-02-PO-001`, `CHG-A2-02-SURGICAL-FIX-001`, `CHG-A2-02-PO-VERIFIED-LOCK-001` |
| **A3-03** | Table Map Logout-Login & Sync Fix | A3 | `A3.3-TABLEMAP-LOGOUT-LOGIN-FIX` | `CONFIRMED` (Checkpoint only; Parent taxonomy UNRESOLVED) | `03_CHECKPOINTS.md`, `table_realtime_service.dart` | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `A3.3-TABLEMAP-LOGOUT-LOGIN-FIX` | Table Map recovery on Logout -> Login, Watchdog sync active | Real-device 100% PASS on M51 & Note 8 |
| **GP-01** | Orders Security Rules Alignment | A11 / GP | `GP-01-SURGICAL-FIX-02` | `CONFIRMED` | `03_CHECKPOINTS.md`, `firestore.rules` | `PO_VERIFIED & LOCKED` | `PO_VERIFIED` (Tuấn) | `GP-01-SURGICAL-FIX-02` | Orders tenant isolation (`/stores/{storeId}/orders/...`) | Real-device PASS (Table Map -> Open Bàn 01) |

### 8.3. Canonical Lookup Verification Tests (Post-Correction)

#### Lookup Test 1: A0-01
- **Canonical ID:** `A0-01`
- **Canonical Name:** Foundation & Build Baseline
- **Historical Alias:** `A0-FOUNDATION` (CONFIRMED), `A0-BUILD-001` (CONFIRMED), `A0.1–A0.16` (SUPPORTED BUT CONSOLIDATED)
- **Mapping Classification:** `CONFIRMED` for baseline checkpoint; `SUPPORTED BUT CONSOLIDATED` for sub-items A0.1–A0.16.
- **Scope:** Environment setup, Gradle config, Firebase Staging, debug APK build, physical device install.
- **Actual Work:** Configured `google-services.json`, `local.properties`, generated `app-debug.apk`, installed on SM-N950F via ADB.
- **Result:** Success / PASS.
- **PO Status:** `PO_VERIFIED` (Tuấn, DEC-A0-001).
- **Checkpoint:** `A0-FOUNDATION` (`PO_VERIFIED & LOCKED`).
- **Protection:** Packaging `com.fnb.smart`, staging Firebase project bindings.
- **Evidence:** `docs/rehabilitation/BUILD_BASELINE.md`, ADB logs, PO startup verification.
- **History Gap:** Granular execution logs for individual sub-items A0.1–A0.16 consolidated under `A0-FOUNDATION`.
- **Unresolved:** None for A0 baseline.
- **Source:** `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `BUILD_BASELINE.md`.

#### Lookup Test 2: A1-01
- **Canonical ID:** `A1-01`
- **Canonical Name:** Account, Store & Security Rules Audit
- **Historical Alias:** `A1.1`
- **Mapping Classification:** `CONFIRMED` (Direct 1-to-1 equivalence).
- **Scope:** Firestore region `asia-southeast1` setup, security rules deployment, E2E account/store flow.
- **Actual Work:** Deployed `firestore.rules` enforcing `isMemberOf` and `isStoreOwner` tenant isolation.
- **Result:** Success / PASS.
- **PO Status:** `PO_VERIFIED` (Tuấn).
- **Checkpoint:** `A1.1` (`PO_VERIFIED & LOCKED`).
- **Protection:** Tenant boundary protection under `/stores/{storeId}/...`.
- **Evidence:** `firestore.rules` deployment verification, auth/store workflow logs.
- **History Gap:** Individual test sheets referenced in text rather than standalone files.
- **Unresolved:** None.
- **Source:** `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `firestore.rules`.

#### Lookup Test 3: A1-02
- **Canonical ID:** `A1-02`
- **Canonical Name:** Account & Store Real-World Verification
- **Historical Alias:** `A1.2` (CONFIRMED), `A1.2-01–A1.2-08` (SUPPORTED BUT CONSOLIDATED)
- **Mapping Classification:** `CONFIRMED` for parent item `A1.2`; `SUPPORTED BUT CONSOLIDATED` for test steps 01–08.
- **Scope:** Real-device test execution on Samsung Tab S3 (registration, login, logout, store creation, owner binding, unauthorized access blocking).
- **Actual Work:** Executed 8 real-device test scenarios on Tab S3.
- **Result:** 100% PASS across all 8 scenarios.
- **PO Status:** `PO_VERIFIED` (Tuấn).
- **Checkpoint:** `A1.2` (`PO_VERIFIED & LOCKED`).
- **Protection:** Unauthorized store access blocking (`permission-denied`).
- **Evidence:** Real-device verification logs on Tab S3.
- **History Gap:** Duplicate checkpoint entries for A1.2 in `03_CHECKPOINTS.md` preserved for fidelity.
- **Unresolved:** None.
- **Source:** `03_CHECKPOINTS.md`, `01_ROADMAP.md`.

#### Lookup Test 4: A1-03
- **Canonical ID:** `A1-03`
- **Canonical Name:** Security & Auth Routing Audit
- **Historical Alias:** `A1-01 to A1-04`
- **Mapping Classification:** `SUPPORTED BUT CONSOLIDATED` (Four consecutive audit prompts grouped under canonical profile `A1-03`).
- **Scope:** Forensic audit of authentication state, tenant isolation, Firestore rules, and client-side post-login routing architecture.
- **Actual Work:** Generated audit report identifying active membership filtering gap.
- **Result:** Technical PASS (Audit complete).
- **PO Status:** `PENDING`.
- **Checkpoint:** `NONE`.
- **Protection:** Auth routing security findings.
- **Evidence:** Audit report.
- **History Gap:** Consolidated prompt sequence.
- **Unresolved:** None.
- **Source:** `WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`.

#### Lookup Test 5: A1-05
- **Canonical ID:** `A1-05`
- **Canonical Name:** Post-Login Active Membership Routing Fix
- **Historical Alias:** `A1-05`
- **Mapping Classification:** `CONFIRMED` (Direct 1-to-1 equivalence).
- **Scope:** Surgical fix in `AuthRoutingService.scanAndRoute` to filter memberships by `status == 'active'`.
- **Actual Work:** Modified `AuthRoutingService.scanAndRoute` to ignore pending/revoked memberships, ran 69/69 core_saas tests, deployed to Note 8.
- **Result:** Technical PASS (69/69 unit tests PASS, Note 8 launch verified).
- **PO Status:** `PO_EVIDENCE_RECORDED` (Tuấn, Note 8 test recorded in `DEC-A1-05-PO-EVIDENCE`).
- **Checkpoint:** `A1-05-ROUTING-FIX` (`READY_FOR_PO_VERIFICATION`).
- **Protection:** Post-login routing strictly requires active membership state (`status == 'active'`).
- **Evidence:** `AuthRoutingService.dart` diff, unit test report, ADB install log, PO test note.
- **History Gap:** None.
- **Unresolved:** Multi-account revocation edge case testing pending formal PO sign-off.
- **Source:** `docs/audits/WORK_ITEM_HISTORY_AND_PROTECTION_MAP_A0_A1.md`, `DEC-A1-05-PO-EVIDENCE`.

#### Lookup Test 6: A1-06
- **Canonical ID:** `A1-06`
- **Canonical Name:** Debug Build & Note 8 Deployment
- **Historical Alias:** `A1-06`, `A1-07`
- **Mapping Classification:** `SUPPORTED BUT CONSOLIDATED` (Build step A1-06 and Deploy/PO Evidence step A1-07 grouped under single pipeline record).
- **Scope:** Debug build generation (`app-debug.apk`), ADB install on Note 8, PO evidence recording.
- **Actual Work:** Built debug APK, installed on Note 8 (SM-N950F), recorded PO review.
- **Result:** Ready for PO verification.
- **PO Status:** `PO_EVIDENCE_RECORDED` (Tuấn).
- **Checkpoint:** `A1-06-BUILD-NOTE8` (`READY_FOR_PO_VERIFICATION`).
- **Protection:** Staging debug build reproducibility & launch stability.
- **Evidence:** ADB stream install PASS, SM-N950F launch record.
- **History Gap:** Pipeline prompts consolidated.
- **Unresolved:** None.
- **Source:** `DEC-A1-05-PO-EVIDENCE`.

#### Lookup Test 7: A2-01
- **Canonical ID:** `A2-01`
- **Canonical Name:** Duplicate Staff Join Prevention
- **Historical Alias:** `A2.2-01-FIX-02`
- **Mapping Classification:** `CONFIRMED` (Child item only).
- **Scope:** Prevent duplicate staff join submissions or active membership collisions (`TEST 8A, 8B, 8C`).
- **Actual Work:** Updated `StoreRepository#hasExistingMembershipOrRequest` and `JoinStoreController` query checks.
- **Result:** Success / PASS.
- **PO Status:** `PO_VERIFIED` (Tuấn).
- **Checkpoint:** `A2.2-01-FIX-02` (`PO_VERIFIED & LOCKED` for child item `A2-01`).
- **Protection:** Unique join request per user-store pair; active membership collision blocked.
- **Evidence:** PO real-device verification PASS on Tab S3 and Note 8 (`TEST 8A, 8B, 8C`).
- **History Gap:** None for child item `A2-01`.
- **Unresolved:** `A2-01 PASS != Parent A2 Stage PASS`. Parent stage `A2` as a whole remains `NOT VERIFIED / UNRESOLVED` requiring revalidation from zero.
- **Source:** `03_CHECKPOINTS.md`, `06_CHANGE_LOG.md` (CHG-A2.2-01-FIX-02-LOCKED).

#### Lookup Test 8: A3-03
- **Canonical ID:** `A3-03`
- **Canonical Name:** Table Map Logout-Login & Sync Fix
- **Historical Alias:** `A3.3-TABLEMAP-LOGOUT-LOGIN-FIX`
- **Mapping Classification:** `CONFIRMED` for historical checkpoint `A3.3`.
- **Parent Stage Taxonomy:** `UNRESOLVED`.
- **Scope:** Table Map recovery on Logout -> Login (resolving "Đang nạp Profile" stall), Watchdog sync active, real-time table sync.
- **Actual Work:** Fixed profile worker race condition, reset `_lastSecurityRole` on logout in `table_realtime_service.dart`.
- **Result:** Success / PASS.
- **PO Status:** `PO_VERIFIED` (Tuấn, `DEC-A3.3-TABLEMAP-FIX-01`).
- **Checkpoint:** `A3.3-TABLEMAP-LOGOUT-LOGIN-FIX` (`PO_VERIFIED & LOCKED`).
- **Protection:** Table Map sync and recovery state on Logout -> Login.
- **Evidence:** Real-device 100% PASS on Samsung M51 & Note 8 across 4 test flows.
- **History Gap:** None for checkpoint `A3-03`.
- **Unresolved:** Parent stage `A3` taxonomy is unresolved (Table Map belongs conceptually to Table State A4/Kim B, whereas Kim B A3 is Products, Catalog & Kitchen Stations). Child checkpoint PASS does NOT imply parent A3 stage PASS.
- **Source:** `03_CHECKPOINTS.md`, `05_DECISION_LOG.md` (`DEC-A3.3-TABLEMAP-FIX-01`).

#### Lookup Test 9: A2-02 (Canonical ID -> Historical ID Trace)
- **Canonical ID:** `A2-02`
- **Canonical Name:** Staff Permissions — Role-Based Permission Bypass Removal
- **Historical Alias:** `A2.2-02-FIX-03`
- **Mapping Classification:** `PO-ADOPTED CANONICALIZATION` (Adopted by PO Decision in Prompt A1-12-R3).
- **Implementation Trace:** `CHG-A2.2-02-FIX-03`
- **Build Reference:** `A2.2-02-FIX-03-BUILD-001` (`PROTECTED / GOLDEN BUILD` on Note 8 & M51)
- **PO Test Reference:** `TEST-A2-02-PO-001` (`PO_VERIFIED / PASS`); legacy `A2.2-02-FIX-03-PO-TEST` remains historical.
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED` (current result; the earlier deferred status is historical).
- **Protection:** Owner full access, Employee allowedFeatures access, legacy roles no bypass, tenant isolation.
- **Source:** `01_ROADMAP.md`, `03_CHECKPOINTS.md`, `09_AI_HANDOFF.md`, `PROMPT A1-12-R3`.

#### Lookup Test 10: A2.2-02-FIX-03 (Historical ID -> Canonical ID Trace)
- **Historical ID:** `A2.2-02-FIX-03`
- **Canonical ID:** `A2-02`
- **Mapping Classification:** `CONFIRMED HISTORICAL TRACE` (Maps directly to Canonical ID `A2-02`).
- **Implementation:** `CHG-A2.2-02-FIX-03`
- **Build:** `A2.2-02-FIX-03-BUILD-001`
- **PO Test:** `A2.2-02-FIX-03-PO-TEST`
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED` (current result).
- **Source:** `03_CHECKPOINTS.md`, `04_TEST_EVIDENCE.md`, `05_DECISION_LOG.md`, `09_AI_HANDOFF.md`, `PROMPT 031` (current closure); `PROMPT A1-12-R3` remains the historical canonicalization source.



