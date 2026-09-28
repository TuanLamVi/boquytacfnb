STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# KHUNG TRẠNG THÁI HIỆN TẠI V2
STATUS: DRAFT / REVIEW CANDIDATE. Chưa phải registry hiện hành được adoption.
Chỉ sau adoption và migration được cho phép riêng, tài liệu này được đề xuất làm nguồn trạng thái hiện tại duy nhất. Trước đó V2 không thay registry legacy. Claim phải có nguồn, ngày, phạm vi và mức evidence; không biến claim thành xác minh mới.

| Lĩnh vực | Giá trị trong khung | Phân loại | Nguồn/phạm vi | Ghi chú |
|---|---|---|---|---|
| Track làm việc | PO directs rehabilitation of the existing repository (C03) | CURRENT PO DIRECTION | PO C03 prompt, 2026-09-26 | Does not amend the Product Charter; no project/repository replacement authorized. |
| Phase hiện tại | UNRESOLVED | UNRESOLVED | CURRENT_STATE/CHECKPOINTS/ROADMAP/HANDOFF/audit khác nhau | Không tự chọn. |
| A3.3 | Hồ sơ legacy có claim PO_VERIFIED/LOCKED | LEGACY CLAIM — V2 CHƯA XÁC MINH LẠI | CURRENT_STATE/CHECKPOINTS/EVIDENCE/DECISION_LOG | Không xác nhận lại, phủ nhận hoặc sửa checkpoint. |
| GP-01 | Hồ sơ legacy có claim PO_VERIFIED/LOCKED | LEGACY CLAIM — V2 CHƯA XÁC MINH LẠI | CHECKPOINTS/TEST_EVIDENCE | Environment IDs khác nhau. |
| A0/A1/A2 và checkpoint khác | Có claim theo ID/phạm vi trong hồ sơ legacy | LEGACY CLAIM — V2 CHƯA XÁC MINH LẠI | CHECKPOINTS/CURRENT_STATE/DECISION_LOG/EVIDENCE/HANDOFF | Đọc hồ sơ không xác minh claim. |
| A2.2-02-FIX-03 | Handoff cũ ghi UNRESOLVED / WAITING PO-TEST | LEGACY CLAIM | AI_HANDOFF/CHECKPOINTS | Tính hiện hành chưa được V2 xác minh. |
| G2-04 | REENTRY-001 ghi BLOCKED trong phạm vi/thời điểm audit | AUDIT SNAPSHOT | REENTRY-001 | Khả năng áp dụng hiện tại UNPROVEN. |
| Checkpoint mới của V2 | Không checkpoint mới nào được tạo trong quá trình lập khung V2 | Phạm vi bản dự thảo | V2 chưa thực hiện checkpoint review | KHÔNG có nghĩa dự án không có checkpoint lịch sử. |
| Firebase hiện hành | PO-designated: `fnb-smart-dev`; static checkout config points to `fnb-smart` | PO DIRECTION KNOWN; CONFIGURATION MISMATCH; runtime UNVERIFIED | PO C06 decision; `.firebaserc`, `firebase.json`, `android/app/google-services.json` | No config change authorized; see dated C01–C13 addendum. |
| Build baseline hiện hành | UNPROVEN; claim lịch sử khác nhau UNRESOLVED | UNPROVEN / UNRESOLVED | BUILD_BASELINE và REENTRY-001 | Snapshot cũ không chứng minh hiện hành. |
| LAW-014 historical A0-BUILD-001 baseline | Toolchain target: Flutter 3.41.0 / Dart 3.11.0 / Java 17.0.20.1+1 / Gradle 8.11.1 / AGP 8.11.1 / Kotlin 2.2.20 / SDK 36/35/24; historical Firebase was fnb-smart STAGING Default | Historical baseline only; current Firebase direction is fnb-smart-dev; static checkout toolchain mismatch recorded below | LAW-014; BUILD_BASELINE; current PO C06/C07 directions | No build performed; see dated C01–C13 addendum. |
| Thiết bị mục tiêu | UNPROVEN cho tới khi PO chỉ định trong prompt | UNPROVEN | Hồ sơ cũ nhắc nhiều thiết bị | Không chọn theo lịch sử/tên APK. |
| Adoption V2 | Chưa có quyết định adoption trong V2 | DRAFT — NOT ADOPTED | PO_DECISION_REGISTER_V2 | Không phải governance hiện hành. |

