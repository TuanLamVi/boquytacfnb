STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: READING GUIDE ONLY — NO GOVERNANCE AUTHORITY
SOURCE: PROMPT VÒNG 6 + FORENSIC REVIEW OF EXISTING GOVERNANCE V2
DO NOT TREAT V2 AS ACTIVE GOVERNANCE UNTIL PO APPROVAL AND A SEPARATE ADOPTION DECISION
# DOCUMENT MAP & AI READING PROTOCOL

> **LAW-014 — build safety:** Do not build unless explicitly authorized. Inspect actual toolchain/Firebase configuration first; use the PO-designated A0-BUILD-001 target only when it matches the checkout. Mismatch or first failure: stop and preserve evidence. Production/release is protected. Build SUCCESS ≠ app functional PASS ≠ PO verification. Record the full APK identity and build report; if no build, write `BUILD: NOT EXECUTED — OUT OF SCOPE`. See Kim Chỉ Nam V2 §9.
> **LAW-013 — mandatory final report:** Every performed prompt ends with the entire report in exactly one fenced code block, using the fixed template in Kim Chỉ Nam V2 §10. No report text outside the block; do not split or alter the template without PO authorization. If impossible, state `STATUS = REPORT_FORMAT_BLOCKED` and do not claim full governance completion.

> **Canonical IDs — PO direction:** A0/A1/A2/A3/A4 are parent stages. New items use A2-01/A2-02/... (deeper A2-02-01 only when needed). A2-02 PASS ≠ A2 PASS. AI PASS ≠ PO PASS. PO_UNVERIFIED ≠ PO_VERIFIED. Preserve TEST_DEBT. Historical ID ≠ Canonical ID; do not crosswalk without scope evidence. Existing decimal IDs remain history. V2 remains DRAFT — NOT YET ADOPTED.

## 1. Mục đích và giới hạn
Đây là bản đồ đọc theo câu hỏi/nhiệm vụ để chọn nguồn cần thiết. Đây chỉ là hướng dẫn điều hướng, không phải Kim Chỉ Nam, không tạo quy tắc, không phân xử conflict, không xác minh claim và không cấp quyền sửa.

Toàn bộ `docs/governance_v2/` vẫn là dự thảo, NOT YET ADOPTED. Tài liệu này không làm V2 thành governance hiện hành. Không tài liệu nào trong V2 được coi là Kim Chỉ Nam đang có hiệu lực chỉ vì tên, thứ tự hoặc ngày. Nếu có Kim Chỉ Nam/hợp đồng/ủy quyền hiện hành được xác định, áp dụng đúng thẩm quyền và phạm vi của nó. Các Kim Chỉ Nam legacy có bất đồng chưa được phân xử thì dừng hành động phụ thuộc và dùng quy trình 06; không để bản đồ này chọn thay PO.

Không cần đọc mọi log cho mọi nhiệm vụ. Đọc lõi quản trị và những nguồn trực tiếp liên quan; mở rộng khi câu hỏi, phạm vi, conflict, rủi ro hoặc evidence đòi hỏi. Nếu prompt yêu cầu forensic toàn bộ, tuân thủ phạm vi forensic đó.

## 2. Thứ tự nền tối thiểu
1. Đọc prompt hiện tại để xác định câu hỏi, phạm vi, điều được phép và đầu ra.
2. Đọc tài liệu này để định tuyến; nhớ đây không phải authority.
3. Đọc `01_AUTHORITY_MODEL.md`, `02_SOURCE_OF_TRUTH.md`, `03_STATUS_MODEL.md`, `06_CONFLICT_MANAGEMENT.md`, `07_AI_OPERATING_RULES.md` ở mức cần thiết cho mọi công việc có thể thay đổi hoặc tuyên bố trạng thái.
4. Theo bảng luồng bên dưới, đọc hồ sơ/trạng thái/checkpoint/evidence và hợp đồng liên quan đến nhiệm vụ.
5. Trước thao tác repo, đọc `08_AI_SESSION_HANDOFF.md`, ghi nhận Git status/branch/HEAD và xác nhận scope. Với câu hỏi thuần tài liệu không sửa repo, không cần bước Git.

Đọc một nguồn chỉ chứng minh nguồn đã được đọc; không xác nhận claim trong đó. `14_SOURCE_INDEX.md` mô tả nguồn đã đọc và giới hạn xác minh, không phải sổ trạng thái.

