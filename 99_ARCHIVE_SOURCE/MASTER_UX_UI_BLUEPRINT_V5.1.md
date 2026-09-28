# F&B SMART V5.1 — MASTER UX/UI BLUEPRINT

## DOCUMENT METADATA & STATUS
- **Project:** F&B Smart V5.1 (SaaS Multi-Tenant POS & Management Suite)
- **Document Type:** Master UX/UI Design Blueprint (Product Specification)
- **Target Audience:** Product Owner (Tuấn), UX/UI Design Team, Architecture & Engineering Team
- **Build Mode:** Clean Rebuild V5.1 (Design Phase)
- **Status:** `PROPOSED / PO DECISION REQUIRED`
- **Source of Truth Reference:** `PRODUCT_CHARTER_V5.1.md`, `DATABASE_SCHEMA_V0.1.md`

---

## UX CORE PRINCIPLE

F&B Smart V5.1 is engineered as a **SaaS Multi-Tenant** operational platform.
The paramount UX philosophy is:

> **"Người mới tạo quán có thể thiết lập rất nhanh và bắt đầu bán hàng mà không cần hiểu kỹ thuật."**
> *(A newly registered store owner can set up rapidly and start selling without technical complexity.)*

### Key UX Directives:
1. **Ít bước (Fewer Steps):** Minimize friction in onboarding, checkout, and ordering flows.
2. **Dễ hiểu (Intuitive):** Zero technical jargon; clear, everyday F&B terminology.
3. **Ít chữ (Minimal Text):** Visual hierarchy over dense paragraphs; concise labels.
4. **Nút rõ (Prominent Actions):** Primary CTA buttons are high-contrast, large touch targets (optimized for both mobile phones and 10-inch POS tablets).
5. **Thao tác nhanh (Lightning Speed):** Single-tap or dual-tap actions for common POS tasks (ordering items, adding toppings, cash checkout).

---

## PART A — MASTER INFORMATION ARCHITECTURE (IA)

```
[SaaS Platform (Multi-Tenant)]
 ├── Auth & Identity (Phone + OTP)
 │    ├── Owner Onboarding ──> Store Creation ──> Quick Setup Wizard
 │    └── Employee Onboarding ──> Store Join Request ──> Owner Approval & Lego Permissions
 │
 ├── Tenant / Store Context (Always visible switcher / active store indicator)
 │    ├── Dashboard (Operational Overview: Revenue, Tables, Orders, KDS Queue)
 │    ├── Table Map (Area / Floor Management, Table Status: Empty, Seated, Cleaning, Reserved)
 │    ├── POS / Order Management
 │    │    ├── Catalog Grid (Categories & Items)
 │    │    ├── Product Detail Modal (Size selection, Topping groups, Quantity adjustment [- / +])
 │    │    ├── Cart & Order Summary (Line items breakdown with individual options)
 │    │    └── Checkout & Payment Hub
 │    │         ├── Cash (Quick denomination calculator)
 │    │         ├── payOS / QR Code (Dynamic QR generation & instant webhook polling)
 │    │         ├── Split Payment (By item, by guest, custom split)
 │    │         └── Debt Lite (Customer credit recording & repayment tracking)
 │    │
 │    ├── Kitchen Display System (KDS)
 │    │    └── Station-based queue (Pending → Processing → Ready)
 │    │
 │    ├── Back-Office Management
 │    │    ├── Staff Management & Lego Permission Assignment
 │    │    ├── Catalog / Menu Management (Categories, Items, Prices, Toppings, Sizes)
 │    │    ├── Customer Profile & Loyalty Gate / Waiting
 │    │    ├── Shift Management (Open shift, Cash drawer audit, Handover, Close shift)
 │    │    └── Reports (Revenue summary, Product sales, Payment methods)
 │    │
 │    └── Settings & Administration
 │         ├── Store Profile & Printer / Hardware Config
 │         └── SaaS Administration (Superadmin views, tenant subscriptions)
 │
 └── System States Layer (Offline indicator, Loading skeletons, Empty states, Error handling)
```

---

## PART B — USER FLOWS

### FLOW 01 — REGISTRATION
```
[Open App / Splash]
       │
       ▼
[Enter Phone Number] ──(Invalid format)──> [Inline Error: SĐT không hợp lệ]
       │
       ▼ (Tap "Gửi OTP")
[OTP Verification Screen] (6-digit input)
       │
       ├─(Invalid / Expired)─> [Resend OTP / Error Banner]
       │
       ▼ (OTP Verified Successfully)
[Role Selection Screen]
       │
       ├─► [Chủ quán] ────► Proceeds to FLOW 02 (Owner Onboarding)
       │
       └─► [Nhân viên] ───► Proceeds to FLOW 03 (Employee Onboarding)
```

