# 00 — KIM CHỈ NAM QUẢN TRỊ CẢI TẠO VÀ PHỤC HỒI F&B SMART

> **Luật quản trị cao nhất về quy trình** cải tạo/phục hồi. Không thay thế nội dung chuyên môn của Product Charter, Database Schema, State Machines hoặc Query Cost Budget.

## 1. Thẩm quyền

- **PO/Chủ đầu tư:** Tuấn.
- AI/Coding Agent chỉ làm trong phạm vi PO giao.
- Chỉ PO được xác nhận `PO_VERIFIED`, cho phép `UNLOCK`, và quyết định thay đổi luật/nghiệp vụ.

## 2. Nguồn sự thật

### Quản trị

Tài liệu này quyết định:
- quyền hạn;
- trạng thái;
- PO verification;
- checkpoint/protection;
- First Failure Stop;
- Git Safety;
- Work Item closure;
- AI handoff.

### Chuyên môn

Theo đúng phạm vi, bốn tài liệu sau là nguồn chính thức về nghiệp vụ/kỹ thuật:

1. `docs/PRODUCT_CHARTER_V5.1.md`
2. `docs/DATABASE_SCHEMA_V0.1.md`
3. `docs/STATE_MACHINES_V0.1.md`
4. `docs/FIRESTORE_QUERY_COST_BUDGET_V0.1.md`

Không dùng tài liệu quản trị để tự ý thay đổi các hợp đồng chuyên môn trên.

### Vận hành

```text
KIM_CHI_NAM_CAI_TAO_FNB_SMART.md
ROADMAP
CURRENT_STATE
CHECKPOINTS
TEST_EVIDENCE
DECISION_LOG
CHANGE_LOG
REGRESSION_LOG
KNOWN_ISSUES
AI_HANDOFF
BUILD_BASELINE
```

`governance_v2/*` = **DRAFT — NOT YET ADOPTED** trừ khi PO ban hành quyết định adoption riêng.

## 3. Luật nền

- Không rewrite toàn bộ ứng dụng.
- Không scope creep.
- Không suy đoán.
- AI PASS không thay PO PASS.
- Không tự sửa phần đã bảo vệ.
- Không xóa/viết lại lịch sử.
- First Failure → STOP.

## 4. Trạng thái

`NOT_STARTED`, `IN_PROGRESS`, `READY_FOR_PO_VERIFICATION`, `PO_VERIFICATION_PENDING`, `PO_VERIFIED`, `PASS_TEMPORARY`, `FAILED`, `BLOCKED`, `REGRESSION`, `UNPROVEN`, `REPORT_FORMAT_BLOCKED`.

Lớp bảo vệ: `PROTECTED`, `LOCKED`.

Không tự tạo trạng thái mới.

## 5. GOV-025 — Work Item Closure

```text
PASS
→ PO_VERIFIED
→ REGRESSION CHECK
→ PROTECTED
→ LOCKED
```

`LOCKED` bảo vệ hành vi/invariant/criteria/evidence/scope đã chấp nhận; **không khóa cứng file**.

Trước task mới:

```text
CURRENT A-STAGE
TASK
RELATED A-STAGES
LOCKED SCOPE IMPACT
```

- `NONE`: có evidence không ảnh hưởng.
- `DETECTED`: `REGRESSION_REQUIRED`.
- `UNKNOWN`: read-only; chưa rõ → `REGRESSION_RISK` + STOP.

Chỉ PO UNLOCK và phải có hồ sơ lý do/phạm vi/ảnh hưởng/regression/PO test/re-lock.

## 6. LAW-015 — Closure Synchronization

Sau khi PO xác nhận PASS, Agent bắt buộc **kiểm tra/cập nhật**:

```text
CHECKPOINTS
DECISION_LOG
CURRENT_STATE
TEST_EVIDENCE
CHANGE_LOG
AI_HANDOFF
```

Cập nhật theo điều kiện:

```text
ROADMAP          → nếu tiến độ thay đổi
PROJECT_JOURNAL  → nếu đang dùng làm historical index
REGRESSION_LOG   → chỉ khi có regression thật
KNOWN_ISSUES     → nếu issue thay đổi trạng thái
```

