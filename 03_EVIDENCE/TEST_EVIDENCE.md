# TEST EVIDENCE

## Mục đích

Lưu bằng chứng thực tế dùng để hỗ trợ một kết quả. Evidence không thay quyết định của PO.

## Phân biệt

- technical evidence;
- PO evidence;
- historical evidence;
- current verification.

Không dùng một loại evidence để suy ra loại khác.

## Ghi test mới

### TEST-<ID>
- Date:
- Work Item:
- Scope:
- Steps:
- Expected:
- Actual:
- Evidence:
- Result:
- PO verification:

### VERIFICATION NOTE — MASTER-SPECIFICATION-GATE-V5.1 — 2026-10-09
- **Work Item:** MASTER-SPECIFICATION-GATE
- **Scope:** PO approval of the V5.1 Master Specification and four baseline contracts; governance/documentation only.
- **Steps:** Read back the approved Master Specification, PO Decision Register, Current State, Work Item History, Checkpoints, Protection Map, AI Handoff, and approval evidence from canonical GitHub branch `main`.
- **Expected:** V5.1 specification approval and associated governance records agree; V5.2 wallet addendum remains separate and pending.
- **Actual:** PO approval recorded as `PO_VERIFIED / APPROVED / PROTECTED / LOCKED`; V5.2 addendum and low-wallet warning Decision 2 remain pending.
- **Evidence:** `03_EVIDENCE/MASTER-SPEC-PO-APPROVAL-2026-10-09.md`.
- **Result:** GOVERNANCE READ-BACK VERIFIED. Application tests were not run because no application code changed.
- **PO verification:** PO approved the V5.1 specification baseline; this is not application runtime verification.


## FORENSIC EVIDENCE — WI-PREPAID-EMPLOYEE-BILLING-01 (2026-10-09)

- **Type:** Read-only repository structure inspection; not an application test.
- **Repository:** `TuanLamVi/fnb-smart-v5-clean-rebuild`, branch `main`.
- **Finding 1:** Recursive tree reports 106 entries and `truncated=false`; no `clean_rebuild_v5/lib/features/account/` paths exist although `clean_rebuild_v5/lib/clean_rebuild_core.dart` exports account files from that path.
- **Finding 2:** No `functions/` or `firestore.rules` path exists in the official Clean Rebuild tree.
- **Verdict:** `FIRST FAILURE / BLOCKED`; safe server-authoritative wallet implementation must stop pending baseline/security foundation reconciliation.
- **Issue:** https://github.com/TuanLamVi/fnb-smart-v5-clean-rebuild/issues/1
- **Explicit limitation:** Flutter tests, build, deployment, and runtime behavior were not run or verified by this inspection.
