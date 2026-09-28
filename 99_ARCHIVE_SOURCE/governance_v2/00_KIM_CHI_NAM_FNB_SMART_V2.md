STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# KIM CHỈ NAM F&B SMART V2

## Thuật ngữ
PO (Product Owner/chủ đầu tư) là Tuấn. Adoption là quyết định chính thức đưa bộ tài liệu vào áp dụng. Checkpoint là mốc ghi nhận việc PO chấp nhận một phạm vi và dùng để bảo vệ phạm vi đó.
AI PASS là kết quả kỹ thuật do Coding Agent báo; READY_FOR_PO_VERIFICATION là ChatGPT xác nhận đủ hồ sơ để PO kiểm tra; PO PASS là quyết định PASS do PO trực tiếp đưa ra; PO_VERIFIED là hồ sơ ghi quyết định đó sau lệnh riêng; LOCKED là checkpoint đã ghi nhận và khóa bảo vệ.
UNPROVEN nghĩa là chưa đủ bằng chứng; UNRESOLVED là các claim/nguồn còn mâu thuẫn; REGRESSION là lỗi hồi quy của chức năng đã từng được chấp nhận; FIRST FAILURE STOP là dừng công việc bị ảnh hưởng khi xuất hiện lỗi có ý nghĩa.

## 1. Mục đích và hiệu lực
Đây là đề xuất quản trị độc lập, chỉ dùng để PO xem xét. Tài liệu không thay thế hoặc sửa tài liệu hiện hữu. V2 chỉ có thể được áp dụng sau khi PO phê duyệt và có quyết định adoption riêng; sửa dự thảo không phải adoption.
CURRENT PO DIRECTION (C03): continue rehabilitation of the existing F&B SMART project. Do not switch repository/project/architecture/platform/Firebase without a new PO decision. This records the current track and does not amend the G0 Product Charter; preserve the contract wording and report any future action that would require changing its scope.

## 2. Vai trò, bằng chứng và cổng ba bên
AI PASS là kết quả kiểm tra kỹ thuật do Coding Agent thực hiện, kèm bằng chứng; chưa phải đánh giá độc lập.
ChatGPT thẩm định phạm vi, bằng chứng, tiêu chí và tuân thủ. Chỉ ChatGPT xác nhận hồ sơ đủ điều kiện chuyển READY_FOR_PO_VERIFICATION. ChatGPT không kiểm tra thay PO, không quyết định PO PASS/FAIL và không ghi PO_VERIFIED.
PO Tuấn trực tiếp kiểm tra thực tế và là người duy nhất quyết định PO PASS hoặc PO FAIL.
READY_FOR_PO_VERIFICATION nghĩa là hồ sơ đủ để PO kiểm tra, không khẳng định PO đã kiểm tra hoặc chấp nhận.
PO PASS chưa cho phép Agent tự ghi PO_VERIFIED. Cần lệnh ghi nhận riêng, trực tiếp, rõ CHECKPOINT-ID và phạm vi. Thiếu lệnh thì không ghi PO_VERIFIED, không LOCKED.
Lệnh ghi nhận chuẩn:
GHI NHẬN PO_VERIFIED:
[CHECKPOINT-ID]
PO đã trực tiếp kiểm tra và xác nhận PASS.
Ghi nhận vào hồ sơ dự án.
Agent chỉ ghi khi có bằng chứng PO PASS trực tiếp cho đúng phạm vi và lệnh ghi nhận riêng hợp lệ. Agent ghi theo lệnh, không tạo quyết định. Lệnh thiếu ID/phạm vi hoặc thiếu bằng chứng thì dừng, báo UNPROVEN.
Quy trình:
Coding Agent thực hiện
→ Agent báo AI PASS và bằng chứng
→ ChatGPT thẩm định phạm vi, bằng chứng và quy tắc
→ ChatGPT xác nhận READY_FOR_PO_VERIFICATION hoặc nêu phần thiếu
→ PO kiểm tra thực tế và quyết định PASS/FAIL
→ nếu PASS, PO gửi lệnh ghi nhận riêng
→ Agent ghi PO_VERIFIED vào hồ sơ hiện hữu
→ checkpoint chỉ LOCKED sau PO_VERIFIED hợp lệ và khi đủ hồ sơ bảo vệ.
AI PASS ≠ READY_FOR_PO_VERIFICATION ≠ PO PASS ≠ PO_VERIFIED ≠ LOCKED.
Bằng chứng không thay quyết định. ChatGPT READY không phải PO PASS. PASS ở ngữ cảnh khác hoặc suy luận của Agent không phải lệnh ghi nhận.