## 3. Phân loại tài liệu theo quyền hạn và vai trò
| Loại | Nguồn để mở | Dùng để | Giới hạn khi đọc |
|---|---|---|---|
| Kim Chỉ Nam | `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md`; `docs/rehabilitation/KIM_CHI_NAM_CAI_TAO_FNB_SMART.md`; bản V2 `00_KIM_CHI_NAM_FNB_SMART_V2.md` | Tìm quy tắc và phạm vi được nêu | Hai bản legacy có claim khác nhau; V2 là dự thảo. Không tự chọn bản thắng hoặc coi V2 có hiệu lực. |
| Hợp đồng G0 | `docs/PRODUCT_CHARTER_V5.1.md`; `docs/DATABASE_SCHEMA_V0.1.md`; `docs/STATE_MACHINES_V0.1.md`; `docs/FIRESTORE_QUERY_COST_BUDGET_V0.1.md` | Ràng buộc sản phẩm, dữ liệu, state machine, truy vấn/chi phí tương ứng | Đọc hợp đồng đúng miền. Governance không sửa hợp đồng. Bất đồng áp dụng cần xử lý, không tự diễn giải thành thay đổi hợp đồng. |
| Thẩm quyền | `01_AUTHORITY_MODEL.md` | Ai đề xuất, thực hiện, thẩm định, quyết định và ghi nhận | Mô hình V2 chưa adoption; quyết định PO phải có nguồn và phạm vi. |
| Nguồn sự thật / vai trò hồ sơ | `02_SOURCE_OF_TRUTH.md`; `14_SOURCE_INDEX.md` | Tìm hồ sơ phù hợp cho từng loại claim | Chỉ định vai trò không đồng nghĩa claim đã xác minh; registry V2 chỉ được đề xuất sau adoption và migration riêng. |
| Trạng thái công việc | `03_STATUS_MODEL.md`; legacy `docs/rehabilitation/02_CURRENT_STATE.md`; V2 `09_CURRENT_STATE_V2.md` | Phân biệt trạng thái và claim theo nguồn | `09` là khung dự thảo, không phải registry hiện hành. Legacy state còn bất đồng. |
| Checkpoint | `04_CHECKPOINT_MODEL.md`; `docs/rehabilitation/03_CHECKPOINTS.md` | Xác định ID, phạm vi, evidence, quyết định và vùng bảo vệ | Registry không cấp PO_VERIFIED. Không sửa/di trú lịch sử nếu chưa được phép. |
| Vòng đời tài liệu | `05_DOCUMENT_LIFECYCLE.md` | Hiểu CURRENT/HISTORICAL/SUPERSEDED/AUDIT SNAPSHOT/BASELINE | Tên CURRENT hoặc ngày mới hơn không tự ưu tiên nguồn. |
| Conflict | `06_CONFLICT_MANAGEMENT.md`; `13_CONFLICT_REGISTER_V2.md` | Ghi bất đồng, phạm vi và tác động | C01–C13 còn mở theo sổ dự thảo; bản đồ không đóng conflict. |
| Evidence | `docs/rehabilitation/04_TEST_EVIDENCE.md`; evidence trực tiếp trong prompt/đầu ra được phép | Xem bằng chứng, ngày, môi trường, phạm vi và người xác nhận | Đọc evidence không thay quyết định; không suy diễn test chưa chạy. |
| Quyết định | `docs/rehabilitation/05_DECISION_LOG.md`; `10_PO_DECISION_REGISTER_V2.md` | Tìm quyết định được quy cho PO, nguồn/ngày/phạm vi | Register V2 là dự thảo; ghi chép không tự tạo quyết định. |
| Thay đổi | `docs/rehabilitation/06_CHANGE_LOG.md`; `11_GOVERNANCE_CHANGE_LOG_V2.md` | Tìm lịch sử thay đổi thực tế/tài liệu | Không dùng change log để suy ra nội dung hiện hành nếu chưa đối chiếu. |
| Hồi quy | `docs/rehabilitation/07_REGRESSION_LOG.md` | Tìm lỗi hồi quy đã ghi và trạng thái | Tách nghi ngờ khỏi xác nhận; đối chiếu evidence và phạm vi bảo vệ. |
| Vấn đề | `docs/rehabilitation/08_KNOWN_ISSUES.md` | Tìm issue đã ghi | Audit finding không tự chứng minh issue đã mở/đóng. |
| Bàn giao | `docs/rehabilitation/09_AI_HANDOFF.md`; `08_AI_SESSION_HANDOFF.md` | Khôi phục ngữ cảnh và việc còn dở | Snapshot để định tuyến; không override PO, evidence, hợp đồng hoặc state registry hợp lệ. |
| Roadmap / audit / baseline | `docs/rehabilitation/01_ROADMAP.md`; `docs/audits/REENTRY-001_FNB_SMART_PROJECT_STATUS.md`; `docs/rehabilitation/BUILD_BASELINE.md` | Kế hoạch, phát hiện theo thời điểm, build snapshot | Không tự chứng minh phase, issue resolution hoặc baseline hiện hành. |

