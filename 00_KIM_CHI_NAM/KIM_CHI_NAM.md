# KIM CHỈ NAM — F&B SMART V5
# BỘ LUẬT QUẢN TRỊ QUY TRÌNH PHỤC HỒI (REHABILITATION) VÀ XÂY MỚI (CLEAN REBUILD)

> **BẢN LUẬT CHÍNH (BASELINE):** Đây là bộ luật quản trị thống nhất áp dụng cho cả hai giai đoạn: Phục hồi (Rehabilitation) hệ thống cũ và Xây mới (Clean Rebuild) F&B SMART V5.1 từ đầu.
> Bộ luật này không thay thế nội dung chuyên môn của Product Charter V5.1, Database Schema V0.1, State Machines V0.1 hoặc Query Cost Budget V0.1.
>
> **BỘ LUẬT NỀN (PO FREEZE BASELINE):** Sau khi được PO phê duyệt, bộ quy tắc này là baseline cố định. Mọi thay đổi quy trình về sau bắt buộc phải có PO Decision chính thức.

---

## 1. Thẩm quyền (Authority Model)

- **PO / Chủ đầu tư:** Tuấn.
- AI / Coding Agent (ChatGPT, Codex, Gemini) chỉ được hoạt động trong phạm vi được PO giao.
- Chỉ PO có thẩm quyền:
  - Xác nhận `PO_VERIFIED`;
  - Cho phép `UNLOCK` vùng đã bảo vệ;
  - Quyết định thay đổi quy định, kiến trúc hoặc nghiệp vụ;
  - Phê duyệt Master Specification và kích hoạt các chế độ vận hành.

---

## 2. Nguồn sự thật (Source of Truth)

### 2.1. Quản trị
Bộ KIM CHỈ NAM (`00_KIM_CHI_NAM/KIM_CHI_NAM.md`) quyết định:
- Thẩm quyền và hai chế độ vận hành;
- Trạng thái công việc và lớp bảo vệ;
- Quy trình nghiệm thu (`PO_VERIFIED`) và phong tỏa (`LOCKED`);
- Luật dừng ngay khi có lỗi (`First Failure Stop`);
- An toàn Git (`Git Safety`) và Nguồn gốc Build/Deploy (`Provenance`);
- Đồng bộ hồ sơ (`Closure Synchronization` - LAW-015);
- Cầu nối quyết định PO (`PO Decision Bridge` - LAW-016);
- Tái nhập phiên làm việc (`Session Reentry` - LAW-017);
- Nguyên tắc Contract-First, Master Spec Gate và Khống chế thay đổi thiết kế giữa chừng.

### 2.2. Chuyên môn V5.1
Bốn tài liệu sau là hợp đồng chuẩn chính thức về nghiệp vụ và kỹ thuật cho F&B SMART V5.1:
1. `PRODUCT_CHARTER_V5.1.md`
2. `DATABASE_SCHEMA_V0.1.md`
3. `STATE_MACHINES_V0.1.md`
4. `FIRESTORE_QUERY_COST_BUDGET_V0.1.md`

Governance điều chỉnh quy trình quản lý; tuyệt đối không tự ý sửa đổi hoặc ghi đè nội dung chuyên môn của các hợp đồng này. Nếu phát hiện mâu thuẫn giữa các tài liệu chuyên môn, AI phải đánh dấu `CONFLICT / UNRESOLVED` và trình PO quyết định.

### 2.3. Hồ sơ vận hành
Các hồ sơ vận hành chính thức trong repository:
- `01_STATE/CURRENT_STATE.md`
- `01_STATE/WORK_ITEM_HISTORY.md`
- `01_STATE/PO_DECISION_REGISTER.md`
- `01_STATE/ROADMAP.md`
- `02_CONTROL/CHECKPOINTS.md`
- `02_CONTROL/PROTECTION_MAP.md`
- `02_CONTROL/REGRESSION_LOG.md`
- `03_EVIDENCE/TEST_EVIDENCE.md`
- `03_EVIDENCE/BUILD_BASELINE.md`
- `05_SESSION/AI_HANDOFF.md`

---

## 3. Hai Chế độ Vận hành (Operating Modes) & Ranh giới Hệ thống