## 3. Tầng tài liệu
Bốn hợp đồng G0 — PRODUCT_CHARTER_V5.1, DATABASE_SCHEMA_V0.1, STATE_MACHINES_V0.1 và FIRESTORE_QUERY_COST_BUDGET_V0.1 — áp dụng trong lĩnh vực riêng. Governance điều chỉnh quy trình, không sửa/override hợp đồng. V2 dự thảo không override hợp đồng hoặc quyết định PO.
Hồ sơ, audit, snapshot và baseline chỉ có vai trò/phạm vi đã nêu. Audit là đánh giá tại thời điểm, không tự cập nhật trạng thái.

## 4. Checkpoint và hồi quy
Chỉ ghi PO_VERIFIED sau PO PASS trực tiếp cho phạm vi xác định và lệnh ghi nhận riêng theo Mục 2. Ghi ID, phạm vi, ngày, bằng chứng, nguồn PO, branch/HEAD nếu có, vùng bảo vệ, giới hạn và điều kiện hồi quy. Registry ghi lại, không cấp thẩm quyền.
Chỉ ghi LOCKED sau PO_VERIFIED hợp lệ và khi đủ thông tin vùng bảo vệ. Không tự khóa, mở khóa, hạ trạng thái, xóa hoặc viết lại checkpoint đã khóa. Trước thay đổi phải kiểm tra tác động. Khi nghi hồi quy: FIRST FAILURE STOP, giữ bằng chứng, báo cáo và chờ authorization phù hợp.

## 5. Dừng lỗi đầu tiên và giới hạn phạm vi
Làm đúng phạm vi prompt. Khi có lỗi có ý nghĩa, dừng chuỗi bị ảnh hưởng, giữ bằng chứng, cô lập và báo cáo; không workaround rộng hoặc che giấu. Không đoán/biến giả định thành lịch sử. Thiếu bằng chứng ghi UNPROVEN; nguồn mâu thuẫn ghi UNRESOLVED.

## 6. An toàn Git và thay đổi
Ghi git status --short trước/sau, phân biệt dirty state có sẵn. Không phá thay đổi người dùng. Không commit, push, reset, clean, restore, checkout, rebase hoặc stash nếu PO chưa cho phép rõ. Không sửa code, Firebase, dữ liệu, test, build config hoặc thiết bị ngoài phạm vi được phép.

## 7. Nhật ký và tiếp nối phiên
Hồ sơ dự án là bộ nhớ vận hành; chat không thay thế. Khi có lệnh ghi nhận hợp lệ, cập nhật hồ sơ hiện hữu liên quan trong phạm vi được phép; không tạo registry trùng. Phiên mới đọc governance có hiệu lực (nếu có), nguồn sự thật, trạng thái, checkpoint, conflict, issue/regression và hợp đồng liên quan trước khi sửa code.

## 8. Vòng đời tài liệu
CURRENT, HISTORICAL, SUPERSEDED, AUDIT SNAPSHOT và BASELINE là nhãn vòng đời tài liệu, không phải trạng thái công việc. Thay thế phải nêu tài liệu thay thế, phạm vi, ngày và authorization. Tài liệu mới hơn hoặc tên có CURRENT không tự override nguồn khác. Giữ lịch sử. Nguồn mâu thuẫn xử lý theo 06_CONFLICT_MANAGEMENT.md.

## 9. Build và thiết bị
Khi prompt cho phép thay đổi ứng dụng cần kiểm chứng trên thiết bị và chỉ định thiết bị, Coding Agent build đúng phiên bản, xác định APK vừa tạo, cài ADB, xác minh package/version/build, mở ứng dụng và báo đúng thiết bị/kết quả. Cài thất bại thì dừng và báo cáo. Không có quyền build/deploy/install ngoài prompt. PO directly performs UI/business testing and decides PASS/FAIL. Current PO C02 direction additionally permits the agent to open the app and verify launch only; this is not business testing or PO PASS. See the dated C01–C13 addendum and current disposition in 13_CONFLICT_REGISTER_V2.md. Legacy documents remain unchanged.


### LAW-014 — F&B SMART Build Baseline & Build Safety
LAW-014 là quy tắc bắt buộc cho mọi thao tác kiểm tra môi trường, build, xác định APK, cài APK và ghi nhận kết quả. Governance V2 vẫn là draft; đây là bản quy tắc V2 theo chỉ dẫn PO, không tự adoption toàn bộ V2.

**Phân biệt ID lịch sử:** `docs/rehabilitation/00_KIM_CHI_NAM_REHABILITATION.md` §12 cũng từng dùng nhãn LAW-014 cho quy tắc thiết bị. Giữ nguyên văn bản lịch sử đó. Mục này ghi LAW-014 Build Baseline & Build Safety theo chỉ dẫn PO mới cho governance V2; không sửa hồi tố legacy. Nếu có khác biệt trong cách diễn giải phạm vi luật cũ, giữ nguồn và yêu cầu PO phân xử, không tự đổi nội dung lịch sử.

