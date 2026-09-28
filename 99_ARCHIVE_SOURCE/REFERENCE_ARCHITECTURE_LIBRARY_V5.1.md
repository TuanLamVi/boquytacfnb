# F&B SMART V5.1 — REFERENCE ARCHITECTURE LIBRARY

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Reference Architecture Library & Comparative Study
- **Author:** Product Owner (Tuấn) & Architecture Research Team
- **Build Mode:** Clean Rebuild V5.1 (Design & Research Phase)
- **Status:** `PROPOSED / PO DECISION REQUIRED`
- **Governance Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`

---

## AUTHORITY RULE & GOVERNANCE BOUNDARY

> **CRITICAL RULE:**
> 1. Reference repositories listed in this document are **strictly for architectural ideation and comparative study**.
> 2. **F&B Smart Authority ALWAYS wins.** If any external reference pattern contradicts F&B Smart Governance (`KIM_CHI_NAM.md`), Product Charter V5.1, Database Schema V0.1, State Machines V0.1, or Query Cost Budget V0.1, **F&B Smart specifications prevail unconditionally**.
> 3. **NO CODE COPY:** No source code or proprietary logic shall be copied from external repositories.
> 4. **NO REQUIREMENT INHERITANCE:** External repository features do not automatically become F&B Smart product requirements unless explicitly approved by PO Tuấn via formal PO Decision.

---

## PART A — REFERENCE ARCHITECTURE LIBRARY (REF-001 TO REF-012)

### REF-001 — Restaurant POS Architecture
- **Source:** https://github.com/venkatiyer01/pos-app
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Multi-tenant POS, Concurrency, Consistency, Outbox pattern, Offline resilience, Conflict resolution, Failure recovery, Architecture trade-offs.

### REF-002 — Offline-first POS Architecture
- **Source:** https://github.com/DeepRathaur/pos-software
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Offline storage mechanisms, sync queue implementation, retry strategies, sync lifecycle management.

### REF-003 — Offline POS Outbox Pattern
- **Source:** https://github.com/duvan096/offline-first-pos
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Durable outbox pattern, idempotency guarantees, exponential backoff, offline order transaction handling.

### REF-004 — Android/Web Offline POS
- **Source:** https://github.com/andlengo26/smart-pos
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Server final authority, durable outbox sync, finalization locks, shift close protection.

### REF-005 — POS + KDS
- **Source:** https://github.com/getditto/demoapp-pos-kds
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** POS to KDS event propagation, real-time kitchen workflow synchronization, location-aware station routing.

### REF-006 — Restaurant POS
- **Source:** https://github.com/KirkGamo/restaurant_pos
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Floor & table management, menu structures, kitchen station routing, KOT (Kitchen Order Ticket), KDS display, shift management, cash drawer reconciliation, rapid onboarding setup flow, receipt printing.

### REF-007 — Multi-Tenant SaaS Architecture
- **Source:** https://github.com/Ahsankhalid618/multi-tenant-saas-architecture
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Tenant isolation boundaries, organization structures, RBAC (Role-Based Access Control), permission delegation flows, audit logging, multi-tenant security principles.

### REF-008 — Multi-Tenant POS SaaS
- **Source:** https://github.com/ZineddineBk09/multi-tenant-pos-saas
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** SaaS POS structure, strict tenant data isolation, monorepo organization, modular frontend/backend separation, security perimeter enforcement.

### REF-009 — Multi-Location Restaurant POS
- **Source:** https://github.com/satisfecho/pos
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Multi-location store management, restaurant groups, shared catalog vs. isolated store inventory, staff assignments, customer profiles, store-specific settings.

### REF-010 — Menu / Size / Topping UX
- **Source:** https://github.com/Zalo-MiniApp/zaui-bistro
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Menu browsing UX, product detail modals, size variants, topping groups and quantity increments/decrements, cart management, checkout flows, mobile-first visual design ideas.

### REF-011 — Restaurant POS Testing / Financial Integrity
- **Source:** https://github.com/Rajathtuesday/restaurant-pos
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** Tenant isolation testing, role enforcement tests, double-payment race condition mitigation, financial accuracy checks, idempotency verification, feature flags, reporting modules.

### REF-012 — SaaS Architecture Blueprint
- **Source:** https://github.com/saffirescale/scalable-multi-tenant-saas-architecture
- **Classification:** `REFERENCE ONLY — NOT AUTHORITY — NO CODE COPY — NO REQUIREMENT INHERITANCE`
- **Domain Focus:** C4 architecture modeling, multi-tenant data architecture, zero-trust security, horizontal scalability patterns, architectural review frameworks.

---

## PART B — REFERENCE → F&B SMART MODULE MAPPING

| Reference Domain | External Source Ref | F&B Smart V5.1 Target Module | Mapping & Integration Objective |
|:---|:---|:---|:---|
| **Offline / Outbox** | REF-001, REF-002, REF-003, REF-004 | Local Sync / Outbox Engine | Durable outbox pattern for offline POS orders, idempotent sync, and background retry queues. |
| **Table / Order / KDS / Shift** | REF-005, REF-006 | POS, Table Map, KDS, Shift Management | Floor plan seating, real-time KOT/KDS dispatch, shift cash drawer audits, and reconciliation. |
| **Tenant / Store / Membership / RBAC** | REF-007, REF-008, REF-009 | Core SaaS, Multi-Tenant Architecture, Lego Permissions | Tenant isolation, store membership linking, staff approval workflows, and granular role permissions. |
| **Catalog / Product / Size / Topping / Cart** | REF-010 | POS Catalog, Product Detail, Cart & Checkout | Intuitive product selection, multi-size pricing, topping quantity modifiers (`[-] [+]`), and clear cart summaries. |
| **Testing & Financial Integrity** | REF-011 | Financial Validation & Test Suites | Double-payment race condition prevention, Int64 currency accuracy, and tenant security test coverage. |
| **Architecture & Scalability** | REF-012 | Master Architecture & C4 Design | Clean architectural boundaries, scalable Firestore query cost budget adherence. |

---

## PART C — USEFUL IDEAS (NON-BINDING INSPIRATION)

1. **Durable Outbox Pattern (from REF-003 / REF-004):** Storing offline transaction mutations in a local SQLite/Hive outbox table before pushing to Firestore guarantees zero lost orders during intermittent network outages.
2. **Station-Based KDS Queues (from REF-005 / REF-006):** Categorizing kitchen items by preparation station (e.g., Hot kitchen vs. Bar) reduces order fulfillment latency.
3. **Lego Permission Toggles (from REF-007 / REF-008):** Granular permission toggles assigned per staff member provide flexible store operations without hardcoding rigid roles.
4. **Visual Table Status Indicators (from REF-006):** Color-coded table map states (Empty, Seated, Cleaning, Reserved) improve front-of-house table turnover efficiency.

---

## PART D — CONFLICTS / DIFFERENCES & RESOLUTION RULE

| Area of Potential Divergence | External Reference Approach | F&B Smart V5.1 Mandated Approach | Resolution / Governance Rule |
|:---|:---|:---|:---|
| **Currency Representation** | Floating-point or decimal types in foreign models. | Strict integer `Int64` (VND minor/base unit) to eliminate rounding errors. | **F&B Smart Authority Wins:** `Int64` is mandatory per Database Schema V0.1. |
| **Tenant Isolation Model** | Single-database collection sharing or custom application filters. | Strict Firestore document path scoping (`tenants/{tenantId}/stores/{storeId}/...`). | **F&B Smart Authority Wins:** Firestore path-based multi-tenancy is immutable. |
| **Offline Final Authority** | Local client-side optimistic finalization without server validation. | Server final authority with durable client outbox and state machine validation. | **F&B Smart Authority Wins:** Server validates and commits state transitions. |

---

## PART E — LICENSE & USAGE NOTES

1. **External Repositories Status:** All referenced GitHub repositories are public open-source educational or reference projects.
2. **Compliance Directive:**
   - **No code shall be copied or pasted** from any reference repository into F&B Smart codebase.
   - **Concepts and architectural patterns** (such as outbox pattern, KDS station routing, and tenant separation) are studied purely for conceptual design inspiration and validated against F&B Smart requirements (`PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`, `STATE_MACHINES_V0.1.md`).

---
*End of Reference Architecture Library V5.1*
