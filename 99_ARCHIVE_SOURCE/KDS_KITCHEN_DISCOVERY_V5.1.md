# F&B SMART V5.1 — KDS & KITCHEN OPERATIONS PRODUCT DISCOVERY (PROMPT 081 FINAL CORRECTION & BOUNDARY LOCK)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 081 Final Correction)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `FINAL DRAFT — PO REVIEW REQUIRED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## PART A — KDS STATE FLOW & BOUNDARY LOCK
1. **Authorized State Flow:**
   ```text
   queued → acknowledged → preparing → ready → served
   ```
2. **Ready Independence (`READY ≠ PAYMENT GATE`):**
   - `Ready` = Kitchen confirms food preparation is complete.
   - It does *not* mean the guest has received the food.
   - It is **not** a prerequisite or blocking gate for payment.
3. **Served Independence (`SERVED ≠ PAYMENT GATE`):**
   - `Served` = Staff confirms dishes have been delivered to the table.
   - It is **not** a prerequisite for payment, nor is it a blocking condition for closing an order.

---

## PART B — PAYMENT INDEPENDENCE FROM KDS
- Payment is an independent financial settlement workflow:
  ```text
  Order Active ──> Checkout ──> Post Invoice ──> Payment ──> Invoice Paid ──> Order Closed
  ```
- KDS states (`Ready` / `Served`) have zero coupling with payment execution. Payment does not require KDS `Ready` or `Served`.

---

## PART C — TABLE CLEANING BOUNDARY
- When an order is fully paid and closed, table state transitions strictly per state machine:
  ```text
  OCCUPIED ──> CLEANING ──> AVAILABLE
  ```
- **Prohibited:** `OCCUPIED → AVAILABLE` directly after payment.
- **Independence:** KDS does not directly control or trigger Table State transitions. Table state management remains within Table/Order settlement domain.

---

## PART D — RESERVATION BOUNDARY
- Reservation (Đặt bàn) is a Table Management / Booking domain concept.
- **Reservation is NOT a KDS state.** Reservations appear on Table Map and Booking Management, independent of kitchen queue processing.

---

## PART E — KDS / INVENTORY BOUNDARY
- Inventory consumption / auto-deduction is **not** a mandatory requirement of KDS MVP.
- `Ready` and `Served` actions do not execute inventory deductions unless explicitly specified in Master Specification.

---

## PART F — STATION ROUTING & MULTI-ROUND DISPATCHES
1. **Station Routing:** Supports multi-station routing (e.g., `Bếp nóng`, `Bếp lạnh`, `Đồ uống`, `Bar`) based on product/menu item category configuration.
2. **Multi-Round Dispatches ("Gọi thêm món"):** Each employee send-to-kitchen action generates a distinct dispatch round (`Round 1`, `Round 2`, `Round 3`), preserving historical tickets without overwriting previous rounds.

---

## PART G — TOPPING / OPTIONS / NOTES & IDEMPOTENCY
1. **Ticket Content:** KDS displays Product, Size, Toppings + quantity (`[-] N [+]`), Product Options, and Free-text Notes.
2. **Idempotency (UUIDs):** Each dispatch round/command carries a unique client-side UUID to prevent double-submit, retry duplicate creation, and kitchen ticket duplication.

---

## PART H — EDIT / CANCEL / RETURN AFTER DISPATCH
- **Pre-preparation vs Post-preparation:**
  - *Before kitchen processes (queued/acknowledged):* Item edits or cancellations follow store policy.
  - *After kitchen starts preparing:* Requires formal Return / Void workflows to account for waste.
- **Return vs Refund:** Distinct operations. *Return* handles unserved/wasted items before invoice posting; *Refund* handles financial adjustments post-settlement.

---

## PART I — OFFLINE BOUNDARY
- Only operations explicitly verified as `Offline-Eligible` per Offline Contract are permitted in local outbox. KDS operations are not all offline by default.

---
*End of KDS & Kitchen Operations Discovery V5.1 (Prompt 081)*
