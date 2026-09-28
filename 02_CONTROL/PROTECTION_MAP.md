# PROTECTION MAP — BẢN ĐỒ VÙNG BẢO VỆ

## Chuỗi Bảo vệ (GOV-025)

```text
PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED
```

---

## Các Vùng Đang được Bảo vệ (Protected & Locked Scope)

### 1. GOVERNANCE BASELINE V5.1
- **Status:** `PROTECTED / BASELINE FREEZE`
- **Protected Content:** Toàn bộ bộ quy tắc KIM CHỈ NAM (`00_KIM_CHI_NAM/*`), bao gồm hai chế độ vận hành (Rehabilitation vs Clean Rebuild), Legacy Freeze, Contract-First, Master Spec Gate, Provenance rule, Git boundary, và quy trình đóng task.
- **Rule:** Bắt buộc có PO Decision riêng biệt mới được điều chỉnh luật (PO Freeze Baseline Protocol).

### 2. LEGACY CODEBASE (System-wide Legacy Protection)
- **Status:** `FROZEN / LOCKED`
- **Protected Scope:** Toàn bộ legacy source code (`lib/`, `packages/`, Cloud Functions, Firebase configuration cũ).
- **Rule:** Hệ thống cũ bị đóng băng hoàn toàn làm Read-Only Forensic Reference. Nghiêm cấm mọi hành vi tự ý patch/edit legacy application code.

### 3. LEGACY CHECKPOINTS (A0, A1, A2-01, A2-02, A3-01, A3-02, A3-03, A3-05, A3-06, GP-01, GOV-025)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Rule:** Đã khóa hành vi và invariant theo hồ sơ lịch sử. Muốn can thiệp bắt buộc phải có lệnh `UNLOCK` chính thức từ PO Tuấn.

### 4. REFERENCE ARCHITECTURE LIBRARY V5.1 (PROMPT 061)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `REFERENCE_ARCHITECTURE_LIBRARY_V5.1.md` (REF-001 to REF-012 mapping, useful ideas, conflicts, and licensing notes).
- **Rule:** Strict classification (`REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`). F&B Smart Authority wins. Cannot be modified or used to inherit unapproved requirements without PO Decision.

---

## Phân tích Ảnh hưởng Vùng Bảo vệ (LOCKED SCOPE IMPACT)

Trước khi thực thi Work Item Clean Rebuild mới:
```text
CURRENT PHASE / WORKITEM
TASK SCOPE
RELATED COMPONENTS
LOCKED SCOPE IMPACT
```
- Nếu tác động đến vùng Legacy: **STOP** (Legacy is Frozen).
- Clean Rebuild được thực hiện độc lập trong boundary mới mà không xâm phạm vùng Legacy đã `LOCKED`.