### 3.1. REHABILITATION MODE (Chế độ Phục hồi & Cải tạo)
- **Mục đích:** Sửa chữa, cải tạo trên nền hệ thống cũ (Legacy).
- **Nguyên tắc:** Giữ phần đúng, sửa phần sai, bổ sung phần thiếu; không rewrite tự do toàn bộ ứng dụng khi chưa được PO cho phép.

### 3.2. CLEAN_REBUILD MODE (Chế độ Xây mới từ đầu)
- **Mục đích:** Triển khai xây dựng codebase F&B SMART V5.1 mới hoàn toàn độc lập từ đầu theo đúng bộ hợp đồng chuyên môn V5.1.
- **Kích hoạt:** Được kích hoạt khi có PO Authorization chính thức (chính thức kích hoạt qua `DEC-2026-CLEAN-REBUILD-V5.1`).
- **Nguyên tắc:**
  - Không dựa vào patch chain của legacy làm nền.
  - Phải tuân thủ tuyệt đối quy trình Contract-First và Master Specification Gate.
  - Có Build Boundary riêng, Source Boundary riêng, Namespace riêng.

### 3.3. Đóng băng Hệ thống cũ (Legacy Freeze)
- Khi `CLEAN_REBUILD MODE` được PO kích hoạt: **LEGACY SYSTEM = FROZEN**.
- Legacy codebase chỉ được sử dụng làm:
  - Tham khảo nghiệp vụ thực tế;
  - Tham khảo lịch sử và forensic;
  - Tham khảo các lỗi đã từng xảy ra và bài học kỹ thuật.
- **Tuyết đối không tiếp tục patch/sửa chữa legacy codebase** chỉ để hoàn thành một Work Item cũ.
- Bất kỳ yêu cầu sửa chữa legacy codebase nào sau khi đã Freeze bắt buộc phải có PO Decision riêng biệt.

### 3.4. Tách biệt tuyệt đối Bản cũ và Bản mới (Legacy ≠ New V5.1)
Ranh giới giữa Legacy và New System V5.1 phải được tách biệt hoàn toàn:
- Không trộn Source code, Repository, Folder structure;
- Không dùng chung Firebase project / Database thử nghiệm mà không có ranh giới tenant/namespace;
- Không trộn APK / Deployment artifacts;
- Không dùng chung Work Items, Checkpoints, Protection Maps, Test Evidence.
- Protection/LOCK của legacy codebase KHÔNG tự động áp dụng cho new system; new system vận hành hệ thống checkpoint và protection độc lập.

---

## 4. Nguyên tắc Xây dựng Mới (Clean Rebuild Rules)

### 4.1. Contract-First (Thiết kế & Hợp đồng trước, Code sau)
Clean Rebuild tuyệt đối không được bắt đầu bằng việc viết code ứng dụng.
Trật tự thực hiện bắt buộc:
```text
YÊU CẦU (Requirements)
→ THIẾT KẾ (Design)
→ DỮ LIỆU (Data Schema)
→ TRẠNG THÁI (State Machines)
→ QUY TẮC GIAO TIẾP (Protocol Contracts)
→ KIỂM TRA (Acceptance Test Plan)
→ MỚI ĐƯỢC VIẾT CODE (Implementation)
```
Nghiêm cấm quy trình sai lệch: `CODE → TEST → LỖI → PATCH → LỖI KHÁC → PATCH`.

### 4.2. Master Specification Gate (Cổng Đặc tả Master)
Trước khi viết bất kỳ dòng application code mới nào cho Clean Rebuild, bắt buộc phải hoàn thành tài liệu **CLEAN REBUILD MASTER SPECIFICATION** và được PO duyệt.
Master Specification phải chốt tối thiểu:
- Phạm vi ứng dụng & các tính năng chính;
- Cách các thành phần liên kết với nhau;
- Cấu trúc dữ liệu & vòng đời dữ liệu;
- Các state machines & chuyển đổi trạng thái;
- Quy tắc tài chính & kế toán dòng tiền;
- Phân quyền người dùng & tenant/store boundary;
- Tiêu chuẩn kiểm tra và nghiệm thu.

Không được phép viết code nếu Master Specification chưa hoàn tất và chưa có `PO_VERIFIED`.

