STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# NGUỒN SỰ THẬT VÀ VAI TRÒ HỒ SƠ

Đây là mô hình đề xuất, chưa adoption. Nguồn được chỉ định cho một vai trò không đồng nghĩa mọi claim trong đó đã được xác minh.

| Lĩnh vực | Hồ sơ/nguồn | Vai trò và giới hạn |
|---|---|---|
| Quyết định PO | PO Tuấn; ghi tại DECISION_LOG | PO quyết định. Agent chỉ ghi quyết định có nguồn/ngày/phạm vi. |
| Hợp đồng sản phẩm | docs/PRODUCT_CHARTER_V5.1.md | Hợp đồng sản phẩm; không bị governance override. |
| Hợp đồng dữ liệu | docs/DATABASE_SCHEMA_V0.1.md | Hợp đồng schema. |
| Hợp đồng state machine | docs/STATE_MACHINES_V0.1.md | Hợp đồng chuyển trạng thái kỹ thuật. |
| Hợp đồng query/chi phí | docs/FIRESTORE_QUERY_COST_BUDGET_V0.1.md | Hợp đồng query/index/budget; ghi ngày và giả định. |
| Trạng thái hiện tại | Sau adoption và migration riêng: chỉ 09_CURRENT_STATE_V2.md | Trước đó không có registry V2 hiện hành; state legacy giữ là claim, không tự chọn. |
| Checkpoint | docs/rehabilitation/03_CHECKPOINTS.md cho đến migration được phép | Registry ghi quyết định, không cấp PO_VERIFIED; không sửa lịch sử trong Vòng 5. |
| Bằng chứng | docs/rehabilitation/04_TEST_EVIDENCE.md | Kết quả kèm nguồn, ngày, môi trường, thiết bị/người xác nhận; không thay quyết định. |
| Quyết định | docs/rehabilitation/05_DECISION_LOG.md | Ghi quyết định PO có nguồn/ngày/phạm vi; không ghi suy luận thành quyết định. |
| Thay đổi | docs/rehabilitation/06_CHANGE_LOG.md | Lịch sử thay đổi thực tế. |
| Hồi quy | docs/rehabilitation/07_REGRESSION_LOG.md | Tách hồi quy nghi ngờ khỏi đã xác nhận. |
| Vấn đề | docs/rehabilitation/08_KNOWN_ISSUES.md | Sổ vấn đề; audit không tự xác nhận xử lý. |
| Bàn giao | docs/rehabilitation/09_AI_HANDOFF.md | Snapshot ngữ cảnh; không override registry/evidence/PO. |
| Audit | docs/audits/REENTRY-001_FNB_SMART_PROJECT_STATUS.md | Đánh giá theo phạm vi/ngày; không tự cập nhật state. |
| Build baseline | docs/rehabilitation/BUILD_BASELINE.md | Mốc theo ngày; không tự chứng minh hiện đang áp dụng. |
| Hồ sơ cũ | Hai Kim Chỉ Nam, ROADMAP và records khác | Giữ nguyên claim; bất đồng không tự chọn hoặc sửa. |

## Xử lý bất đồng
Dừng hành động phụ thuộc; nêu nguồn, claim, ngày, phạm vi và evidence. Thiếu bằng chứng: UNPROVEN. Nguồn bất đồng: UNRESOLVED. Không chọn file mới hơn hoặc có chữ CURRENT. Vấn đề thẩm quyền/hợp đồng cần CONFLICT REQUIRES PO DECISION.

## Registry trạng thái duy nhất
Chỉ sau PO adoption và migration được cho phép riêng, 09_CURRENT_STATE_V2.md được đề xuất là registry duy nhất ghi trạng thái hiện tại. Trước đó V2 không thay CURRENT_STATE legacy. Giữ hồ sơ cũ làm lịch sử; không xóa hoặc sửa hồi tố.

## Project Journal role — PO direction 2026-09-26
PROJECT_JOURNAL_V2.md is a historical, source-attributed rollup by canonical A-stage. It is not a source-of-truth registry, PO decision, status authority or substitute for original evidence. When it differs from a valid decision/checkpoint/evidence/current-state source, preserve the difference and reconcile through the applicable authority/conflict process. A Journal entry may cite PO prompt assertions but must label provenance and limits.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.