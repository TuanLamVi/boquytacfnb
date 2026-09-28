STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# KẾ HOẠCH ADOPTION GOVERNANCE
STATUS: DRAFT — REVIEW CANDIDATE. KHÔNG PHẢI GOVERNANCE HIỆN HÀNH.
V2 không thay bộ legacy. Trình tự tương lai chỉ được xem xét:
REVIEW → PO APPROVAL → ADOPTION DECISION → CONTROLLED MIGRATION → LEGACY RETENTION
1. PO xem đủ 15 file V2 và conflict còn mở.
2. PO phê duyệt, từ chối hoặc yêu cầu sửa; ghi phạm vi/ngày.
3. Quyết định adoption riêng chỉ rõ tài liệu có hiệu lực, ngày và quan hệ nguồn sự thật.
4. Migration riêng có authorization cập nhật tham chiếu/registry, giữ bản gốc và audit trail.
5. Chỉ trong migration được phép mới đánh dấu legacy SUPERSEDED theo phạm vi; không xóa lịch sử.
Sau adoption/migration được phép, 09_CURRENT_STATE_V2.md có thể là registry CURRENT STATE duy nhất. Vòng 5 chỉ sửa dự thảo; kế hoạch này không thực hiện review thay PO, approval, adoption hay migration.

## Review-set completeness note — 2026-09-26
The “15 files” count in the V5 plan described the set at that time. Review must cover the complete then-current Governance V2 draft set, including later additions and amendments such as 15_AI_READ_ME_FIRST.md and the A-stage/Project Memory addenda. This is a document-count clarification only; it is not adoption or approval.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.