### 4.3. Cấm Tự ý Thay đổi Thiết kế Giữa chừng
Sau khi Master Specification được PO phê duyệt:
- AI / Coding Agent không được tự ý thay đổi: Kiến trúc, Cấu trúc dữ liệu, Trạng thái State Machine, Quy tắc nghiệp vụ, hoặc Quy tắc giao tiếp.
- Nếu phát hiện vấn đề cần điều chỉnh thiết kế trong quá trình xây dựng:
  ```text
  STOP
  → Ghi nhận vấn đề (Issue/Conflict)
  → Phân tích ảnh hưởng (Impact Analysis)
  → Trình PO DECISION
  → Cập nhật lại tài liệu Master Spec / Hợp đồng
  → Xác định phạm vi phải làm lại (Rework Scope)
  → Mới được tiếp tục triển khai.
  ```
- Nghiêm cấm hành vi tự ý "sửa đại cho chạy" mà không qua phê duyệt thiết kế.

### 4.4. Test-First (Xác định Tiêu chuẩn Kiểm tra trước)
- Mỗi thành phần/chức năng quan trọng phải xác định kịch bản kiểm tra nghiệm thu (Acceptance Criteria & Test Plan) trước khi viết code implementation.
- Khi phát hiện một lỗi trong quá trình xây dựng:
  ```text
  STOP
  → Thu thập bằng chứng (Evidence)
  → Tìm nguyên nhân gốc (Root Cause)
  → Sửa đúng phạm vi (Scoped Fix)
  → Retest nghiệm thu.
  ```

### 4.5. Truy xuất Nguồn gốc Build & Deploy (Provenance)
Mọi bản build / deployment mới của Clean Rebuild phải bảo đảm tính truy xuất nguồn gốc chính xác:
```text
EXACT SOURCE COMMIT → EXACT BUILD → EXACT DEPLOYMENT
```
- Nghiêm cấm sử dụng bản build từ "dirty worktree" (chưa commit sạch) làm bản chuẩn chính thức cho Clean Rebuild.

### 4.6. Ranh giới Git và Source Code
- Source code Legacy và Clean Rebuild source code phải được tách biệt rõ ràng.
- Giữ nguyên an toàn Git: Không `git force push`, không `git reset`, không `git clean`, không làm mất worktree dirty hiện tại của legacy.

---

## 5. Trạng thái và Quy trình Bảo vệ (Status & Protection)

### 5.1. Các Trạng thái Công việc
- `NOT_STARTED`
- `IN_PROGRESS`
- `READY_FOR_PO_VERIFICATION`
- `PO_VERIFICATION_PENDING`
- `PO_VERIFIED`
- `PASS_TEMPORARY`
- `FAILED`
- `BLOCKED`
- `REGRESSION`
- `UNPROVEN`
- `REPORT_FORMAT_BLOCKED`

### 5.2. Phân biệt Trạng thái (Nghiêm cấm Đánh đồng)
```text
AI PASS ≠ READY_FOR_PO_VERIFICATION ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED
```
- AI PASS chỉ chứng minh code chạy qua kiểm thử tự động của AI.
- Bằng chứng kỹ thuật không thay thế quyết định chính thức của PO.
- Child PASS không tự động nâng Parent thành PASS.

### 5.3. Quy trình Đóng Work Item & Bảo vệ (GOV-025)
Mọi Work Item hoàn tất phải đi qua chuỗi bắt buộc:
```text
PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED
```
- `LOCKED` bảo vệ: Hành vi đã chấp nhận, Quy tắc, Invariant, Acceptance criteria, Bằng chứng (Evidence), Phạm vi đã chấp nhận.
- `LOCKED` không đồng nghĩa với việc khóa cứng file vật lý.
- Khi bắt buộc phải sửa vùng đã `LOCKED`, phải có lệnh `UNLOCK` chính thức từ PO kèm phạm vi giới hạn, lý do, phân tích ảnh hưởng và kế hoạch relock.

---

## 6. Luật Dừng ngay khi có Lỗi (First Failure Stop)

Khi phát hiện bất kỳ lỗi hoặc mâu thuẫn có ý nghĩa nào trong quá trình thực thi:
```text
STOP
→ Thu thập Bằng chứng (Evidence)
→ Phân tích Nguyên nhân gốc (Root Cause)
→ Sửa chữa chính xác đúng phạm vi (Surgical Fix) nếu được phép
→ Retest & Thu thập Bằng chứng mới
→ Lập Báo cáo đúng quy định
```
- Không sử dụng workaround diện rộng để che giấu lỗi.
- Không biến giả định thành lịch sử.
- Thiếu bằng chứng → `UNPROVEN`.
- Nguồn tài liệu mâu thuẫn → `UNRESOLVED` + STOP.