## 4. Câu hỏi → tài liệu cần đọc
| Câu hỏi | Đọc trước | Mở rộng khi cần |
|---|---|---|
| “Quy tắc nào áp dụng / ai có quyền?” | Prompt; Kim Chỉ Nam liên quan; `01_AUTHORITY_MODEL.md`; `06_CONFLICT_MANAGEMENT.md` | Hai Kim legacy, hợp đồng G0, decision log, conflict C01–C03/C09; dừng nếu thẩm quyền/phạm vi chưa rõ. |
| “Trạng thái hiện tại là gì?” | `02_SOURCE_OF_TRUTH.md`; `09_CURRENT_STATE_V2.md` chỉ như khung draft; legacy `02_CURRENT_STATE.md` | `03_CHECKPOINTS.md`, `01_ROADMAP.md`, `09_AI_HANDOFF.md`, audit REENTRY-001, `13_CONFLICT_REGISTER_V2.md`; ghi rõ nguồn và bất đồng, không tự chọn. |
| “Checkpoint nào được xác nhận/bảo vệ?” | `04_CHECKPOINT_MODEL.md`; legacy `03_CHECKPOINTS.md`; `05_DECISION_LOG.md` | `04_TEST_EVIDENCE.md`, `06_CHANGE_LOG.md`, `07_REGRESSION_LOG.md`, hợp đồng và scope liên quan. Claim lịch sử không thành xác minh mới. |
| “Vì sao có quyết định này?” | `05_DECISION_LOG.md`; `04_TEST_EVIDENCE.md` | `06_CHANGE_LOG.md`, hợp đồng G0, checkpoint liên quan, prompt/nguồn PO gốc. Tách lý do được ghi khỏi suy luận hiện tại. |
| “Hai tài liệu đang xung đột?” | `01_AUTHORITY_MODEL.md`; `02_SOURCE_OF_TRUTH.md`; `06_CONFLICT_MANAGEMENT.md`; `13_CONFLICT_REGISTER_V2.md` | Mở nguyên văn các nguồn, ngày/phạm vi/sự kiện/evidence; kiểm tra có thật sự cùng scope không. Dừng hành động phụ thuộc và yêu cầu quyết định nếu thuộc PO. |
| “Có lỗi đã biết/hồi quy/audit finding?” | `08_KNOWN_ISSUES.md`; `07_REGRESSION_LOG.md` | `04_TEST_EVIDENCE.md`, audit REENTRY-001, checkpoint bảo vệ, change log; không coi finding là issue đã xác nhận. |
| “Thay đổi nào đã xảy ra?” | `06_CHANGE_LOG.md` | Diff/commit/evidence theo quyền truy cập; V2 `11_GOVERNANCE_CHANGE_LOG_V2.md` chỉ về sửa governance. |
| “Build/Firebase/thiết bị nào dùng?” | Prompt có chỉ định; `BUILD_BASELINE.md`; `02_CURRENT_STATE.md`; `09_AI_HANDOFF.md` | REENTRY-001, evidence, `13_CONFLICT_REGISTER_V2.md` C02/C06/C07; nếu còn UNPROVEN/UNRESOLVED thì không chọn theo tên hoặc lịch sử. |
| “AI phiên trước đã làm gì / cần tiếp tục đâu?” | `08_AI_SESSION_HANDOFF.md`; legacy `09_AI_HANDOFF.md` | Chỉ đọc current state/checkpoint/evidence/log và hợp đồng liên quan tới nhiệm vụ tiếp; kiểm tra Git trước khi sửa. |
| “Sửa schema/state/query/product ra sao?” | Hợp đồng G0 đúng miền | Implementation/evidence được phép và conflict C03/C11/C12; không biến bản đồ thành quyền sửa. |
| “Bộ V2 thay đổi gì / đã adoption chưa?” | `11_GOVERNANCE_CHANGE_LOG_V2.md`; `12_GOVERNANCE_ADOPTION_PLAN.md`; `10_PO_DECISION_REGISTER_V2.md` | Tìm quyết định PO có nguồn. Hiện V2 vẫn draft cho tới khi có adoption riêng được ghi nhận. |

## 5. Luồng đọc theo nhiệm vụ

