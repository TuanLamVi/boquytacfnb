# PROTECTION MAP — BẢN ĐỒ VÙNG BẢO VỆ

## Chuỗi Bảo vệ (GOV-025)

```text
PASS → PO_VERIFIED → REGRESSION CHECK → PROTECTED → LOCKED
```

---

## Các Vùng Đang được Bảo vệ (Protected & Locked Scope)

### 1. CLEAN REBUILD A0 FOUNDATION (PROMPT 131–133)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** Canonical application workspace structure and core infrastructure foundation (`packages/core_saas`, core services, Firebase Auth + App Check security baseline, tenant/store isolation foundation).
- **Rule:** Protected and Locked baseline for Clean Rebuild V5.1 architecture (DEC-2026-A0-FOUNDATION-PO-VERIFIED). Legacy protection is separate and frozen; A0 has independent Clean Rebuild protection.

### 2. CLEAN REBUILD MASTER SPECIFICATION V5.1 (PROMPTS 115–127)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED` (Golden Governance Baseline)
- **Protected Content:** `99_ARCHIVE_SOURCE/CLEAN_REBUILD_MASTER_SPECIFICATION_V5.1.md` (Complete MVP scope, 14 exact operational state machines, financial invariants, unallocated funds, invoice reversals, refunds, security baseline).
- **Rule:** Locked Golden Governance Baseline (DEC-2026-MASTER-SPEC-PO-VERIFIED). No work item may alter the Master Specification without formal PO decision, UNLOCK command, and change-control process.

### 2. GOVERNANCE BASELINE V5.1
- **Status:** `PROTECTED / BASELINE FREEZE`
- **Protected Content:** Toàn bộ bộ quy tắc KIM CHỈ NAM (`00_KIM_CHI_NAM/*`), bao gồm hai chế độ vận hành (Rehabilitation vs Clean Rebuild), Legacy Freeze, Contract-First, Master Spec Gate, AI Working Discipline (Prompt 136), và Official Clean Rebuild Source & Provenance Rules (Prompt 146).
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

### 5. BUSINESS MODELS & MENU TEMPLATE DESIGN V5.1 (PROMPT 066)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `BUSINESS_MODELS_MENU_TEMPLATES_V5.1.md` (20 Business Models, Menu Template Structure, Store Menu independent copy, Topping vs Product Options rules, Representative Models).
- **Rule:** Locked product-design baseline. No work item may alter the 20 business models, store menu copy mechanism, topping quantity model, or product options pricing rules without valid PO Decision and Unlock.

### 6. TABLE MERGE / TABLE TRANSFER / OPERATING MODEL V5.1 (PROMPTS 074/090/091/092)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `TABLE_MANAGEMENT_DISCOVERY_V5.1.md` (Table flow: 2 entry branches from BÀN TRỐNG [Đặt trước or Walk-in] → Vào bàn → Gọi món → Thanh toán → Chờ dọn → Dọn xong → Trống, multi-staff collection, non-destructive table merge, strict table transfer state machine `occupied → cleaning → available`, post-checkout prohibition, and `Chờ dọn → Gọi thêm món` dynamic).
- **Rule:** Locked product-design baseline. No work item may alter table operating rules without valid PO Decision and Unlock.

### 7. POS ORDERING / CART / CUSTOMIZATION / KITCHEN DISPATCH / OFFLINE BOUNDARY V5.1 (PROMPT 078)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `POS_ORDERING_DISCOVERY_V5.1.md` (Open table flow, product customization, size, structured toppings `[-] N [+]`, product options, cart line grouping rules, kitchen dispatch rounds, and offline outbox eligibility boundary).
- **Rule:** Locked product-design baseline. No work item may alter POS ordering or offline boundary rules without valid PO Decision and Unlock.

### 8. KDS PRODUCT DISCOVERY & UX DESIGN V5.1 (PROMPT 081)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `KDS_KITCHEN_DISCOVERY_V5.1.md` (KDS main screen UX, kitchen ticket model, state flow `queued → acknowledged → preparing → ready → served`, Ready/Served independence from payment gate, payment independence, table cleaning boundary, reservation boundary, multi-round dispatches, and idempotency UUIDs).
- **Rule:** Locked product-design baseline. No work item may alter KDS or kitchen operations rules without valid PO Decision and Unlock.

### 9. CHECKOUT & PAYMENT PRODUCT RULES V5.1 (PROMPTS 084/085/086/090/091)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `CHECKOUT_PAYMENT_DISCOVERY_V5.1.md` (Checkout UX, Cash, payOS QR webhook verification, Split Payment, Debt Lite `Ghi nợ ≠ Đã nhận tiền`, `Còn phải thu ≠ Nợ`, multi-staff collection, multi-tender support, simple promotions/discounts, invoice lifecycle, 3-layer payment attempt/allocation/settlement, order closure & table cleaning sequence `occupied → cleaning → available`, LEGO permissions effective immediately, and online-required financial boundary).
- **Rule:** Locked product-design baseline. No work item may alter checkout or payment rules without valid PO Decision and Unlock.

### 10. A6 SHIFT MANAGEMENT & CASH DRAWER PRODUCT DISCOVERY V5.1 (PROMPT 095)
- **Status:** `PO_VERIFIED / PROTECTED / LOCKED`
- **Protected Content:** `SHIFT_MANAGEMENT_DISCOVERY_V5.1.md` (Shift lifecycle, opening cash immutability post-opening, expected cash formula, physical cash isolation excluding QR/debt/uncollected balance, optional shift handover, close shift blocking rules, LEGO permissions, multi-store scoping, and offline boundary).
- **Rule:** Locked product-design baseline. No work item may alter shift management or cash drawer rules without valid PO Decision and Unlock.

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