---

## 7. Bảo tồn Lịch sử (History Preservation)

- Lịch sử vận hành (`WORK_ITEM_HISTORY`, `PO_DECISION_REGISTER`, `REGRESSION_LOG`,...) phải được giữ nguyên giá trị forensic.
- Tuyệt đối không xóa, không sửa đè lịch sử quá khứ chỉ để làm hồ sơ đẹp hơn.
- Nếu trạng thái hiện tại khác lịch sử, phải ghi mục bổ sung (`Correction/Addendum`) cho thời điểm hiện tại.

---

## 8. An toàn Git (Git Safety)

Nghiêm cấm các thao tác Git nguy hiểm sau trừ khi có lệnh trực tiếp từ PO:
```text
git reset
git clean
git restore
git checkout (với mục đích xóa thay đổi)
git stash
git rebase
git push --force
```
- Thay đổi dở dang (`DIRTY worktree`) của hệ thống cũ phải được bảo toàn tuyệt đối.

---

## 9. Đồng bộ Hồ sơ khi Đóng Task (LAW-015 — Closure Synchronization)

Sau khi PO xác nhận PASS cho một Work Item, Agent bắt buộc phải kiểm tra và cập nhật đồng bộ các hồ sơ:
- `CHECKPOINTS.md`
- `PO_DECISION_REGISTER.md`
- `CURRENT_STATE.md`
- `TEST_EVIDENCE.md`
- `AI_HANDOFF.md`
- `WORK_ITEM_HISTORY.md`
- `PROTECTION_MAP.md` (nếu có thay đổi bảo vệ)
- `REGRESSION_LOG.md` (chỉ khi có regression thực sự)

Nếu hồ sơ bắt buộc còn chứa trạng thái cũ mâu thuẫn → **CLOSURE INCOMPLETE**.

---

## 10. Cầu nối Quyết định PO (LAW-016 — PO Decision Bridge)

- Mọi quyết định của PO đưa ra trong ChatGPT chỉ là **PO DECISION INPUT**.
- Quyết định chỉ trở thành văn bản vận hành chính thức khi được Codex ghi nhận vào repository.
```text
PO DECISION (trên Chat)
→ CHATGPT TẠO PROMPT COPY-READY
→ PO GỬI CODEX
→ CODEX RECORD VÀO REPOSITORY
→ GOVERNANCE / STATE UPDATED
→ VERIFY DIFF & FINAL REPORT
```
- Nguyên tắc: `CHATGPT CONFIRMATION ≠ REPOSITORY RECORD`. Repository record là bằng chứng chính thức duy nhất.

---

## 11. Tái nhập Phiên làm việc & Thẩm quyền Repository (LAW-017 — Session Reentry)

Mỗi khi bắt đầu session mới, trang chat mới hoặc tiếp nhận lại dự án:
- AI bắt buộc phải READ-FIRST lại toàn bộ bộ quy tắc governance và hồ sơ trạng thái hiện hành từ repository.
- Tuyệt đối không dựa vào trí nhớ AI (Memory) để xác định luật, trạng thái, Work Item hoặc quyết định của PO.
- Nguyên tắc: `REPOSITORY WINS OVER AI MEMORY`.

---

## 12. Báo cáo Kết thúc Prompt (LAW-013 — Final Report)

Mỗi phản hồi kết thúc một Work Item/Prompt bắt buộc phải kết thúc bằng **đúng MỘT fenced code block duy nhất** chứa Final Report theo mẫu quy định tại `00_KIM_CHI_NAM/REPORT_TEMPLATE.md` (hoặc cấu trúc chuẩn được quy định).

---

## 13. Quy trình Cập nhật Luật Governance (PO Freeze Baseline)

Bộ quy tắc này sau khi hoàn tất Work Item này được xem là **BASELINE ĐÃ PHONG TOẢ (FREEZE)**.
Mọi điều chỉnh luật trong tương lai bắt buộc phải tuân theo quy trình nghiêm ngặt:
```text
PO DECISION
→ GOVERNANCE CHANGE PROPOSAL
→ IMPACT REVIEW
→ PO APPROVAL
→ UPDATE REPOSITORY
→ VERIFY DIFF
→ FREEZE AGAIN
```
Nghiêm cấm AI tự ý sửa đổi luật trong quá trình thực hiện các Work Item sản phẩm.