### A. AI mới tiếp nhận dự án
Prompt → tài liệu này → `01`, `02`, `03`, `06`, `07` → `08_AI_SESSION_HANDOFF.md` → `09_CURRENT_STATE_V2.md` (chỉ để hiểu các claim draft, không coi registry active) và `13_CONFLICT_REGISTER_V2.md` → legacy current state/checkpoint/evidence/issue/regression/handoff liên quan → hợp đồng G0 theo nhiệm vụ → Git trước/sau nếu có repo action. Mở logs khác chỉ khi câu hỏi hoặc bằng chứng đòi hỏi.

### B. ChatGPT chuẩn bị prompt cho Coding Agent
Đọc yêu cầu PO và `01`, `02`, `03`, `04`, `06`, `07`, `08`; tra claim hiện trạng ở `09` và legacy state/checkpoint/handoff nhưng gắn nhãn nguồn; tra conflict liên quan; đọc issue/regression/evidence/decision/change theo scope; thêm đúng hợp đồng G0. Prompt phải ghi mục tiêu, scope, file được phép/được bảo vệ, điều kiện dừng, bằng chứng/kiểm tra yêu cầu và định dạng báo cáo. Không chuyển claim legacy thành sự thật hiện hành và không trao thêm quyền từ tài liệu này.

### C. Coding Agent nhận prompt
Đọc prompt/scope → `08_AI_SESSION_HANDOFF.md` và `07_AI_OPERATING_RULES.md` → `01`/`03`/`04`/`06` theo rủi ro → checkpoint/current state/conflict/evidence/issue/regression/handoff liên quan → hợp đồng kỹ thuật/sản phẩm đúng miền → ghi Git status/branch/HEAD → chỉ thao tác trên phạm vi được phép. Build, test, Firebase, thiết bị chỉ khi prompt cho phép và nêu cụ thể. Lỗi có ý nghĩa hoặc điểm tranh chấp ảnh hưởng hành động: dừng, giữ evidence, báo cáo.

### D. Xác định current state
Đọc `02_SOURCE_OF_TRUTH.md`, `09_CURRENT_STATE_V2.md` và trạng thái draft của V2; đối chiếu legacy `02_CURRENT_STATE.md`, `03_CHECKPOINTS.md`, `01_ROADMAP.md`, `09_AI_HANDOFF.md`, audit theo thời điểm và evidence liên quan. Tách từng claim, nguồn, ngày, scope, mức bằng chứng. Nếu khác nhau hoặc chưa chứng minh cùng scope: ghi UNRESOLVED/UNPROVEN và xem C04–C07/C10; không tổng hợp thành một trạng thái duy nhất theo ý AI. V2 `09` không phải nguồn active trước adoption và migration được phép riêng.

### E. Kiểm tra checkpoint
Đọc `04_CHECKPOINT_MODEL.md`, checkpoint legacy nguyên văn, PO decision, evidence và tiêu chí/phạm vi cần kiểm tra; đối chiếu change/regression và hợp đồng có liên quan. Phân biệt AI PASS, READY_FOR_PO_VERIFICATION, PO PASS, PO_VERIFIED, LOCKED. Không suy ra quyền khóa/mở khóa hoặc hợp nhất ID. Thiếu lệnh PO/evidence/phạm vi thì không ghi PO_VERIFIED/LOCKED.

### F. Truy nguyên lý do quyết định
Tìm entry trong `05_DECISION_LOG.md`, xác định decision-maker, ngày, nguồn trực tiếp và scope; rồi đọc evidence tương ứng, checkpoint, change log và hợp đồng liên quan. Nếu chỉ có lời tóm tắt ở handoff/audit, quay về nguồn quyết định gốc; nếu không tìm thấy, báo chưa xác minh thay vì dựng lý do.

### G. Xử lý conflict
Đọc `01`, `02`, `06`, `13`; mở nguyên văn mọi nguồn liên quan. Ghi claim, nguồn, ngày, phạm vi, đối tượng/sự kiện, evidence và hậu quả chọn sai; kiểm tra khác biệt thời điểm/scope trước khi kết luận conflict. Dừng hành động phụ thuộc. Không chọn theo ngày mới, tên file, nhãn CURRENT, độ dài hoặc giọng khẳng định. Thiếu chứng cứ là UNPROVEN; bất đồng/phạm vi chưa rõ là UNRESOLVED; thẩm quyền/hợp đồng/lựa chọn thuộc PO thì ghi CONFLICT REQUIRES PO DECISION. Chỉ tiếp tục phần độc lập với điểm tranh chấp.