### Closure Complete

Một Work Item chưa được coi là đóng hoàn toàn nếu các hồ sơ hiện hành bắt buộc vẫn chứa trạng thái cũ mâu thuẫn.

Ví dụ:

```text
CHECKPOINTS   = LOCKED
DECISION_LOG  = PO_VERIFIED
CURRENT_STATE = WAITING PO-TEST
AI_HANDOFF    = WAITING PO-TEST
```

→ **CLOSURE INCOMPLETE**.

Không tạo Registry/Log thứ hai nếu hệ thống hiện hữu đã có.

## 7. History Preservation

Historical record giữ nguyên. Nếu current status khác lịch sử, ghi Current Correction/Addendum; không sửa historical evidence để làm đẹp hồ sơ.

## 8. First Failure Stop

```text
STOP
→ Evidence
→ Root Cause
→ Surgical Fix nếu được phép
```

## 9. Git Safety

Không tự ý:

```text
git reset
git clean
git restore
git checkout để xóa thay đổi
git stash
git rebase
git commit
git push
```

Working tree DIRTY phải được bảo toàn.

## 10. Build / Device

- Đọc `BUILD_BASELINE.md` trước build.
- Agent build/cài APK khi Prompt cho phép.
- PO không phải tự tìm/đoán APK.
- Build/install fail → STOP và báo evidence.

## 11. LAW-013

Mỗi Prompt phải kết thúc bằng **đúng một fenced code block duy nhất** chứa toàn bộ Final Report. Không có phần report quan trọng bên ngoài block.

## 12. AI Session mới

AI mới phải đọc:

```text
00_KIM_CHI_NAM_REHABILITATION.md
KIM_CHI_NAM_CAI_TAO_FNB_SMART.md
02_CURRENT_STATE.md
03_CHECKPOINTS.md
05_DECISION_LOG.md
09_AI_HANDOFF.md
```

Nếu nguồn không truy cập được hoặc chưa đủ → `UNPROVEN/BLOCKED` + STOP. Không tuyên bố đã đọc repository nếu chưa thực sự truy cập được.

## 13. LAW-016 — PO DECISION BRIDGE & REPOSITORY RECORDING

### 1. Nguyên tắc

Mọi quyết định, xác nhận, chỉ định hoặc thay đổi phạm vi do PO đưa ra trong một phiên làm việc chỉ được coi là quyết định vận hành chính thức của repository sau khi Coding Agent/Codex/gemini ghi nhận quyết định đó vào các tài liệu governance phù hợp trong repository.

Xác nhận của PO trong ChatGPT là PO DECISION INPUT. Nó không tự động là repository evidence.

### 2. Hai đường hợp lệ

**FLOW A — PO nói trực tiếp với Codex:**
PO gửi trực tiếp cho Codex quyết định chính thức.
Codex phải: `PO RECORD` → `UPDATE GOVERNANCE` → `VERIFY DIFF` → `FINAL REPORT`.

**FLOW B — PO nói với ChatGPT trước:**
PO đưa quyết định cho ChatGPT.
ChatGPT phải chuyển quyết định thành prompt copy-ready để PO gửi cho Codex.
Codex phải: `PO RECORD` → `UPDATE GOVERNANCE` → `VERIFY DIFF` → `FINAL REPORT`.

### 3. Không tự suy diễn

Nếu PO mới chỉ xác nhận trong ChatGPT:
- chưa coi Work Item đã được ASSIGNED trong repository;
- chưa coi task đã bắt đầu;
- chưa coi PASS;
- chưa coi PO_VERIFIED;
- chưa coi PROTECTED;
- chưa coi LOCKED.

Chỉ sau khi Codex ghi nhận vào repository mới có repository evidence.

### 4. Evidence bắt buộc

Mỗi PO Decision được ghi nhận phải xác định tối thiểu:
- quyết định chính xác của PO;
- ngày;
- Work Item hoặc đối tượng liên quan;
- tài liệu được cập nhật;
- evidence cho thấy Codex đã cập nhật repository.

### 5. Quy tắc giao tiếp