---

## 14. Thứ tự Trách nhiệm

```text
TUẤN / PO
→ Quyết định phạm vi, kiến trúc & nghiệp vụ
→ Kiểm tra thực tế & xác nhận PO PASS / FAIL
→ Cấp thẩm quyền PO_VERIFIED, UNLOCK & Thay đổi luật

CHATGPT
→ Đọc repository, thẩm định phạm vi & evidence
→ Chuẩn bị Prompt copy-ready cho PO
→ Không tự thay PO quyết định

CODEX / CODING AGENT
→ READ-FIRST repository
→ Thực thi đúng scope được giao
→ Thu thập evidence & ghi nhận repository record
→ Lập Final Report đúng mẫu LAW-013
```

---

## 15. Nguyên tắc Cốt lõi Cuối cùng

1. Repository là Nguồn Sự thật duy nhất (`REPOSITORY WINS`).
2. Không dùng Memory thay Repository; không dùng Chat History thay Record.
3. Không dùng Build Success thay cho Functional PASS.
4. Không dùng AI PASS thay cho PO PASS / PO_VERIFIED.
5. Không tự ý sửa đổi vùng đã PROTECTED / LOCKED khi chưa có lệnh UNLOCK của PO.
6. Legacy System bị đóng băng (`FROZEN`); Clean Rebuild tuân thủ `Contract-First` và `Master Spec Gate`.
7. Khi thiếu bằng chứng hoặc phát hiện mâu thuẫn chưa giải quyết → **STOP**.

---

## 16. Governance Enhancements (Prompt-110 to Prompt-114 Baseline)

### 16.1. Work Item ID vs Prompt ID Separation
- **Work Item ID:** Semantic, immutable entity identifier (e.g. `A6`, `A7`, `A8`, `GOV-IDENTITY-CLOSURE-EVIDENCE`).
- **Prompt ID:** Execution record identifier (e.g. `PROMPT-110`, `PROMPT-111`), globally unique, never reused.
- One Prompt has exactly 01 Primary Work Item and 0 or more Affected Work Items.

### 16.2. Prompt ID Uniqueness & Historical Collision
- Prompt IDs are globally unique and never reused.
- Historical collisions (e.g., Prompt 101) are preserved as historical identity ambiguity resolved via reconciliation (Prompt-111/112). Correction/Addendum is the official mechanism.

### 16.3. Standard Prompt Header
Every prompt must declare:
`PROMPT ID`, `WORK ITEM`, `WORK ITEM NAME`, `PRIMARY WORK ITEM`, `AFFECTED WORK ITEMS`, `BUILD MODE`, `OBJECTIVE`, `SCOPE`, `DEPENDENCY`, `PROTECTED SCOPE`, `EVIDENCE NEEDED`, `PO STATUS`, `NEXT`.

### 16.4. Closure Sequence & Regression Check
- Mandatory chain: `PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED`.
- Regression Check is mandatory. For Discovery-only work items, `REGRESSION CHECK = N/A — NO IMPLEMENTATION / NO PROTECTED SCOPE TO REGRESS`.

### 16.5. Discovery vs Implementation Evidence Separation
- **Discovery Evidence:** Requirements, Business Rules, UX/Flow, Dependency, Conflict Check, PO Decision, Repository Traceability. (Cannot claim Code PASS, Build PASS, Deploy PASS).
- **Implementation Evidence:** Source Diff, Test Evidence, Build Identity, Deployment Evidence, Device Evidence, Regression Evidence, PO Verification Evidence.

### 16.6. History Preservation & Append-Only Rule
- Append-only historical preservation via Correction / Addendum. Never delete old records or evidence.

### 16.7. Repository Source of Truth Enforcement
- Repository wins over AI memory. ChatGPT / AI PO decision input $\neq$ official repository record unless recorded via LAW-016.

### 16.8. Multi-Work-Item Rule
- Exactly one primary work item, zero or more affected work items. Affected items do not auto-inherit PASS / PO_VERIFIED / PROTECTED / LOCKED.

---