### FLOW 02 — OWNER ONBOARDING
```
[OTP Verified + Selected: Chủ quán]
       │
       ▼
[Owner Profile & Store Creation Screen]
  - Tên quán (Store Name) [Required]
  - Địa chỉ (Address) [Required]
  - SĐT quán (Store Phone) [Required]
  - SĐT phụ (Secondary Phone) [Optional]
       │
       ▼ (Tap "Tạo quán / Create Store")
[Dashboard (Empty State)]
       │
       ▼ (Automatic Trigger)
[Quick Setup Popup / Wizard]
  - Presents 20 Business Models (e.g., Quán Cà phê, Quán Bún/Phở, Quán Nhậu, Tiệm Trà sữa, v.v.)
       │
       ▼ (Tap "Chọn mô hình / Choose Model")
[Starter Data Generation Animation]
  - Automatically provisions:
    • Menu Template aligned with model
    • ~15 sample items with preset prices
    • Appropriate topping groups (e.g., Trứng chần, Rau thêm, Trân châu)
    • 1 default area ("Tầng trệt" / "Khu chính")
    • 10 sample tables (Bàn 01 → Bàn 10)
       │
       ▼
[Ready to Sell!] ──> Dismisses to Main Dashboard / POS
```

### FLOW 03 — EMPLOYEE ONBOARDING
```
[OTP Verified + Selected: Nhân viên]
       │
       ▼
[Employee Profile Setup]
  - Họ tên đầy đủ (Full Name) [Required]
  - SĐT phụ (Secondary Phone) [Optional]
       │
       ▼
[Enter Store Code (Mã quán)]
       │
       ▼ (Tap "Gửi yêu cầu gia nhập")
[Waiting for Approval State] ("Đang chờ Chủ quán duyệt...")
       │
       ├── (Owner Action: Approves & Assigns Lego Permissions)
       │
       ▼
[Active Employee View] (Access granted according to assigned Lego permissions)
```

---

## PART C — SCREEN INVENTORY (31 MODULES)

| No. | Module Name | Primary User | Purpose | Core Action |
|:---:|:---|:---|:---|:---|
| 1 | Registration / OTP | All Users | Authenticate identity via phone | Enter phone & 6-digit OTP |
| 2 | Owner Onboarding | Store Owner | Register new store entity | Input store details & create |
| 3 | Employee Onboarding | Staff | Request join access to a store | Enter store code & wait approval |
| 4 | Quick Setup Wizard | Store Owner | Rapid initial configuration | Pick business model & auto-seed |
| 5 | Business Model Selection | Store Owner | Choose F&B typology (20 models) | Select template profile |
| 6 | Menu Template Preview | Store Owner | Preview starter items & toppings | Inspect & accept seed data |
| 7 | Dashboard | Store Owner / Manager | Operational overview at a glance | View KPIs, tables, pending orders |
| 8 | Table Map | Cashier / Waitstaff | Visual seating & table management | Open table, check status, move table |
| 9 | POS / Order Screen | Cashier / Waitstaff | Core ordering interface | Browse catalog, tap item, add to cart |
| 10 | Product Detail Modal | Cashier / Waitstaff | Customize item attributes | Select size, toggle toppings |
| 11 | Size Selection | Cashier / Waitstaff | Choose pricing tier by size | Tap size option (Nhỏ/Vừa/Lớn) |
| 12 | Topping Selection | Cashier / Waitstaff | Add optional extras | Toggle checkboxes |
| 13 | Topping Quantity Modal | Cashier / Waitstaff | Adjust quantity per topping | Tap `[-]` or `[+]` buttons |
| 14 | Cart & Order Summary | Cashier / Waitstaff | Review selected items before send | Edit quantities, view total |
| 15 | Kitchen / KDS | Kitchen Staff | Order queue execution | Update status (Pending → Doing → Ready) |
| 16 | Checkout Hub | Cashier | Payment processing gateway | Choose payment method |
| 17 | Cash Payment | Cashier | Handle physical cash | Enter received amount, calculate change |
| 18 | payOS / QR Payment | Cashier | Digital QR transfer | Display dynamic QR, poll webhook |
| 19 | Split Payment | Cashier | Divide bill among multiple guests | Split by item or equal portions |
| 20 | Debt Lite | Cashier / Owner | Customer credit recording | Record tab for trusted patrons |
| 21 | Staff Management | Store Owner | Manage store employees | View staff list, approve/reject join |
| 22 | Lego Permission Assignment | Store Owner | Granular role-based access control | Check/uncheck permission toggles |
| 23 | Catalog Management | Store Owner / Manager | CRUD menu items, prices, categories | Add/edit dish, price, availability |
| 24 | Customer Profile | Cashier / Manager | View/edit patron info | Search by phone, view history |
| 25 | Loyalty Gate / Waiting | Customer / Staff | Membership rewards check | Verify points, apply discount |
| 26 | Shift Management | Cashier / Manager | Shift audit & cash drawer handover | Open/Close shift, count cash |
| 27 | Reports | Store Owner | Revenue & business analytics | View daily/weekly revenue charts |
| 28 | Settings | Store Owner | Hardware & printer config | Connect receipt printer, Bluetooth |
| 29 | SaaS Administration | Platform Admin | Multi-tenant platform control | Manage tenant subscriptions |
| 30 | Offline States | All Users | Network loss resilience | View offline banner, local queue |
| 31 | Error / Empty / Loading / Success | All Users | System state feedback | Skeletons, empty illustrations, toasts |

