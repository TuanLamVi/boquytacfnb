# KIM CHỈ NAM — F&B SMART V5
# QUẢN TRỊ CẢI TẠO VÀ PHỤC HỒI

> **BẢN ÁP DỤNG CHÍNH:** Đây là bộ luật quản trị cho quy trình cải tạo/phục hồi F&B SMART.
> Không thay thế nội dung chuyên môn của Product Charter, Database Schema, State Machines hoặc Query Cost Budget.
>
> **GOVERNANCE V2:** Các file `governance_v2/*` trong bộ nguồn được ghi rõ là **DRAFT — NOT YET ADOPTED** và không tự động thay thế bộ luật hiện hành.

## 1. Thẩm quyền

- **PO / Chủ đầu tư:** Tuấn.
- AI/Coding Agent chỉ làm trong phạm vi PO giao.
- Chỉ PO được xác nhận `PO_VERIFIED`, cho phép `UNLOCK`, và quyết định thay đổi luật/nghiệp vụ.

## 2. Nguồn sự thật

### 2.1. Quản trị

Bộ KIM CHỈ NAM quyết định:
- quyền hạn;
- trạng thái;
- PO verification;
- checkpoint/protection;
- First Failure Stop;
- Git Safety;
- Work Item closure;
- AI handoff;
- PO Decision Bridge;
- Session Reentry.

### 2.2. Chuyên môn

Theo đúng phạm vi, bốn tài liệu là nguồn chính thức về nghiệp vụ/kỹ thuật:

1. `docs/PRODUCT_CHARTER_V5.1.md`
2. `docs/DATABASE_SCHEMA_V0.1.md`
3. `docs/STATE_MACHINES_V0.1.md`
4. `docs/FIRESTORE_QUERY_COST_BUDGET_V0.1.md`

Governance điều chỉnh quy trình quản lý; không tự ý sửa/ghi đè các hợp đồng chuyên môn.

### 2.3. Vận hành

Các hồ sơ vận hành gồm:
- ROADMAP
- CURRENT_STATE
- CHECKPOINTS
- TEST_EVIDENCE
- DECISION_LOG
- CHANGE_LOG
- REGRESSION_LOG
- KNOWN_ISSUES
- AI_HANDOFF
- BUILD_BASELINE
- WORK_ITEM_HISTORY / PROJECT_JOURNAL khi được chỉ định làm lịch sử

## 3. Luật nền

- Cải tạo trên nền dự án hiện tại: giữ phần đúng, sửa phần sai, hoàn thiện phần thiếu; chỉ thay thế khi có evidence phù hợp.
- Không rewrite toàn bộ ứng dụng.
- Không scope creep.
- Không suy đoán.
- AI PASS không thay PO PASS.
- Không tự sửa phần đã bảo vệ.
- Không xóa hoặc viết lại lịch sử.
- First Failure → STOP.
- Không tự tạo trạng thái mới.

## 4. Trạng thái

Các trạng thái được dùng:

`NOT_STARTED`
`IN_PROGRESS`
`READY_FOR_PO_VERIFICATION`
`PO_VERIFICATION_PENDING`
`PO_VERIFIED`
`PASS_TEMPORARY`
`FAILED`
`BLOCKED`
`REGRESSION`
`UNPROVEN`
`REPORT_FORMAT_BLOCKED`

Lớp bảo vệ:

`PROTECTED`
`LOCKED`

Các trạng thái này không đồng nghĩa với nhau.

Đặc biệt:

`AI PASS` ≠ `READY_FOR_PO_VERIFICATION` ≠ `PO PASS` ≠ `PO_VERIFIED` ≠ `LOCKED`

Bằng chứng không thay quyết định của PO.

## 5. GOV-025 — Work Item Closure

Chuỗi đóng Work Item:

```
PASS
→ PO_VERIFIED
→ REGRESSION CHECK
→ PROTECTED
→ LOCKED
```

`LOCKED` bảo vệ:
- hành vi đã chấp nhận;
- quy tắc;
- invariant;
- acceptance criteria;
- evidence;
- phạm vi đã chấp nhận.

`LOCKED` **không có nghĩa là khóa cứng file**.

Trước Work Item mới phải kiểm tra:

```
CURRENT A-STAGE
TASK
RELATED A-STAGES
LOCKED SCOPE IMPACT
```