**Baseline PO chỉ định**
- Baseline ID: `A0-BUILD-001` (historical build baseline; không tự đổi thành CURRENT BUILD PASS).
- Project root: `C:\Users\Admin\Desktop\Android\fnb_smart`; Flutter root: `C:\Users\Admin\Desktop\flutter_windows_3.41.0-stable\flutter`; Android root: `C:\Users\Admin\Desktop\Android\fnb_smart\android`.
- Toolchain target: Flutter 3.41.0; Dart 3.11.0; Java 17.0.20.1+1 (Eclipse Adoptium); Gradle 8.11.1; AGP 8.11.1; Kotlin 2.2.20; compileSdk 36; targetSdk 35; minSdk 24.
- Android: `ANDROID_HOME=C:\Users\Admin\AppData\Local\Android\Sdk`; `ANDROID_USER_HOME=C:\Users\Admin\.android`; ADB `C:\Users\Admin\AppData\Local\Android\Sdk\platform-tools\adb.exe`; trong phiên build đặt `$env:ANDROID_PREFS_ROOT=""` để tránh AndroidLocationsBuildService conflict.
- Firebase PO chỉ định theo baseline lịch sử: project `fnb-smart`, STAGING, flavor Default. Cấu hình thực tế phải được kiểm tra trước mỗi build liên quan Firebase. `fnb-smart`, `fnb-smart-staging`, `fnb-smart-dev` là ID khác nhau; mismatch thì `ENVIRONMENT MISMATCH`, không tự chọn/sửa, báo PO nếu ảnh hưởng build.

Các giá trị trên là baseline được PO chỉ định trong LAW-014, không phải bằng chứng cấu hình hiện tại của checkout đã được kiểm tra. C07 (toolchain) và C06 (Firebase environment) vẫn UNRESOLVED đối với trạng thái runtime/checkout cho đến khi kiểm tra read-only đúng lúc. REENTRY-001 là audit snapshot khác thời điểm; không ghi đè hoặc xóa history. Trước khi build, xác minh checkout, wrapper/plugin/toolchain và Firebase config thực tế; nếu mismatch, ghi rõ và dừng phụ thuộc.

**Authorization và an toàn**
- Chỉ build/cài khi prompt cho phép rõ; baseline không tự cấp quyền build, deploy, install hoặc thao tác thiết bị. Production luôn PROTECTED; cấm production/release/App Bundle, đổi project/environment/flavor, thay google-services.json hoặc cài APK production nếu PO chưa yêu cầu rõ.
- Build debug baseline: PowerShell `$env:ANDROID_PREFS_ROOT=""` rồi `flutter build apk --debug`. Không tự thay bằng release/appbundle/production.
- Dirty worktree không tự cấm build; ghi nhận Git status. Cấm reset/clean/restore/checkout và hành động phá thay đổi PO.
- Nếu cần đổi toolchain: ghi `TOOLCHAIN CHANGE DETECTED`, nguyên nhân/phạm vi/tác động; không tự coi bình thường; dừng và báo PO khi ảnh hưởng baseline.

**APK và chuỗi bằng chứng**
Sau build ghi APK path, build type, timestamp, application ID, version, output và identity chứng minh APK vừa build từ source hiện tại. Không đưa APK không xác định nguồn cho PO. Nếu được phép cài: BUILD → VERIFY APK → INSTALL → VERIFY INSTALLED PACKAGE; ghi thiết bị thực tế. Baseline lịch sử install là `adb install -r build\app\outputs\flutter-apk\app-debug.apk` trên SM-N950F, Android 9/API 28; thiết bị khác không tự thay thế baseline.

Build SUCCESS chỉ chứng minh đóng gói APK debug, không chứng minh chức năng, dữ liệu, Firebase, PO test hoặc Stage PASS. PO trực tiếp làm kiểm tra nghiệp vụ và quyết định. Khi build fail, ghi FIRST FAILURE, command, environment, error, first failing step, likely root cause và evidence; forensic trước, surgical fix chỉ trong scope được phép. Không đổi hàng loạt cấu hình, xóa cache để thử vận may hoặc dọn workspace.

`A0-BUILD-001` giữ trạng thái HISTORICAL BUILD BASELINE: SUCCESS, APK debug, SM-N950F install SUCCESS theo hồ sơ 2026-03-31. Không suy thành current build pass hoặc A0 PASS. Mỗi build mới ghi BUILD DATE, branch, HEAD, worktree, toolchain, environment, command, result, APK path/identity, install result và device. Nếu không build, report `BUILD: NOT EXECUTED — OUT OF SCOPE`.