## 17. AI Working Discipline & Prompt Quality Gate (Prompt-136/137 Baseline)

### 17.1. Repository-First
Before drafting any coordination prompt:
- AI must read the current repository.
- Do not use Memory or Chat History to determine state.
- All states must have repository evidence. `REPOSITORY WINS OVER AI MEMORY`.

### 17.2. No Work Item Guessing
- AI must not guess Work Items from chat history, memory, old prompt names, old NEXT lines, or old roadmaps.
- Determine next Work Item strictly from `CURRENT_STATE`, `CHECKPOINTS`, `WORK_ITEM_HISTORY`, `PROTECTION_MAP`, `AI_HANDOFF`, and Master Specification. If ambiguous, `STOP / UNRESOLVED`.

### 17.3. Authorization Check
- Before drafting implementation prompts, verify Work Item, PO authorization, dependency, protected scope, and out-of-scope boundaries. Distinguish candidate/proposed/ready-for-verification from `PO_VERIFIED`.

### 17.4. Prompt Self-Audit (Pre-Flight)
Before handing a prompt to Codex, AI must audit its own prompt against quality gates (Prompt ID uniqueness, Primary Work Item accuracy, Build Mode, PO authorization existence, scope correctness, zero violation of protected/locked scope, no legacy creep, confirmed dependencies, evidence requirements, regression plan, NEXT status, no unauthorized grant of PO_VERIFIED/PROTECTED/LOCKED, read-back requirement, stale status check, and actual diff inspection). If any check fails, `STOP`.

### 17.5. Zero Stale Status Rule
- Synchronization/closure prompts must demand repository-wide verification of stale statuses (`READY_FOR_PO_VERIFICATION`, `IN_PROGRESS`, `AWAITING PO AUTHORIZATION`, old `NEXT STEP`). Zero unexpected stale status is required.

### 17.6. Next ≠ Authorization
- Strictly distinguish `NEXT WORK ITEM CANDIDATE` from `NEXT AUTHORIZED WORK ITEM`. Only PO grants authorization.

### 17.7. Evidence-First
- Generic statements like "Test PASS", "Security PASS", "Tenant Isolation PASS" are forbidden without explicit test cases, test results, source evidence, and regression proof.

### 17.8. Implementation ≠ Verification
- `APPLICATION CODE CHANGED = YES` does not mean documentation-only, no-implementation, or automatic `PO_VERIFIED`. Implementation PASS leads only to `READY_FOR_PO_VERIFICATION`. PO decides `PO_VERIFIED`.

### 17.9. Close-Out Synchronization
- Every work item after PO verification must synchronize at least `CURRENT_STATE`, `CHECKPOINTS`, `PO_DECISION_REGISTER`, `WORK_ITEM_HISTORY`, `PROTECTION_MAP`, `AI_HANDOFF`, and `TEST_EVIDENCE`.

### 17.10. Clean Rebuild / Legacy Boundary
- Maintain strict separation between Clean Rebuild source code and Legacy source code. Zero inheritance from legacy without PO approval.

### 17.11. Report Format Gate
- Final reports must strictly adhere to LAW-013 and `REPORT_TEMPLATE.md`. Non-compliant reports trigger `REPORT_FORMAT_BLOCKED`.

### 17.12. No Assumption Rule
- Missing evidence = `UNPROVEN`. Conflicts = `CONFLICT / UNRESOLVED`. Do not convert assumptions into repository facts.

### 17.13. ChatGPT Role Boundary
- ChatGPT reads repository, validates logic, detects conflict, checks evidence, and drafts prompts. ChatGPT does NOT self-assign `PO_VERIFIED`, unlock, lock, or decide for PO.

### 17.14. Pre-Flight Checklist Enforcement
- Strict adherence to Pre-Flight checklist before implementation to ensure all prerequisites, security baselines, and test plans are fully validated.

### 17.15. Post-Prompt Review
- Rigorous Post-Prompt Review of repository state, commits, files changed, and evidence after execution.

### 17.16. Principle of Responsibility
- `ĐÚNG > NHANH`. Prioritize correctness and evidence over speed.

### 17.17. Prompt as Technical Instruction (`AI MUST AUDIT ITS OWN PROMPT BEFORE EXECUTION`)
- Every AI prompt is treated as a technical instruction capable of mutating the repository. Therefore, AI must audit its own prompt before execution.



