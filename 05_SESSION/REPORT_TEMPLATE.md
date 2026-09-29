# 10 — MẪU BÁO CÁO CHUẨN — LAW-013

LAW-013 quy định mọi PROMPT đã thực hiện phải kết thúc bằng đúng một fenced code block chứa toàn bộ báo cáo. PO phải có thể COPY một lần. Không đặt report content ngoài block, không chia block và không yêu cầu PO ghép phần. Không thay cấu trúc dưới đây nếu PO chưa cho phép. Nếu định dạng không thể đáp ứng, ghi `STATUS = REPORT_FORMAT_BLOCKED` và không tuyên bố hoàn tất đầy đủ.

```text
===== BEGIN F&B SMART REPORT =====

PROMPT:
[Số hiệu PROMPT]

PHASE:
[Phase hiện tại]

DATE:
[YYYY-MM-DD]

GIT:
- Branch: [Tên branch]
- HEAD: [Mã commit HEAD]
- Worktree: [Clean / Dirty]
- Git Mutation: [NONE / ...]
- Remote Push: [NONE / ... nếu có]

CLEAN REBUILD SOURCE PROVENANCE (PROMPT-146 RULE):
- Official Source Repository: TuanLamVi/fnb-smart-v5-clean-rebuild
- Branch: main
- Source Commit: [Commit SHA or N/A for GOVERNANCE_ONLY]
- Source Root: clean_rebuild_v5/
- Application Files Verified: [List or NONE]
- Governance Files Changed: [List]
- Legacy Touched: NO
- Provenance Verified: YES / NO / GOVERNANCE_ONLY

SCOPE:
[Mô tả phạm vi thực tế đã thực hiện]

CHANGES:
[Liệt kê file thay đổi]

COMPLIANCE SELF-CHECK (LAW-001):
- Documented: YES / NO
- Acknowledged: YES / NO
- Executed: YES / NO
- Verified: YES / NO
- PO Verification Gate: RESPECTED / VIOLATED
- Checkpoint Protection: RESPECTED / VIOLATED
- Single Code Block Format (LAW-013): PASSED / BLOCKED

PO VERIFICATION:
[PENDING / PO_VERIFIED / ...]
AI KHÔNG được tự ghi PO_VERIFIED nếu PO chưa xác nhận.

CHECKPOINT:
[Checkpoint hiện tại / NONE]

BLOCKER:
[NONE / mô tả blocker]

REGRESSION:
[NONE / mô tả regression]

EVIDENCE:
[Dữ liệu thực tế, Git status, test log, file evidence, hoặc bằng chứng liên quan]

BUILD:
- Baseline: A0-BUILD-001
- Flutter:
- Dart:
- Java:
- Gradle:
- AGP:
- Kotlin:
- Firebase Project:
- Environment:
- Build Command:
- Build Result:
- APK:
- APK Identity:
- Install:
- Device:
[If no build: NOT EXECUTED — OUT OF SCOPE]
VERDICT:
[GOVERNANCE_RULES_UPDATED / READY_FOR_PO_REVIEW / PASS / BLOCKED / UNRESOLVED]

NEXT:
[Bước tiếp theo được phép thực hiện]

===== END F&B SMART REPORT =====
```