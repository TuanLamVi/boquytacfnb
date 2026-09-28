# F&B SMART V5.1 — 20 BUSINESS MODELS & MENU TEMPLATE STRUCTURE (PROMPT 066 FINAL CORRECTION)

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Product Discovery & Business Model Standardization (Prompt 066 Final Correction)
- **Author:** Product Owner (Tuấn) & Product Design Team
- **Build Mode:** Clean Rebuild V5.1 (Product Discovery & UX Design Only)
- **Status:** `FINAL DRAFT — PO REVIEW REQUIRED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `MASTER_DESIGN_V4.4.md`

---

## PART A — MASTER DESIGN CORRECTED

### 1. Product Options / Attributes Pricing Flexibility
- Product Options (e.g., Ít đá, Bình thường, Nóng/Lạnh, Ít đường) are qualitative preferences.
- **Correction:** Product Options can be **free (0đ)** OR carry an **additional price increment** if specifically configured by the store owner or PO (e.g., Special option +5.000đ). They are not hardcoded to zero price.

### 2. Topping Quantity Granularity (`minQty / `maxQty`)
- `minQty` and `maxQty` apply at the **individual Topping level** when required.
- *Example:*
  ```text
  Trứng chần
  [-] 2 [+]
  minQty = 0
  maxQty = 5
  unitPrice = 5.000đ
  ```
- Topping Groups serve strictly as logical container categories for related toppings. Group-level constraints do not override individual topping min/max bounds.

### 3. Special Pricing Classification
- Special pricing models (Seafood weight-based pricing, Buffet per-head pricing, Combo bundles, Convenience hybrid retail + F&B) are **not** declared as fully supported in MVP.
- They are classified strictly as `PROPOSED / PRODUCT DISCOVERY / TBD`.
- Complex pricing logic is excluded from Clean Rebuild V5.1 MVP unless formally approved by PO.

---

## PART B — CHANGES FROM PROMPT 065

1. **Product Options Pricing:** Updated from strict zero-price to flexible pricing (0đ or configured extra fee).
2. **Topping Level Bounds:** Clarified that `minQty` and `maxQty` operate at individual topping items rather than group-only limits.
3. **Representative Menus Clarity:** Explicitly noted that Bún/Phở and Cà phê are representative models used to illustrate template structure, not complete production datasets for all 20 models.
4. **Special Pricing Deferral/Discovery Status:** Reclassified weight-based and complex pricing mechanics as discovery/TBD to keep MVP scope clean.

---

## PART C — PRICING MODEL CLASSIFICATION

| Pricing Model | Operational Description | MVP Status |
|:---|:---|:---|
| **Standard Unit Pricing** | Fixed base price + size offset + priced toppings. | **Supported (MVP Core)** |
| **Seafood / Weight-based** | Price per 100g with live scale input. | `PROPOSED / TBD (Deferred)` |
| **Buffet / Per-head** | Fixed price per person + à-la-carte add-ons. | `PROPOSED / TBD (Deferred)` |
| **Combo Bundles** | Multi-item package at composite price. | `PROPOSED / TBD (Evaluation)` |
| **Hybrid Retail + F&B** | Barcoded retail items mixed with prepared F&B. | `PROPOSED / TBD (Evaluation)` |

---

## PART D — REPRESENTATIVE VS COMPLETE TEMPLATES

- **Representative Models:** Quán Bún / Phở and Quán Cà phê serve as sample implementations demonstrating how menu categories, sizes, product options, and structured toppings are modeled.
- **Scope Limit:** This discovery does not imply that all 20 business models have complete 15-item production menus fully populated; the remaining 18 models follow the same master template schema pattern upon activation.

---

## PART E — PO DECISIONS REQUIRED

1. **[DECISION-066-01]** Approval of flexible pricing for Product Options (0đ or configured extra fee). *(Final Draft — PO Review Required)*
2. **[DECISION-066-02]** Confirmation of individual-level Topping `minQty` / `maxQty` data structure. *(Final Draft — PO Review Required)*
3. **[DECISION-066-03]** Agreement on deferring complex special pricing models (Seafood weight, Buffet matrices) to post-MVP. *(Final Draft — PO Review Required)*

---
*End of Business Models & Menu Templates Standardization V5.1 (Prompt 066 Final Correction)*
