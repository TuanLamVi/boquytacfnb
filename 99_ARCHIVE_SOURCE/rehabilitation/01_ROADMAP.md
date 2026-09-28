# CURRENT ROADMAP CORRECTION — 2026-09-26

> Parent A2 is **NOT VERIFIED**. The historical Phase 2 text below is preserved; its `COMPLETED` label must not be read as parent A2 acceptance.

Current child result:
- `A2-01` = `PO_VERIFIED / PROTECTED / LOCKED`
- `A2-02` = `PO_VERIFIED / PROTECTED / LOCKED`

The next product Work Item is not assigned in this snapshot. Do not infer a new task from the old roadmap `Next` fields.

---

# 01 — ROADMAP CẢI TẠO VÀ PHỤC HỒI DỰ ÁN F&B SMART (PROMPT A0 UPDATED)

## Ghi chú taxonomy A-stage theo quyết định PO — 2026-09-26
Từ quyết định PO, A0, A1, A2, A3, A4... là giai đoạn cha; A2.x/A3.x/A4.x là nhánh thuộc giai đoạn có cùng tiền tố cha. PASS ở nhánh không tự thành PASS ở stage cha. A-stage cha chỉ PASS khi đủ toàn bộ phạm vi và tiêu chí của stage.

Các nhãn Phase 0–8 và cách đánh số trong nội dung lịch sử dưới đây được giữ nguyên để bảo toàn record. Không tự chuyển Phase 3/4 thành A3/A4 hoặc ánh xạ trạng thái của chúng sang A-stage. Mục tiêu A0–A11 tham khảo Kim Chỉ Nam cải tạo; conflict về tên/phạm vi/status từng stage được ghi trong PROJECT_JOURNAL_V2.md và phải giữ UNRESOLVED cho đến khi có crosswalk đủ evidence.

## 1. NGUYÊN TẮC ROADMAP
- Roadmap định hướng thứ tự ưu tiên cải tạo dựa trên sơ đồ phụ thuộc thực tế của hệ thống (Foundation -> Data -> Security -> Core Transaction -> POS -> Kitchen -> Payment -> Reporting -> Optional).
- Mọi Phase chỉ chuyển sang trạng thái `PO_VERIFIED` và `LOCKED` khi có xác nhận trực tiếp từ PO.

---

## 2. CHI TIẾT CÁC GIAI ĐOẠN (PHASES)

### PHASE 0 / A0: Nền móng & Khung quản lý (Foundation & Governance)
- **Mục tiêu:** Thiết lập khung quản lý, nhật ký phục hồi, khảo sát hiện trạng, cấu hình Android/Firebase Staging, Build Debug APK, cài đặt trên thiết bị thật.
- **Trạng thái:** `COMPLETED`
- **PO Verification:** 
  - Build Baseline (A0-BUILD-001): `YES` (Xác nhận bởi Tuấn)
  - Toàn bộ Phase A0: `YES` (Đã được Chủ đầu tư Tuấn xác nhận thực tế)
- **Checkpoint:** `LOCKED` (A0 Foundation Checkpoint Locked)

---

### PHASE 1: Security & Access Control (A1 Account & Store)
- **Mục tiêu:** Củng cố Firestore Rules, RBAC, bảo vệ dữ liệu nhà hàng, đảm bảo `storeId` tenant isolation toàn diện, tài khoản & cửa hàng.
- **Trạng thái:** `COMPLETED`
- **PO Verification:** `YES` (Xác nhận trực tiếp bởi PO Tuấn trên Tab S3 cho A1.1 & A1.2-01 đến A1.2-08)
- **Checkpoint:** `LOCKED` (A1.1 & A1.2 Checkpoints Locked)

---

### PHASE 2 / A2: Staff & Permissions (A2.2-01-FIX-02 Duplicate Join Prevention)
- **Mục tiêu:** Chống nhân viên gia nhập trùng Store hiện tại (TEST 8A, TEST 8B, TEST 8C), bảo vệ Golden Baseline TEST 1–7.
- **Trạng thái:** `COMPLETED`
- **PO Verification:** `YES` (Xác nhận trực tiếp bởi PO Tuấn trên thiết bị thật cho TEST 8A, 8B, 8C)
- **Checkpoint:** `LOCKED` (A2.2-01-FIX-02 Checkpoint Locked)

---