---

## PART D — KEY SCREEN WIREFRAME DESCRIPTIONS

### 1. Dashboard Screen
- **Header:** Active Store Name (dropdown to switch stores if multi-tenant), Current User Avatar, Notification Bell.
- **Top Metrics Cards (2x2 Grid):**
  - Doanh thu hôm nay (Today's Revenue): `2.450.000đ` (Green accent)
  - Bàn đang phục vụ (Active Tables): `6 / 10`
  - Đơn đang xử lý (Processing Orders): `3`
  - Món chờ bếp (Kitchen Queue): `5 items`
- **Quick Action Bar:** Large buttons for `[+ Bán hàng nhanh (POS)]`, `[Sơ đồ bàn]`, `[Bếp (KDS)]`, `[Báo cáo]`.
- **Activity Stream / Action Items:** List of tables requiring attention (e.g., "Bàn 04 chờ thanh toán", "Bàn 07 món đã xong").

### 2. POS / Order Screen (Split View on Tablet / Single View on Phone)
- **Left Panel (Catalog):**
  - Search bar (`Tìm món...`)
  - Horizontal Category Filter pills (`Tất cả`, `Món chính`, `Đồ uống`, `Topping`, `Khác`)
  - Item Grid: Cards with Product Image placeholder, Name, Price (`50.000đ`), and quick add tap target.
- **Right Panel (Cart & Active Table):**
  - Header: Table indicator (`Đang chọn: Bàn 03 — Tầng trệt`)
  - Cart Item List (Scrollable):
    - Product Name, Quantity controls, Price.
    - Attached options indented below (e.g., `+ Trứng chần ×2`).
  - Footer summary: Total item count, Subtotal, `[Gửi bếp / In tạm tính]` (Secondary), `[Thanh toán ngay]` (Primary, high-contrast Orange/Green).

---

## PART E — QUICK SETUP UX

To achieve the SaaS goal of rapid onboarding without technical friction:
1. **Zero Configuration Blockers:** No tax setup, no complex inventory SKU entry required during setup.
2. **Preset Business Models (20 options):** Selecting "Quán Bún/Phở" instantly seeds:
   - Categories: Món nước, Nước giải khát, Thêm (Toppings).
   - Sample Items: Bún gà, Phở bò tái, Bún riêu cua, Trà đá, Coca.
   - Default Topping Groups: Trứng chần, Mọc thêm, Rau thơm đặc biệt.
   - Floor Plan: Khu vực chính (10 tables).
3. **Immediate Sellability:** Within 3 taps after entering store name, the user is looking at the live POS ready to take the first order.

---

## PART F — POS UX & PRODUCT EXAMPLE SPECIFICATION

### Product Customization UX (Detailed Specification)
When a user taps an item card (e.g., `Bún gà`), the **Product Detail Modal** pops up immediately:
```text
┌─────────────────────────────────────────┐
│ Bún gà                        [ X ]     │
│ 50.000đ                                 │
├─────────────────────────────────────────┤
│ Chọn kích thước (Size):                 │
│  ( ) Thường (50.000đ)                   │
│  (•) Tô đặc biệt (+15.000đ)             │
├─────────────────────────────────────────┤
│ Topping thêm:                           │
│  Trứng chần              [-]  2  [+]    │
│  Rau thêm                [-]  0  [+]    │
│  Quẩy giòn               [-]  0  [+]    │
├─────────────────────────────────────────┤
│ Ghi chú cho bếp:                        │
│ [ Nhập ghi chú (VD: Không hành...) ]    │
├─────────────────────────────────────────┤
│ [ Thêm vào giỏ (65.000đ) ]              │
└─────────────────────────────────────────┘
```

### Cart Display Rendering Rule
When the user configures **`Trứng chần = 2`**, the Cart & Checkout summary must explicitly render:
```text
Bún gà (Đặc biệt) ×1                65.000đ
  └── Trứng chần ×2                  10.000đ
```
*Rule:* Options/Toppings with quantity > 0 must be nested cleanly beneath the parent product item with clear quantity multiplier formatting (`×N`).

---

## PART G — KDS (KITCHEN DISPLAY SYSTEM) UX

- **Layout:** Columnar Kanban-style or Compact Card Grid categorized by preparation station (e.g., Bếp nóng, Quầy pha chế).
- **Color Coding by Elapsed Time:**
  - `0 - 10 mins`: Neutral White / Light Green (Normal)
  - `10 - 20 mins`: Soft Yellow / Amber (Warning)
  - `> 20 mins`: Soft Red / Coral (Overdue / Urgent)
- **Workflow Action:** One-tap transition on order card:
  `[Chờ làm]` ──(Tap)──> `[Đang làm]` ──(Tap)──> `[Hoàn tất / Báo món sẵn sàng]`

---

## PART H — PAYMENT UX

1. **Cash Payment:**
   - Big number keypad.
   - Quick denomination buttons (`50k`, `100k`, `200k`, `500k`, `Exact / Vừa đủ`).
   - Instant calculation of **Tiền thừa (Change due)** in large font.
2. **payOS / QR Payment:**
   - Generates dynamic VietQR / payOS QR code instantly on screen.
   - Real-time WebSocket / Firestore polling for webhook payment confirmation ("Thanh toán thành công" green success overlay with sound effect).
3. **Split Payment:**
   - Interface allows splitting bill by specific items assigned to guests, or dividing total evenly (`Chia đều 2 người`, `Chia đều 3 người`).
4. **Debt Lite (Sổ nợ):**
   - Quick lookup of regular customer by phone number.
   - One-tap recording of unpaid balance to customer ledger with due date reminder.

---

## PART I — STAFF & LEGO PERMISSION UX

- **Concept:** Modular permission blocks ("Lego").
- **Owner Permission Matrix UI:**
  - List of staff members.
  - Toggles for granular capabilities:
    - [x] Tạo đơn & Bán hàng (POS Create)
    - [ ] Hủy món / Giảm giá (Void & Discount) — *Restricted by default*
    - [x] Xem báo cáo doanh thu ngày
    - [ ] Mở két tiền mặt (Cash Drawer Access)
    - [x] Quản lý thực đơn (Catalog Edit)

---

## PART J — CUSTOMER & LOYALTY UX

- Customer search bar by phone number at checkout.
- Instant display of accumulated points, tier (Member, Silver, Gold), and applicable vouchers.
- Waiting list / Table reservation queue management for peak hours.

---

## PART K — ERROR, EMPTY, OFFLINE & LOADING STATES

- **Offline State:** Persistent non-intrusive top banner ("Đang ngoại tuyến — Dữ liệu sẽ đồng bộ khi có mạng"). Local operations permitted via local SQLite/Hive cache.
- **Empty States:** Friendly illustrations with clear primary action buttons (e.g., Empty Table Map → `[+ Theneg khu vực / bàn mới]`).
- **Loading States:** Shimmer skeletons for list views and item grids to prevent layout shifts.
- **Success States:** High-visibility toast messages and checkmark animations for completed payments or saved settings.

---

## PART L — PO DECISIONS REQUIRED

The following items are marked as `PROPOSED / PO DECISION REQUIRED / TBD` and require formal review and decision from PO Tuấn:

1. **[DECISION-UX-01]** Should employee onboarding require an automatic SMS verification code or manual store owner PIN approval? *(Proposed: Manual store owner approval + Store Code)*
2. **[DECISION-UX-02]** Should table merging and table splitting be exposed in the default POS view or restricted to supervisor permission? *(Proposed: Available for cashier, configurable via Lego permission)*
3. **[DECISION-UX-03]** Default currency display format (`50.000 đ` vs `50,000 VND`). *(Proposed: `50.000đ` as standard Vietnamese F&B convention)*

---
*End of Master UX/UI Blueprint V5.1*
