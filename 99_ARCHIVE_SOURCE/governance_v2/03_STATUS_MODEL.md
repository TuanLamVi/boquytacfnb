STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# MÔ HÌNH TRẠNG THÁI

Trạng thái công việc khác nhãn vòng đời tài liệu trong 05_DOCUMENT_LIFECYCLE.md.

| Trạng thái | Ý nghĩa |
|---|---|
| NOT_STARTED | Chưa bắt đầu. |
| IN_PROGRESS | Đang thực hiện trong phạm vi được phép. |
| AI PASS | Coding Agent báo kiểm tra kỹ thuật đạt theo evidence; chưa phải thẩm định độc lập hoặc PO chấp nhận. |
| READY_FOR_PO_VERIFICATION | ChatGPT đã thẩm định phạm vi, tiêu chí và evidence, xác nhận đủ hồ sơ để PO kiểm tra thực tế; không phải PO PASS. |
| PO_VERIFICATION_PENDING | Đang chờ PO kiểm tra và quyết định. |
| PO PASS | PO trực tiếp kiểm tra đúng phạm vi và tuyên bố đạt; chưa tự cho phép ghi PO_VERIFIED. |
| PO_VERIFIED | Registry ghi PO đã trực tiếp PASS cho phạm vi xác định, sau lệnh ghi nhận riêng rõ ràng của PO. Agent ghi, không cấp. |
| LOCKED | Checkpoint PO_VERIFIED được khóa bảo vệ theo phạm vi đã ghi; không phải kết quả AI tự động. |
| PASS_TEMPORARY | Kết quả kỹ thuật tạm đạt; không phải PO PASS, PO_VERIFIED hoặc checkpoint cuối. |
| FAILED | Tiêu chí kỹ thuật/nghiệm thu xác định không đạt. |
| BLOCKED | Không thể tiếp tục do blocker được ghi nhận. |
| REGRESSION | Có evidence chức năng từng được chấp nhận bị hỏng trở lại. |
| UNPROVEN | Chưa đủ evidence để xác lập claim. |
| UNRESOLVED | Nguồn/claim mâu thuẫn hoặc mơ hồ chưa giải quyết. |
| REPORT_FORMAT_BLOCKED | Không thể tạo báo cáo theo định dạng bắt buộc. |

AI PASS ≠ READY_FOR_PO_VERIFICATION ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED.

## Cổng bắt buộc
ChatGPT xác nhận READY_FOR_PO_VERIFICATION sau khi thẩm định hồ sơ. PO duy nhất quyết định PO PASS/FAIL qua kiểm tra trực tiếp. Agent chỉ ghi PO_VERIFIED khi có PO PASS trực tiếp và lệnh ghi nhận riêng xác định checkpoint/phạm vi. Không có lệnh: không ghi PO_VERIFIED hoặc LOCKED.

## Cách đọc từ legacy
| Từ legacy | Cách hiểu an toàn | Tự động thành PO_VERIFIED? |
|---|---|---|
| PASS | Claim cần rõ người nói và phạm vi. | KHÔNG |
| PASS_TECHNICAL | Kết quả kỹ thuật. | KHÔNG |
| VERIFIED | Cần biết verifier, phạm vi và evidence. | KHÔNG |
| COMPLETED | Claim hoàn thành, không chứng minh PO chấp nhận. | KHÔNG |
| PROTECTED | Claim bảo vệ, cần hồ sơ checkpoint. | KHÔNG |
| DEPLOYED | Claim sự kiện deploy, không phải nghiệm thu. | KHÔNG |
| BUILD_VERIFIED | Claim build, không phải PO PASS. | KHÔNG |

Giữ nguyên từ legacy khi trích dẫn; không tự ánh xạ.

## Canonical A-stage parent and branch status — 2026-09-26
By PO direction, A0/A1/A2/A3/A4... are parent stages; decimal IDs are branches/items/checkpoints under the matching parent prefix. Record branch result and parent result separately. A2.2 PASS does not mean A2 PASS; A3.3 PASS does not mean A3 PASS. Do not aggregate sibling branches into a parent pass without full parent scope/criteria evidence and the required acceptance. Legacy labels remain attributed to their original scope and date. This addendum does not adoption Governance V2 or change any prior decision.
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.