# F&B SMART V5.1 — GOVERNANCE CHANGE PROPOSAL & IMPACT REVIEW (PROMPT 110)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Governance Change Proposal & Impact Review (Prompt 110)
- **Author:** Product Owner (Tuấn) & Architecture Governance Team
- **Build Mode:** Clean Rebuild V5.1 (Governance & Audit Phase)
- **Status:** `READY FOR PO APPROVAL`
- **Source of Truth Reference:** `00_KIM_CHI_NAM/KIM_CHI_NAM.md`, `01_STATE/CURRENT_STATE.md`

---

## SECTION 1 — PROBLEM STATEMENT & AUDIT FINDINGS
1. **Prompt ID vs. Work Item Identity Mismatch:** 
   - Historically, prompt serial numbers (e.g., Prompt 101) have sometimes been referenced ambiguously across multiple work items (A6 vs A7) in chat history or reports. 
   - *Root Cause:* Conflating execution record identifiers (`Prompt ID`) with semantic entity identifiers (`Work Item ID`).
2. **Closure Sequence Completeness:**
   - Governance mandates the 5-step closure sequence: `PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED`. In rapid execution cycles, the explicit `REGRESSION CHECK` step was sometimes omitted or collapsed into general verification.
3. **Discovery vs. Implementation Evidence Standards:**
   - Product Discovery phases produce conceptual specifications, UX flows, and governance records without generating application code, test suites, or APK binaries. Governance must explicitly distinguish discovery evidence criteria from application implementation evidence criteria.

---

## SECTION 2 — PROPOSED GOVERNANCE ENHANCEMENTS
1. **Work Item Identity Model (`Work Item ID` vs `Prompt ID`):**
   - Establish `Work Item ID` (e.g., `A6`, `A7`, `A8`) as the immutable primary identity, while `Prompt ID` (e.g., `Prompt-110`) represents the execution record.
2. **Multi-Work-Item Prompt Rule:**
   - Any prompt affecting multiple work items must explicitly declare `Primary Work Item` and `Affected Work Items` in its header and final report.
3. **Closure Sequence Enforcement:**
   - Mandate explicit execution and logging of `REGRESSION CHECK` in the closure sequence for any work item modifying protected or locked scopes.
4. **History Preservation & Addendums:**
   - Strict prohibition on deleting past operational history. Corrections or adjustments must be recorded as append-only `Correction / Addendum` entries.

---

## SECTION 3 — IMPACT REVIEW
| Impact Domain | Impact Level | Analysis & Rationale |
|:---|:---|:---|
| **Governance Baseline** | Medium | Formalizes closure integrity and work item identity separation without altering KIM CHỈ NAM baseline rules. |
| **State & Checkpoint Models** | Low | Enhances traceability across checkpoints and work item history. |
| **Product Discovery & Master Spec** | Low | Clarifies evidence criteria for discovery vs implementation phases. |
| **Future Application Code** | Low | Enforces strict provenance and regression checks during application implementation. |

---
*End of Governance Change Proposal & Impact Review (Prompt 110)*
