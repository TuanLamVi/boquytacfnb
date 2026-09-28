# F&B SMART V5.1 — QUICK SETUP, BUSINESS MODEL & MENU TEMPLATE PRODUCT DISCOVERY (FINAL DRAFT — PROMPT 064)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & UX Design Specification (Prompt 064 Final Draft)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `PROPOSED — PO REVIEW REQUIRED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## PART A — QUICK SETUP FINAL FLOW

```
[Owner Profile & Store Creation]
       │
       ▼ (Tap "Tạo quán")
[Dashboard (Initial State with Empty Guidance)]
       │
       ▼ (Automatic Trigger)
[Popup: "KHỞI TẠO QUÁN NHANH" / Quick Setup Wizard]
       │
       ▼ (Select 1 of 20 Business Models)
[Starter Data Generation Animation]
  ├── Clone System Menu Template into Store Menu (~15 representative items, sizes, toppings)
  ├── Provision 1 default area ("Khu vực 1")
  └── Provision EXACTLY 10 starter tables (Bàn 01 → Bàn 10) [Fixed rule: no prompt for table count]
       │
       ▼
[Store Ready to Sell!] ──> Dismisses to Live Dashboard & POS
```

---

## PART B — 20 BUSINESS MODELS — PROPOSED (`PROPOSED — PO REVIEW REQUIRED`)

1. **Quán Cà phê (Coffee Shop):** Focus on beverage customization, ice/sugar levels, toppings, and fast counter checkout.
2. **Quán Trà sữa (Milk Tea Shop):** Heavy topping matrix, size variants (M/L), sweetness/ice adjustments.
3. **Quán Bún / Phở (Noodle Soup Shop):** Broth options, meat cuts, and specific noodle additions (trứng chần, quẩy).
4. **Quán Cơm / Cơm văn phòng (Rice & Lunch Plate Shop):** Combo meals, side dishes, soup selections, takeout packaging.
5. **Quán Ăn Sáng (Breakfast Diner):** Bánh mì, hủ tiếu, xôi with diverse protein add-ons.
6. **Quán Ăn Gia Đình (Family Restaurant):** Multi-course sharing dishes, table service, kitchen station routing.
7. **Đồ ăn nhanh / Fast Food:** Burgers, fries, combo sets, rapid counter service.
8. **Quán Nhậu / Bia Hơi (Pub / Beer Garden):** High table turnover, sharing snacks, seafood, beer towers, split payments.
9. **Nhà Hàng (Full-Service Restaurant):** Multi-zone table maps (VIP, Indoor, Outdoor), KOT/KDS dispatch, course sequencing.
10. **Đồ Nướng / BBQ (Grill Restaurant):** Table-side grilling, buffet or à la carte pricing, charcoal/grill fee addons.
11. **Lẩu / Hotpot:** Set menus, broth choices, meat/veggie platters, refillable toppings.
12. **Hải Sản (Seafood Restaurant):** Weight-based pricing (per 100g), live tank selection, preparation notes.
13. **Chè (Sweet Soup Shop):** Dessert bowls, ice/sweetness preferences, multiple sweet toppings.
14. **Kem (Ice Cream Parlor):** Scoops, cones/cups, toppings (chocolate syrup, sprinkles, nuts).
15. **Sinh tố / Nước ép (Smoothie & Juice Bar):** Fruit combinations, sugar adjustments, milk/yogurt options.
16. **Bánh / Tiệm bánh (Bakery / Cake Shop):** Baked goods, sizing (slice vs whole), candle/card add-ons.
17. **Tiệm ăn vặt (Snack Bar):** Fast-moving small bites, crispy snacks, dipping sauces.
18. **Quán Đặc sản (Regional Specialties):** Specialized regional dishes with unique accompaniment sets.
19. **Cửa hàng Tiện lợi / Tạp hóa kết hợp F&B (Convenience / Hybrid Store):** Packaged goods + prepared drinks/snacks.
20. **Mô hình Khác (Other / Custom Model):** Generic flexible template for unique F&B concepts.

---

## PART C — MENU TEMPLATE

- **Tenant Isolation Rule:** System Menu Templates serve as master blueprints. When a store selects a business model, the template items are **cloned** into the store's independent namespace (`Store Menu`).
- **Data Integrity:** Store A modifying item prices or adding items does not affect Store B or the master template. Subsequent template updates do not overwrite existing store menus.

---

## PART D — PRODUCT / SIZE / TOPPING / PRODUCT OPTIONS MODEL

A clear distinction is established between **Toppings / Add-ons** and **Product Options / Attributes**:

### 1. Topping / Add-on (Paid / Quantity-based)
- *Examples:* Trứng chần, Thịt thêm, Trân châu, Pudding, Quẩy.
- *Properties:* Has a distinct unit price, quantity controls (`[-] N [+]`), and optional min/max limits.
- *Calculation:* Adds directly to line item total (`ToppingPrice * ToppingQty`).

### 2. Product Options / Attributes (Qualitative / Attribute-based)
- *Examples:* Ít đường, Bình thường, Nhiều đường; Ít đá, Bình thường, Không đá; Nóng / Lạnh.
- *Properties:* Qualitative attribute modifiers. They do not necessarily carry a monetary price increment or quantity counter in the same way as paid toppings.
- *Design Status:* `PRODUCT DESIGN / PO DECISION REQUIRED` for advanced multi-attribute matrix rendering.

---

## PART E — 10 STARTER TABLES

- Quick Setup automatically provisions **exactly 10 starter tables** (`Bàn 01` through `Bàn 10`) under `Khu vực 1`.
- There is **no extra wizard step** asking for custom table counts during initial store creation. Store owners can freely add, rename, or delete tables later in [Table Management].

---

## PART F — READY-TO-SELL

A store is officially **Ready to Sell** when:
1. Store entity is created via phone/OTP and owner onboarding.
2. Quick Setup model selection is completed.
3. Menu template items (~15 items), 1 sample area, and exactly 10 starter tables are successfully cloned.
4. The user lands directly on the live Dashboard / POS view ready to take the first order.

---

## PART G — PO DECISIONS REQUIRED

1. **[DECISION-QS-01]** Approval of the 20 proposed Vietnamese F&B business models. *(Proposed — PO Review Required)*
2. **[DECISION-QS-02]** Confirmation that starter table count is locked at exactly 10 tables during Quick Setup, with subsequent adjustments handled in Table Management. *(Proposed — PO Review Required)*
3. **[DECISION-QS-03]** Product Options (ice/sugar levels) rendering specifications in POS cart and KDS tickets. *(Product Design / PO Decision Required)*

---

## PART H — CHANGES FROM PROMPT 063

1. **Starter Tables Locked:** Clarified that Quick Setup automatically creates exactly 10 tables with no intermediate table-count configuration step.
2. **Topping vs Product Options Split:** Formally separated paid countable Toppings/Add-ons from qualitative Product Options (ice/sugar/temperature).
3. **Status Refinement:** Set document status to Final Draft (Prompt 064) awaiting PO review.

---
*End of Quick Setup & Menu Template Discovery V5.1 (Prompt 064)*