## Từ khóa phân loại
KNOWN FROM SOURCE: nguồn nêu rõ, chưa hàm ý kiểm chứng độc lập.
LEGACY CLAIM: claim được quy cho hồ sơ lịch sử; V2 chưa xác minh lại.
UNPROVEN: thiếu evidence đủ để kết luận.
UNRESOLVED: nguồn/phạm vi bất đồng.
PO_VERIFIED: PO trực tiếp PASS đúng phạm vi; chỉ ghi sau lệnh ghi nhận riêng.
Đọc tài liệu không có nghĩa xác nhận mọi claim trong đó là đúng.

## Canonical A-stage handoff addendum — 2026-09-26
A-stage hierarchy: PO defines A0/A1/A2/A3/A4... as parents and decimal identifiers as branches under the matching parent. This frame remains DRAFT and is not an active registry.

CURRENT A-STAGE: A4 per PO-provided working-stage direction; this is not A4 PASS or PO_VERIFIED.
CURRENT TASK: Project Memory / A-stage canonicalization documentation.
A4 product task: NOT RECORDED in the reviewed source set.
A0/A1: legacy records explicitly claim whole-stage PO_VERIFIED/LOCKED; preserve those historical results. Detailed raw-artifact crosswalk remains incomplete as a traceability gap, not a downgrade.
A2: NOT VERIFIED / UNRESOLVED; PO requested A2 revalidation from zero after Kim Chỉ Nam completion, under a separate instruction.
A3: NOT VERIFIED / UNRESOLVED; A3.3 table-map branch checkpoint claim does not prove the Kim B A3 product/station scope.
A4: current directed working stage, parent acceptance NOT VERIFIED.
Other legacy current-state claims (A1/A2/A3.3) remain preserved and conflict until reconciled. See PROJECT_JOURNAL_V2.md for provenance. This note records source-attributed context only; it does not adopt V2, migrate legacy records or independently verify claims.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## PO C01–C13 direction — current-state addendum — 2026-09-26
Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”. Governance V2 remains a draft, not an adopted current-state registry.

- Current project track: PO directs rehabilitation of the existing repository. This does not amend the Product Charter or authorize a repository, architecture, platform, or Firebase change.
- Current Firebase direction: PO designates `fnb-smart-dev`. Static checkout evidence still points to `fnb-smart`: `.firebaserc` default is `fnb-smart`; `firebase.json` Flutter platform projectId is `fnb-smart`; `android/app/google-services.json` project_id is `fnb-smart`. Therefore CONFIGURATION MISMATCH with the PO designation. No Firebase operation occurred; CURRENT RUNTIME ENVIRONMENT remains UNVERIFIED.
- PO toolchain target: Flutter 3.41.0 / Dart 3.11.0 / Java 17.0.20.1+1 / Gradle 8.11.1 / AGP 8.11.1 / Kotlin 2.2.20 / compileSdk 36 / targetSdk 35 / minSdk 24. Static checkout: wrapper Gradle 8.11.1, AGP 8.9.1, Kotlin 2.1.20, compileSdk 36, targetSdk 35, minSdk delegated to Flutter. Flutter SDK path names 3.41.0 and pubspec requires Dart ^3.11.0; these do not independently verify runtime versions. Java executable and effective minSdk were not run/resolved. Result: static AGP/Kotlin MISMATCH; other runtime values not fully verified. No build or toolchain change occurred.
- Stage/revalidation: PO directs review from A0 and preservation of locked scope. This task did not execute A0 revalidation. Existing operational phase disagreements remain attributed to their source; no stage result or checkpoint was changed.
- C02: agent launch verification is technical evidence only; PO retains all device UI/business testing and acceptance decisions.
- C12: PO specifies nonnegative allocation for ordinary Sale invoices; Reversal may be negative. Product Charter wording scope remains a documentation cross-reference concern; no contract or logic was changed.