## 6. Trạng thái, claim và giới hạn suy luận
Giữ nguyên trạng thái theo đúng người nói, nguồn, scope và thời điểm. AI PASS ≠ READY_FOR_PO_VERIFICATION ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED. Tương tự, nhãn CURRENT/HISTORICAL/SUPERSEDED/AUDIT SNAPSHOT/BASELINE là vòng đời tài liệu, không phải trạng thái công việc. “Đã đọc”, audit finding, build/test pass, tên file hoặc câu “completed/verified” trong nguồn legacy không tự xác minh claim. Chỉ gán kết luận mà evidence và thẩm quyền cho phép; nếu không đủ, ghi UNPROVEN hoặc UNRESOLVED.

## 7. Ranh giới authority và bảo toàn lịch sử
Nếu hướng dẫn đọc này có vẻ khác với Kim Chỉ Nam hoặc hợp đồng có thẩm quyền, bản đồ này không thắng: dừng, ghi nhận khác biệt, áp dụng quy trình conflict phù hợp và hỏi PO khi cần. Tuy nhiên, V2 chưa adoption nên không được giả định Kim V2 hiện là authority; phải xác định nguồn/ủy quyền hiện hành trong phạm vi nhiệm vụ. Tài liệu này không thay thế PO decision, không sửa/di trú hồ sơ, không đóng C01–C13, không cấp quyền build/deploy/install, và không tuyên bố PO_VERIFIED/LOCKED.

## 8. Quy tắc cập nhật bản đồ
Khi nguồn/hồ sơ được thay đổi hợp lệ, chỉ cập nhật đường dẫn hoặc hướng dẫn đọc khi prompt cho phép. Nêu rõ nguồn nào được đổi và vì sao; giữ trạng thái draft cho đến adoption riêng. Không đánh dấu nguồn legacy SUPERSEDED, không sửa G0 và không thay đổi scope chỉ để bản đồ trông nhất quán.

## Project Memory and A-stage continuity — PO direction 2026-09-26
For project handoff, read in this order:
Governance/authority (respecting NOT ADOPTED status) → current-state records → PROJECT_JOURNAL_V2.md → checkpoint/protection map → roadmap → task.

The Journal is a source-attributed history index, not a source of truth or PO decision. Compare its citations with the underlying evidence, checkpoint and decision records. Record parent stage and branch status separately: A2.2 PASS ≠ A2 PASS; A3.3 PASS ≠ A3 PASS. Parent PASS requires full parent-scope acceptance evidence.

Before code work, write CURRENT A-STAGE, TASK, RELATED A-STAGES and LOCKED SCOPE IMPACT (NONE / DETECTED / UNKNOWN). NONE requires demonstrated no-impact. DETECTED means stop before mutation and ask PO with the checkpoint and affected behavior. UNKNOWN allows read-only investigation; if unresolved, STOP. A listed file is an impact reference, not automatically an immutable file. Do not repeat a protected stage absent PO revalidation instruction. A2 revalidation is deferred until Kim Chỉ Nam completion and separate PO authorization.

Current handoff claim: A4 is the PO-directed working stage, not A4 PASS; the specific product task is not present in the reviewed records. Historical state disagreements remain visible in PROJECT_JOURNAL_V2.md and require reconciliation.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.
## Current PO decisions C01–C13 — 2026-09-26
Before acting on any of these topics, read `10_PO_DECISION_REGISTER_V2.md`, `13_CONFLICT_REGISTER_V2.md` and `09_CURRENT_STATE_V2.md`. Governance V2 remains DRAFT / NOT ADOPTED.

- C02: authorized Agent work may BUILD → INSTALL → OPEN APP → VERIFY APP LAUNCH. No business UI operations or business test by Agent. PO does UI/business test and decides PASS/PO_VERIFIED/LOCKED. App launch success is not business PASS.
- C03: rehabilitate the existing project; no repo/project/architecture/platform/Firebase switch without a new PO decision.
- C04/C05/C13: review from A0; canonical sequence A0→A1→A2→A3→A4…; child IDs use hyphens. Old IDs/phases are historical; do not infer crosswalks.
- C06: current PO-designated Firebase is `fnb-smart-dev`. Static checkout currently references `fnb-smart`; this is a mismatch, not permission to edit config. Runtime is unverified.
- C07: use the PO-designated toolchain as target; report mismatch, do not change versions or build without explicit authorization.
- C01/C08–C12: preserve the exact limits and historical evidence recorded in the Decision Register. An audit finding is not automatically a bug; no speculative contract conflict; Sale allocation and Reversal scope remain distinct.

These directions do not create PO_VERIFIED/LOCKED, adopt V2, authorize revalidation, or change protected files/config.