Khi PO đưa ra quyết định trong ChatGPT, ChatGPT phải làm một trong hai việc:
A. Chỉ rõ rằng PO có thể gửi quyết định trực tiếp cho Codex.
HOẶC
B. Tạo prompt copy-ready để PO gửi cho Codex.
Không được trộn hai đường xử lý.

### 6. Completion

PO Decision Bridge chỉ hoàn tất khi:
`PO DECISION` → `CODEX RECORD` → `GOVERNANCE UPDATED` → `DIFF VERIFIED` → `FINAL REPORT`.

### 7. Không đánh đồng ChatGPT với Repository

`CHATGPT CONFIRMATION ≠ REPOSITORY RECORD`
`CODEX REPOSITORY RECORD = OFFICIAL EXECUTION EVIDENCE`

## 14. LAW-017 — SESSION REENTRY & NO-MEMORY AUTHORITY

### 1. Nguyên tắc

Mỗi khi AI/Coding Agent bắt đầu:
- session mới;
- trang chat mới;
- phiên tiếp nhận project;
- phiên recovery sau gián đoạn;

AI/Coding Agent phải đọc lại governance hiện hành từ repository.

Không được dựa vào trí nhớ của session trước để xác định:
- luật;
- trạng thái;
- Work Item;
- PO decision;
- PO_VERIFIED;
- PROTECTED;
- LOCKED;
- NEXT WORK ITEM.

### 2. Nguồn sự thật

Repository là nguồn chính thức.

Memory của AI/ChatGPT/Codex chỉ là hỗ trợ, không phải authority.

Quy tắc:

REPOSITORY GOVERNANCE
>
AI MEMORY

### 3. Read-First bắt buộc

Mỗi session mới phải đọc tối thiểu:

1. 00_KIM_CHI_NAM_REHABILITATION.md
2. KIM_CHI_NAM_CAI_TAO_FNB_SMART.md
3. 02_CURRENT_STATE.md
4. 03_CHECKPOINTS.md
5. 05_DECISION_LOG.md
6. 09_AI_HANDOFF.md

Sau đó mới được thực hiện Work Item.

### 4. Nếu không đọc được

Nếu một hoặc nhiều tài liệu bắt buộc:
- không truy cập được;
- không tồn tại;
- không đọc đủ;
- nội dung không đủ để xác định trạng thái;

→ UNPROVEN / BLOCKED
→ STOP

Không được suy đoán từ memory hoặc lịch sử chat.

### 5. PO Decision

Nếu PO đưa ra quyết định trong ChatGPT:

PO decision
→ ChatGPT tạo prompt copy-ready
→ PO gửi cho Codex
→ Codex ghi vào repository
→ VERIFY DIFF
→ FINAL REPORT

Nếu PO nói trực tiếp với Codex:

PO decision
→ Codex ghi vào repository
→ VERIFY DIFF
→ FINAL REPORT

ChatGPT không được tuyên bố repository đã ghi nhận quyết định
nếu chưa có Codex evidence.

### 6. Session Reentry

Khi AI mới tiếp quản project:

READ-FIRST
→ RECOVER CURRENT STATE
→ RECOVER CHECKPOINTS
→ RECOVER PO DECISIONS
→ RECOVER AI HANDOFF
→ CHECK LOCKED SCOPE
→ CHỈ SAU ĐÓ mới được làm Work Item.

Không được tự nối tiếp công việc chỉ dựa trên:
- tên Work Item;
- memory;
- câu chuyện chat cũ;
- suy đoán từ commit cũ.

### 7. Quy tắc bảo vệ

Nếu memory của AI khác với repository:

REPOSITORY WINS

AI phải báo cáo mâu thuẫn và dựa vào evidence hiện hành.

Không tự sửa lịch sử để làm cho memory khớp repository.

### 8. Mục tiêu của luật

Mục tiêu là:

Đổi trang chat
≠
đổi luật.

Đổi AI
≠
mất trạng thái.

Mất chat history
≠
mất quyết định PO.

Project phải đủ thông tin để một AI mới có thể tiếp quản đúng
mà không cần biết nội dung cuộc trò chuyện trước đó.
