# 02 — CURRENT STATE — F&B SMART V5

## 1. Snapshot

- **As of:** 2026-09-26
- **Project:** F&B SMART V5 / FnB-Smart
- **Project root:** `C:\Users\Admin\Desktop\Android\fnb_smart`
- **Branch:** `fix/v4.6.9-rc17-patch4b-auth-logging`
- **HEAD:** `be00e47b7c69746d2d55e6c7a97ce55453b54c80`
- **Worktree:** `DIRTY` — pre-existing changes must be preserved.

## 2. What each file means

- `00_KIM_CHI_NAM_REHABILITATION.md` = governance law.
- `KIM_CHI_NAM_CAI_TAO_FNB_SMART.md` = operational working rules.
- `CHECKPOINTS` = accepted/protected work-item outcomes.
- `DECISION_LOG` = PO decisions.
- `TEST_EVIDENCE` = evidence.
- `CHANGE_LOG` = actual changes.
- `CURRENT_STATE` = current project snapshot.
- `AI_HANDOFF` = current handoff for a new AI/session.
- `PROJECT_JOURNAL_V2` = historical rollup only; DRAFT, not authority.
- `governance_v2/*` = DRAFT — NOT YET ADOPTED.

## 3. Current statuses

| Item | Current status | Note |
|---|---|---|
| A0 | `PO_VERIFIED / LOCKED` | Historical accepted foundation |
| A1 | `PO_VERIFIED / LOCKED` according to current accepted records | Do not infer new tests |
| A2 parent | `NOT VERIFIED` | Child PASS does not promote parent |
| A2-01 | `PO_VERIFIED / PROTECTED / LOCKED` | Duplicate Join Prevention |
| A2-02 | `PO_VERIFIED / PROTECTED / LOCKED` | Employee Quầy POS + Table Map |
| A3 parent | `UNRESOLVED` | Parent scope/taxonomy unresolved |
| A3-03 | `PO_VERIFIED / LOCKED` | Table Map Logout/Login recovery |
| A4 parent | Not accepted | No current product task assigned |
| GP-01 | `PO_VERIFIED / LOCKED` | Orders tenant rules / open table scope |
| GOV-025 | `PO_VERIFIED / PROTECTED / LOCKED` | Work Item closure rule |
| GOV-026 | `PO_VERIFIED` | Governance Consistency Audit & Closure Synchronization |
| GOV-027 | `PO_VERIFIED` | LAW-016 PO Decision Bridge & Repository Recording (Protected: No, Locked: No) |
| GOV-028 | `PO_VERIFIED` | LAW-017 Session Reentry & No-Memory Authority (Protected: No, Locked: No) |
| A3-01 | `PO_VERIFIED / PROTECTED / LOCKED` | Money / Currency / Int64 Representation (Full Money Boundary) |
| A3-02 | `PO_VERIFIED / PROTECTED / LOCKED` | Orders & Order Lines State Engine |
| A3-04 | `PAUSED` | Payment & Table Closure Synchronization Fix |
| A3-05 | `PO_VERIFIED / PROTECTED / LOCKED` | Shift & ShiftLock State Machine & Data Model Foundation |
| A3-06 | `PO_VERIFIED / PROTECTED / LOCKED` | Shift Management UI (Cashier & Staff Shift Control) |
| A6-02 | `READY_FOR_PO_VERIFICATION` | Canonical POS Payment UI Integration & Test Surface (Parallel Coexistence) |

## 4. A2-02 closure

- **Canonical ID:** `A2-02`
- **Historical ID:** `A2.2-02-FIX-03`
- **PO:** Tuấn
- **Date:** 2026-09-26
- **Result:** `PO_VERIFIED / PROTECTED / LOCKED`
- **PO evidence:** Employee Quầy POS nhìn thấy bàn, mở được bàn, nhìn thấy menu trong bàn.
- **Protected behavior:** Employee Quầy POS có thể sử dụng Sơ đồ bàn và mở bàn theo quyền được cấp.
- **Protected constraints:** Tenant isolation; A3-03 Logout/Login recovery; no regression of accepted POS permission behavior.

## 5. Latest verified build

Use `docs/rehabilitation/BUILD_BASELINE.md` for build instructions. Current verified build uses Gradle 8.13 and the recorded empty `ANDROID_PREFS_ROOT` setup.

## 6. Current work / Next

```text
CURRENT WORK ITEM: A6-02 — Canonical POS Payment UI Integration & Test Surface (Parallel Coexistence)
STATUS: READY_FOR_PO_VERIFICATION
CANONICAL ID: A6-02
NEXT: PO verification on Samsung Note 8 & Samsung M51.
```

Do not infer an A4 task from draft/historical roadmap text.

## 7. Mandatory behavior for a new AI

Before product mutation:

```text
Read governance
→ read Current State
→ read Checkpoints
→ read Decision Log
→ read AI Handoff
→ read technical source docs for the task
→ assess LOCKED SCOPE IMPACT
```

If current records conflict, stop and reconcile before mutation.