### PHASE 3: Money / Currency / Int64 Representation
- **Mục tiêu:** Chuẩn hóa toàn bộ tính toán tiền tệ sang số nguyên (`int` / Int64) đơn vị Đồng, triệt tiêu `double` trong tài chính.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 3: Orders & Order Lines State Engine
- **Mục tiêu:** Chuẩn hóa State Machine của đơn hàng và dòng đơn hàng, khắc phục `READ_MODEL_MISMATCH`.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 4: Table State Management
- **Mục tiêu:** Hoàn thiện sơ đồ bàn, trạng thái bàn, đồng bộ real-time atomic, xử lý `upsertZone` parameter mismatch.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 5: Kitchen / KDS (Kitchen Display System)
- **Mục tiêu:** Ổn định luồng điều hướng món xuống bếp, lọc trạm chế biến (`stationId`), chống lặp đơn.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 6: Payment & Invoice Generation
- **Mục tiêu:** Hoàn thiện hàm thanh toán, tạo hóa đơn bất biến, xử lý đồng thời, giải quyết dependency in ấn nhiệt.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 7: Financial Reporting & Metrics
- **Mục tiêu:** Tối ưu hóa truy vấn Firestore theo budget, hoàn thiện báo cáo kết ca.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

### PHASE 8: Golden Path / End-to-End Flow Verification
- **Mục tiêu:** Chạy kiểm chứng toàn bộ luồng E2E.
- **Trạng thái:** `NOT_STARTED`
- **PO Verification:** `PENDING`
- **Checkpoint:** `OPEN`

---

## 3. BẢNG TỔNG HỢP TIẾN ĐỘ ROADMAP

| Phase | Tên Giai Đoạn | Trạng thái | AI Result | PO Verification | Checkpoint |
| :---: | :--- | :---: | :---: | :---: | :---: |
| A0 | Nền móng & Khung quản lý | `COMPLETED` | `PASS_TECHNICAL` | `YES` (Tuấn) | `LOCKED` |
| 1 / A1 | Security, Account & Store | `COMPLETED` | `VERIFIED` | `YES` (Tuấn) | `LOCKED` |
| A2.2-01 | Staff & Permissions (Fix-02 Duplicate Join) | `COMPLETED` | `VERIFIED` | `YES` (Tuấn) | `LOCKED` |
| 2 | Money / Currency / Int64 | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 3 | Orders & Order Lines | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 4 | Table State Management | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 5 | Kitchen / KDS | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 6 | Payment & Invoice | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 7 | Financial Reporting | `NOT_STARTED` | - | `PENDING` | `OPEN` |
| 8 | Golden Path / E2E | `NOT_STARTED` | - | `PENDING` | `OPEN` |
## Canonical A-stage IDs and acceptance — PO direction 2026-09-26

**Status: DRAFT — NOT YET ADOPTED.** For new project records, parent stages are `A0`, `A1`, `A2`, `A3`, `A4`…; child items use `A0-01`, `A2-02`, `A3-03`; deeper items may use `A2-02-01` when needed. Do not create new decimal IDs. Existing decimal IDs and longer legacy IDs remain unchanged as **historical IDs**.

A historical ID is not a canonical ID. Do not infer a crosswalk from numbering or wording. Record `CROSSWALK: VERIFIED` only when source evidence establishes the same scope; otherwise record `CROSSWALK: UNRESOLVED` and leave the canonical ID unassigned. Never edit legacy history merely to fit the new scheme.

A child item PASS applies only to its own acceptance criteria and does not imply parent A-stage PASS. Parent PASS requires defined parent scope and mandatory items, completed checks and acceptance criteria, required direct PO tests, no scope-affecting blocker/unresolved item, and direct PO confirmation under the Kim Chỉ Nam process. A commit, successful build, AI/Gemini PASS, child PASS, or legacy LOCKED label alone cannot establish parent PASS.

Keep result vocabularies distinct: AI/technical `AI_PASS`, `READY_FOR_PO_VERIFICATION`, `UNRESOLVED`, `BLOCKED`; PO `PO_PASS`, `PO_VERIFIED`, `LOCKED`. Where technical PASS exists but PO has not tested: `AI_PASS / PO_UNVERIFIED / TEST_DEBT`. Preserve every deferred test (including Note 8/M51 where recorded) as debt for the A0 revalidation sequence; do not convert it to PO_PASS. Historical PO claims remain labeled historical and are not new decisions.

Revalidation is planned from A0 onward after Kim Chỉ Nam completion. A2 revalidation-from-zero remains specifically required. This canonicalization does not perform any stage tests or revalidation. Current stage may be recorded as A4 per PO direction, without implying A4 PASS/PO_VERIFIED/LOCKED.