# KIM CHỈ NAM CẢI TẠO F&B SMART — OPERATIONAL RULEBOOK

## 1. Mục tiêu

Cải tạo trên nền dự án hiện tại: giữ phần đúng, sửa phần sai, hoàn thiện phần thiếu, chỉ thay thế khi có evidence. Không rewrite toàn bộ ứng dụng.

## 2. Nguồn và thứ tự đọc

```text
00_KIM_CHI_NAM_REHABILITATION.md
→ tài liệu nghiệp vụ gốc theo phạm vi
→ ROADMAP / CURRENT_STATE / CHECKPOINTS
→ TEST_EVIDENCE / DECISION_LOG / CHANGE_LOG / AI_HANDOFF
→ mã nguồn liên quan
```

`governance_v2/*` hiện **DRAFT — NOT YET ADOPTED** và không thay thế luật hiện hành.

## 3. Roadmap

```text
A0 → A1 → A2 → A3 → A4 → A5 → A6 → A7 → A8 → A9 → A10 → A11
```

Child PASS không làm parent PASS.

## 4. Work Item

Mọi task phải xác định:

```text
WORK ITEM
OBJECTIVE
SCOPE
PROTECTED SCOPE
EVIDENCE
PO STATUS
NEXT
```

Không scope creep, không đoán.

## 5. GOV-025

```text
PASS
→ PO_VERIFIED
→ REGRESSION CHECK
→ PROTECTED
→ LOCKED
```

Bảo vệ hành vi, quy tắc, invariant, acceptance criteria, evidence và phạm vi đã chấp nhận; không khóa cứng file.

Trước task mới:

```text
CURRENT A-STAGE
TASK
RELATED A-STAGES
LOCKED SCOPE IMPACT
```

`DETECTED` → `REGRESSION_REQUIRED`.
`UNKNOWN` chưa giải quyết được → `REGRESSION_RISK` + STOP.

Chỉ PO được UNLOCK.

## 6. LAW-015 — CLOSURE SYNCHRONIZATION

Sau PO PASS, Agent phải kiểm tra/cập nhật đồng bộ:

```text
CHECKPOINTS
DECISION_LOG
CURRENT_STATE
TEST_EVIDENCE
CHANGE_LOG
AI_HANDOFF
```

Cập nhật có điều kiện:

```text
ROADMAP          → khi tiến độ child/parent thay đổi
PROJECT_JOURNAL  → nếu journal đang dùng để truy xuất lịch sử
REGRESSION_LOG   → chỉ khi có regression thật
KNOWN_ISSUES     → khi issue được tạo/giải quyết/thay đổi
```

Nếu hồ sơ bắt buộc còn trạng thái cũ mâu thuẫn với kết quả mới → **Closure chưa hoàn tất**.

## 7. PO Verification

Chỉ Tuấn được xác nhận `PO_VERIFIED`. Agent chỉ báo `READY_FOR_PO_VERIFICATION` khi PO chưa test.

## 8. First Failure Stop

```text
STOP
→ Evidence
→ Root Cause
→ Surgical Fix nếu được phép
```

## 9. Git Safety

Không tự ý `reset`, `clean`, `restore`, `checkout` để xóa thay đổi, `stash`, `rebase`, `commit`, `push`. Working tree DIRTY phải được bảo toàn.

## 10. Build

Luôn đọc `docs/rehabilitation/BUILD_BASELINE.md` trước khi build. Không tự đổi toolchain.

## 11. Report

LAW-013: mỗi Prompt kết thúc bằng **đúng một fenced code block duy nhất** chứa toàn bộ Final Report.

## 12. Phiên AI mới

Không dựa vào chat history. Phải đọc tài liệu có quyền truy cập; nếu không đủ nguồn sự thật → `UNPROVEN/BLOCKED` + STOP.

## 13. LAW-016 — PO Decision Bridge & Repository Recording

Mọi quyết định của PO trong ChatGPT phải được Codex ghi nhận chính thức vào repository governance theo luật `LAW-016` định nghĩa tại `00_KIM_CHI_NAM_REHABILITATION.md`. Xác nhận trong ChatGPT không thay thế repository record.

## 14. LAW-017 — Session Reentry & No-Memory Authority

Mỗi khi bắt đầu session mới, trang chat mới hoặc tiếp nhận lại project, AI phải đọc lại toàn bộ bộ tài liệu governance từ repository theo luật `LAW-017` định nghĩa tại `00_KIM_CHI_NAM_REHABILITATION.md`. Trí nhớ của AI/ChatGPT không phải là authority; repository wins.