Kết quả:
- `NONE`: có evidence không ảnh hưởng vùng bảo vệ.
- `DETECTED`: `REGRESSION_REQUIRED`.
- `UNKNOWN`: chưa đủ thông tin → `REGRESSION_RISK` + STOP.

Chỉ PO được `UNLOCK`. Khi mở khóa phải có lý do, phạm vi, ảnh hưởng, kiểm tra hồi quy, PO test và đóng bảo vệ lại khi hoàn tất.

## 6. LAW-015 — Closure Synchronization

Sau khi PO xác nhận PASS, Agent phải kiểm tra/cập nhật đồng bộ:

```
CHECKPOINTS
DECISION_LOG
CURRENT_STATE
TEST_EVIDENCE
CHANGE_LOG
AI_HANDOFF
```

Cập nhật có điều kiện:

```
ROADMAP          → khi tiến độ child/parent thay đổi
PROJECT_JOURNAL  → nếu journal đang dùng để truy xuất lịch sử
REGRESSION_LOG   → chỉ khi có regression thật
KNOWN_ISSUES     → khi issue được tạo/giải quyết/thay đổi
```

Nếu hồ sơ bắt buộc còn trạng thái cũ mâu thuẫn với kết quả mới → **CLOSURE INCOMPLETE**.

Không tạo Registry/Log thứ hai khi hệ thống hiện hữu đã có.

## 7. PO Verification

- Chỉ Tuấn được xác nhận `PO_VERIFIED`.
- Agent/AI chỉ được báo `READY_FOR_PO_VERIFICATION` khi hồ sơ đủ để PO kiểm tra.
- Agent không tự biến AI PASS thành PO PASS.
- Agent không tự ghi `PO_VERIFIED` nếu PO chưa xác nhận trực tiếp và chưa có lệnh ghi nhận hợp lệ.
- Checkpoint chỉ được `LOCKED` sau `PO_VERIFIED` hợp lệ và đủ hồ sơ bảo vệ.

## 8. First Failure Stop

Khi phát hiện lỗi có ý nghĩa:

```
STOP
→ Evidence
→ Root Cause
→ Surgical Fix nếu được phép
→ Test / Evidence
→ Report
```

Không workaround rộng để che lỗi. Không biến giả định thành lịch sử.

Thiếu evidence → `UNPROVEN`.

Nguồn mâu thuẫn → `UNRESOLVED`.

## 9. History Preservation

Historical record phải được giữ nguyên.

Nếu current status khác lịch sử:
- ghi Current Correction/Addendum;
- không sửa historical evidence chỉ để làm hồ sơ đẹp hơn;
- không xóa duplicate checkpoint/record lịch sử chỉ vì có bản mới hơn.

## 10. Git Safety

Không tự ý dùng để phá hoặc che thay đổi:

```
git reset
git clean
git restore
git checkout để xóa thay đổi
git stash
git rebase
```

Đồng thời, không tự ý commit/push khi prompt hoặc quyền hạn hiện tại không cho phép.

Working tree `DIRTY` phải được bảo toàn và phân biệt với thay đổi do Work Item mới tạo.

## 11. Build / Device

- Đọc `BUILD_BASELINE.md` trước khi build.
- Agent chỉ build/cài khi Prompt cho phép.
- Production/release/deploy không được tự suy ra từ build task.
- Build/install fail → STOP và báo evidence.
- Build SUCCESS chỉ chứng minh việc build; không chứng minh chức năng hoặc PO PASS.
- PO trực tiếp kiểm tra UI/nghiệp vụ và quyết định PASS/FAIL.

## 12. LAW-013 — Final Report

Mỗi Prompt phải kết thúc bằng **đúng một fenced code block duy nhất** chứa toàn bộ Final Report.

Không:
- chia report thành nhiều code block;
- yêu cầu PO ghép nhiều phần;
- ghi PASS/VERIFIED/PO_VERIFIED/LOCKED khi chưa đủ evidence/thẩm quyền.

Mẫu chính thức nằm tại:

`00_KIM_CHI_NAM/REPORT_TEMPLATE.md`

## 13. LAW-016 — PO Decision Bridge & Repository Recording

Mọi quyết định, xác nhận, chỉ định hoặc thay đổi phạm vi do PO đưa ra trong ChatGPT chỉ trở thành quyết định vận hành chính thức của repository sau khi được ghi nhận vào repository theo quy trình.

Xác nhận của PO trong ChatGPT là **PO DECISION INPUT**; không tự động là repository evidence.