LAW-014 violation gồm tự đổi toolchain, build production/release, đổi Firebase environment, sửa environment để build cho qua, APK không rõ nguồn/cũ bị báo mới, destructive Git để build, hoặc suy functional PASS từ build SUCCESS. Báo `LAW-014 VIOLATION` nếu xảy ra.
## 10. LAW-013 — REPORT TEMPLATE (BẮT BUỘC, SINGLE COPY)

Sau khi thực hiện mỗi PROMPT, AI phải xuất toàn bộ báo cáo cuối cùng trong DUY NHẤT MỘT fenced code block để PO COPY một lần. Đây là quy tắc governance bắt buộc, không phải lựa chọn trình bày. Áp dụng đúng cấu trúc chính thức dưới đây; không tự thêm/bớt/đổi thứ tự trường nếu chưa được PO cho phép.

Không chia báo cáo ra nhiều code block; không đặt phần báo cáo ngoài block; không yêu cầu PO ghép các phần. Hai dòng BEGIN/END phải ở trong cùng block. Báo cáo nêu kết quả thực tế, tách AI technical result với PO verification và historical evidence với current verification. Không ghi PASS/VERIFIED/PO_VERIFIED/LOCKED nếu evidence hoặc thẩm quyền không đủ. Nếu không thể xuất một block duy nhất, ghi `STATUS = REPORT_FORMAT_BLOCKED`; không tuyên bố prompt đã hoàn tất về mặt governance.

Mẫu chính thức:

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

`docs/rehabilitation/10_REPORT_TEMPLATE.md` là bản chép để tiện dùng; nếu khác Kim Chỉ Nam, LAW-013 và mẫu trong Kim Chỉ Nam chi phối. Governance V2 vẫn DRAFT — NOT YET ADOPTED cho tới adoption riêng của PO.
## 11. Xung đột còn mở
Không xem dự thảo là lựa chọn đã adoption giữa các quy tắc lịch sử. C01–C13 vẫn mở. C01/C02 cần đối chiếu phạm vi trước khi kết luận các câu được trích thực sự mâu thuẫn. Không tự đóng conflict bằng ngày, tiêu đề, câu chữ V2 hoặc suy luận Agent.
## PO decision consolidation — C01–C13 — 2026-09-26
Source: PO prompt “C01-C13 — CONSOLIDATE PO DECISIONS”. This is a source-attributed governance addendum; Governance V2 remains DRAFT — REVIEW CANDIDATE / NOT YET ADOPTED.

### C02 — device responsibility clarification
For an explicitly authorized task, Coding Agent may BUILD → INSTALL → OPEN APP → VERIFY APP LAUNCH and report technical evidence. Opening the app proves launch only. Agent must not operate business UI, perform business tests, or present launch success as PO PASS. PO Tuấn performs UI/business tests and decides actual result, PO_VERIFIED, and LOCKED. This clarification supersedes any broader interpretation of older wording; legacy records are preserved.

### C03 — current project track
The current PO-directed track is rehabilitation of the existing F&B SMART project. Do not switch repository, create a replacement project, change architecture/platform, or change Firebase without a new PO decision. This direction does not rewrite PRODUCT_CHARTER_V5.1 or authorize technical changes; retain any contract scope issue as recorded evidence.

### C04/C05/C13 — A-stage and ID policy
Review is directed from A0 onward. Main stages are A0 → A1 → A2 → A3 → A4 → …. New child IDs use hyphens (A0-01, A2-02; deeper only when needed, e.g. A2-02-01). Decimal/phase IDs remain historical references; do not infer crosswalks. Preserve historical results and duplicate checkpoints. A0-forward review is not performed by this documentation update. Protect PO_VERIFIED/LOCKED scope; on possible impact, stop, report to PO, and mark REGRESSION_REQUIRED when evidence warrants it.

### C06 — current Firebase direction
PO designates `fnb-smart-dev` as the current official Firebase project. `fnb-smart` and `fnb-smart-staging` are not the current project unless PO decides otherwise. This decision does not authorize config changes. Current static checkout references are documented in 09_CURRENT_STATE_V2.md; runtime was not inspected.

### C07 — toolchain direction
The PO-designated target remains Flutter 3.41.0, Dart 3.11.0, Java 17.0.20.1+1, Gradle 8.11.1, AGP 8.11.1, Kotlin 2.2.20, compileSdk 36, targetSdk 35, minSdk 24. Do not change toolchain to force a build. Static checkout mismatches are recorded in 09_CURRENT_STATE_V2.md; no build or runtime verification was performed.

### C08–C12 — preserved rules
Keep both A1.2 records without choosing/merging/deleting; distinguish Technical PASS, PO PASS, PO_VERIFIED and LOCKED; an audit finding is not automatically an official bug; do not assert a markTableClean/create_order conflict without actual-behavior evidence and command/permission/state separation; nonnegative allocation applies to ordinary Sale invoices, while Reversal may be negative. Do not change legacy documents, contracts, code, configuration, or checkpoints through this addendum.
