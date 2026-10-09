# GOV-MASTER-SPEC-REMOTE-DISCOVERY — Follow-up Remote Evidence

- **Date:** 2026-10-09
- **Prepared by:** ChatGPT — PO Assistant / forensic coordinator
- **Record type:** Follow-up evidence. Does not grant approval or change canonical NEXT.
- **Governance repository:** `TuanLamVi/boquytacfnb`
- **Application repository:** `TuanLamVi/fnb-smart-v5-clean-rebuild`

## 1. Correction to the latest Codex report

Codex reported remote access as `ACCESS BLOCKED` because its IDE/runtime could not access the authenticated GitHub API. This is a limitation of that Codex runtime, not a global absence of remote access: the ChatGPT GitHub connector successfully read the official repositories and files during this check. Do not provide or paste personal access tokens into chat or local artifacts to work around the Codex limitation.

## 2. Remote revisions verified

Governance `main` latest commit observed through the GitHub commit search:
- `36b5a5b85d28cda38ba4c162e4e1c9393fb31669`
- URL: https://github.com/TuanLamVi/boquytacfnb/commit/36b5a5b85d28cda38ba4c162e4e1c9393fb31669

Governance `main` still serves `01_STATE/CURRENT_STATE.md` with blob SHA `45f4975139730c4e87c8e8e7a1356ba172ae098f`; its canonical next step remains `CLEAN REBUILD MASTER SPECIFICATION`.

Application `main` latest commit observed:
- `34df2324b27c4524c6da8ffc4dd889a6e992dec9`
- URL: https://github.com/TuanLamVi/fnb-smart-v5-clean-rebuild/commit/34df2324b27c4524c6da8ffc4dd889a6e992dec9

## 3. Four V5.1 contracts — found on a non-main Governance branch

The branch `codex/migrate-kim-chi-nam-20260928` exists in the Governance repository. The four contracts were successfully fetched from `99_ARCHIVE_SOURCE/` on that branch:

| Contract | Verified branch path | Blob SHA |
|---|---|---|
| Product Charter | `99_ARCHIVE_SOURCE/PRODUCT_CHARTER_V5.1.md` | `03f8285a50c4889196c98f0e2babd6cd4864c0fe` |
| Database Schema | `99_ARCHIVE_SOURCE/DATABASE_SCHEMA_V0.1.md` | `55f2ba4eecafd45653c1b87ac0772716483aa02c` |
| State Machines | `99_ARCHIVE_SOURCE/STATE_MACHINES_V0.1.md` | `26ff0f4b97f381c87a24253f00e4a1440d9a1e6e` |
| Firestore Query Cost Budget | `99_ARCHIVE_SOURCE/FIRESTORE_QUERY_COST_BUDGET_V0.1.md` | `98d2f68884af3c911416acf3d0c4ac16741a1aea` |

The fetched documents identify themselves as V5.1/G0 baseline contracts. However, the branch README says this migration branch has not been merged into `main` pending review. Therefore, their existence on this branch does **not** by itself prove they are present on canonical `main`, nor does it authorize merging the branch. The authoritative governance record explicitly describes `99_ARCHIVE_SOURCE/` as a possible contract location, but branch reconciliation remains a governance task.

## 4. Master Specification status

The exact candidate paths checked in this pass (`99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION.md` and `99_ARCHIVE_SOURCE/MASTER_SPECIFICATION_V5.1.md`) returned 404 on the migration branch. This is not exhaustive proof that no differently named Master Specification exists. Master Specification path and PO approval evidence remain `UNPROVEN`.

## 5. Decision and safety boundary

- Decision 1: PO's stated rule remains 100 successful commercial orders, excluding five test orders; formal registration on remote `PO_DECISION_REGISTER.md` remains unverified.
- Decision 2: `OPEN / PENDING PO DECISION`.
- No application source changed.
- No branch merge, baseline edit, CURRENT_STATE update, or Work Item activation was performed.
- No PAT or credential is requested.

## 6. Verdict

`PARTIAL REMOTE DISCOVERY PASS / MASTER SPECIFICATION UNPROVEN / GOVERNANCE BRANCH RECONCILIATION REQUIRED`.

The next safe action is to reconcile the unmerged migration branch and locate/establish the PO-approved Master Specification through the existing Governance process. Do not begin prepaid-billing implementation or change canonical NEXT based solely on this evidence.