### FLOW A — PO nói trực tiếp với Coding Agent

```
PO DECISION
→ CODEX RECORD
→ GOVERNANCE UPDATED
→ VERIFY DIFF
→ FINAL REPORT
```

### FLOW B — PO nói với ChatGPT trước

```
PO DECISION
→ CHATGPT TẠO PROMPT COPY-READY
→ PO GỬI CODEX
→ CODEX RECORD
→ GOVERNANCE UPDATED
→ VERIFY DIFF
→ FINAL REPORT
```

Không tự suy diễn:
- chưa có repository record → chưa coi task đã ASSIGNED;
- chưa coi task đã bắt đầu;
- chưa coi PASS;
- chưa coi PO_VERIFIED;
- chưa coi PROTECTED;
- chưa coi LOCKED.

Quy tắc cốt lõi:

`CHATGPT CONFIRMATION ≠ REPOSITORY RECORD`

`CODEX REPOSITORY RECORD = OFFICIAL EXECUTION EVIDENCE`

## 14. LAW-017 — Session Reentry & No-Memory Authority

Mỗi khi bắt đầu:
- session mới;
- trang chat mới;
- phiên tiếp nhận project;
- phiên recovery sau gián đoạn;

AI/Coding Agent phải đọc lại governance hiện hành từ repository.

Không được dựa vào memory để xác định:
- luật;
- trạng thái;
- Work Item;
- PO decision;
- PO_VERIFIED;
- PROTECTED;
- LOCKED;
- NEXT WORK ITEM.

### Repository wins

```
REPOSITORY GOVERNANCE
>
AI MEMORY
```

Nếu memory khác repository:
- repository được ưu tiên;
- báo mâu thuẫn;
- không sửa lịch sử chỉ để làm cho memory khớp.

### Read-First tối thiểu

```
KIM_CHI_NAM
→ SOURCE_OF_TRUTH
→ CURRENT_STATE
→ CHECKPOINTS
→ DECISION_LOG
→ AI_HANDOFF
→ tài liệu kỹ thuật liên quan
→ LOCKED SCOPE IMPACT
```

Nếu tài liệu bắt buộc:
- không truy cập được;
- không tồn tại;
- đọc không đủ;
- không đủ để xác định trạng thái;

→ `UNPROVEN / BLOCKED`
→ STOP.

### Mục tiêu LAW-017

`Đổi trang chat ≠ đổi luật`

`Đổi AI ≠ mất trạng thái`

`Mất chat history ≠ mất quyết định PO`

Project phải đủ thông tin để một AI mới có thể tiếp quản đúng mà không cần biết cuộc trò chuyện trước đó.

## 15. Roadmap và Work Item

Roadmap hiện hành dùng:

```
A0 → A1 → A2 → A3 → A4 → A5 → A6 → A7 → A8 → A9 → A10 → A11
```

Child PASS không tự làm parent PASS.

Mỗi Work Item phải xác định tối thiểu:

```
WORK ITEM
OBJECTIVE
SCOPE
PROTECTED SCOPE
EVIDENCE
PO STATUS
NEXT
```

Không scope creep. Không đoán crosswalk ID giữa các hệ thống cũ và mới.

## 16. Thứ tự trách nhiệm

```
TUẤN / PO
→ quyết định
→ kiểm tra thực tế nghiệp vụ
→ PO PASS / FAIL
→ PO_VERIFIED / UNLOCK / thay đổi luật khi cần

CHATGPT
→ đọc repository
→ thẩm định phạm vi/evidence
→ xác định thiếu gì
→ chuẩn bị prompt copy-ready khi PO đi qua ChatGPT
→ không thay PO quyết định

CODEX / CODING AGENT
→ READ-FIRST
→ thực thi đúng scope
→ tạo evidence
→ ghi repository record theo quyền
→ báo cáo đúng mẫu
```

## 17. Nguyên tắc cuối cùng

- Không lấy tên file để quyết định nguồn chuẩn.
- Không dùng chat history để thay repository.
- Không dùng memory để thay evidence.
- Không dùng build success để thay functional test.
- Không dùng AI PASS để thay PO PASS.
- Không dùng child PASS để tuyên bố parent PASS.
- Không sửa vùng PROTECTED/LOCKED khi chưa có cơ chế mở khóa hợp lệ.
- Khi không đủ bằng chứng hoặc có xung đột chưa giải quyết → STOP.
