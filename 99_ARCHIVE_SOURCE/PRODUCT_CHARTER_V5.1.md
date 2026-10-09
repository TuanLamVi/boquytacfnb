# F&B SMART V5.1 - PRODUCT CHARTER

## 0. Kiểm soát tài liệu

| Thuộc tính | Giá trị |
|---|---|
| Dự án | F&B SMART V5 |
| Tài liệu | Product Charter |
| Phiên bản | V5.1 |
| Trạng thái | Baseline chính thức tại G0 |
| Ngày khóa PRE-G0 | 2026-08-12 |
| Người phê duyệt | Chủ đầu tư/Product Owner |
| Phạm vi | MVP F&B SMART V5 |

### 0.1 Quyết định cổng

Chủ đầu tư đã chính thức kết thúc PRE-G0 và cho phép chuyển sang G0 để tạo bốn tài liệu nền tảng. Quyết định này khóa phạm vi và định hướng sản phẩm; nó không phải bằng chứng rằng mã nguồn, Firebase, kiểm thử hay triển khai đã hoàn thành.

### 0.2 Nguyên tắc đọc tài liệu

- `Phải` và `không được` là yêu cầu bắt buộc.
- `TBD` là nội dung cần đo hoặc quyết định tại G0/G1, không được tự suy diễn thành đã hoàn tất.
- Mọi thay đổi làm lệch các quyết định đã khóa phải có Scope Expansion Request và phê duyệt của Chủ đầu tư.

## 1. Tầm nhìn sản phẩm

F&B SMART V5 là nền tảng SaaS bán hàng đa cửa hàng cho quán ăn, nhà hàng, quán cà phê, trà sữa và hộ kinh doanh nhỏ. Sản phẩm ưu tiên thao tác nhanh trên điện thoại, vận hành được khi mạng yếu, không ghi nhận trùng Gửi bếp hoặc Thanh toán, và giữ được dấu vết tài chính rõ ràng với nguồn lực phát triển nhỏ.

V5 được xây mới bằng repository và Firebase project mới. Hệ thống cũ chỉ dùng để tham khảo nghiệp vụ và lập kế hoạch migration; không sao chép nguyên file hoặc kiến trúc lỗi.

## 2. Khách hàng mục tiêu

### 2.1 Nhóm chính

- Quán ăn, quán cà phê, trà sữa và nhà hàng quy mô nhỏ hoặc vừa.
- Hộ kinh doanh tại khu vực mạng không ổn định.
- Cơ sở có 1-5 thiết bị vận hành đồng thời và khoảng 1-20 nhân viên.
- Cơ sở cần sơ đồ bàn, POS, KDS, ca bán hàng, thanh toán ghép và Công nợ Lite.

### 2.2 Nhóm chưa ưu tiên trong MVP

- Chuỗi lớn cần ERP/kế toán/kho chuyên sâu.
- Nhà hàng cần KDS hoạt động hoàn toàn qua LAN khi mất Internet.
- Mô hình cần khuyến mại phức tạp, marketing automation hoặc loyalty gắn trực tiếp vào checkout.

## 3. Vấn đề cần giải quyết

1. Nhân viên cần mở bàn, thêm món và gửi bếp nhanh trên điện thoại dọc.
2. Nhiều thiết bị thao tác đồng thời không được làm mất món hoặc tạo ticket trùng.
3. Mạng yếu hoặc ứng dụng bị tắt không được tạo trạng thái thành công giả.
4. Thanh toán ghép, công nợ và thu nợ phải tách rõ doanh thu với dòng tiền.
5. Sai phương thức thanh toán phải sửa bằng bút toán đối ứng, không sửa lịch sử.
6. Chủ quán cần báo cáo ngày dựa trên read model, không quét toàn bộ chứng từ.
7. Kiến trúc phải đủ rõ để 1-2 người cùng AI có thể bảo trì mà không vá chồng chéo.

## 4. Hiến pháp V5

Sáu điều sau không được tự ý thay đổi:

1. Sử dụng repository và Firebase project mới; hệ thống cũ chỉ để tham khảo và migration.
2. Sơ đồ bàn và Order ưu tiên điện thoại dọc, một vùng chính. POS quầy ưu tiên tablet/web, có thể dùng bố cục Menu 2/3 - Giỏ hàng 1/3.
3. Loyalty không chạy trong Order, Gửi bếp hoặc Thanh toán. POS chỉ sinh mã nhận điểm và tiếp nhận voucher đã xác minh khi module Loyalty được xây riêng.
4. Công nợ Lite và Thanh toán ghép là bắt buộc trong MVP.
5. Order dùng Header, Line documents, Operation/Command Receipt, Local Outbox và `mutationId`; không lưu toàn bộ món trong một array lớn và không triển khai CRDT tổng quát.
6. AI chỉ thay đổi file trong allowlist được duyệt; mở rộng phạm vi phải có Scope Expansion Request.

## 5. Vai trò người dùng

| Vai trò | Trách nhiệm chính | Quyền nhạy cảm điển hình |
|---|---|---|
| Primary Owner | Quản trị cao nhất, phê duyệt repair và cấu hình tài chính | `manage_store`, `view_financials`, `view_audit`, `adjust_after_close` |
| Manager | Quản lý ca, nhân sự, điều chỉnh và đối soát | `close_shift`, `manage_debt`, `adjust_payment`, `approve_return` |
| Cashier | Checkout, thanh toán, in hóa đơn | `begin_checkout`, `post_invoice`, `confirm_payment` |
| Waiter | Mở bàn, tạo/sửa món nháp, gửi bếp, phục vụ | `create_order`, `edit_draft_order`, `submit_order` |
| Kitchen/Chef | Nhận, chế biến, sẵn sàng và phục vụ ticket | `update_kds` |
| Auditor | Đọc báo cáo và audit theo quyền | `view_audit`, có thể kèm `view_financials` |
| System Principal | Expirer, Projector, Detect/Reconcile được duyệt | Chỉ actor allowlist và command contract hệ thống |

Vai trò là cấu hình theo Store. Mọi command phải kiểm tra Store, Device, Membership, Role và Permission đang active.

## 6. Phạm vi MVP

- Đăng ký, đăng nhập, OTP, quên mật khẩu và hoàn tất hồ sơ.
- Tạo cửa hàng; nhân viên gia nhập bằng mã; vai trò và phân quyền.
- Danh mục, món, size/topping, barcode, trạm bếp.
- Sơ đồ bàn và trạng thái `available/occupied/cleaning`.
- Order trên điện thoại dọc; POS trên tablet/web.
- Gửi bếp theo lô và KDS theo station.
- Trả món đã gửi bếp bằng quy trình yêu cầu/phê duyệt.
- Hóa đơn, tiền mặt, VietQR/chuyển khoản, thanh toán ghép.
- Payment Reference Claim chống tái sử dụng giao dịch ngân hàng.
- Công nợ Lite: ghi nợ, thu nợ FIFO, đối soát từng khoản gốc.
- Unallocated Funds cho tiền đến muộn hoặc tiền chưa phân loại.
- Điều chỉnh phương thức thanh toán; đảo hóa đơn; nghĩa vụ và thực hiện hoàn tiền.
- Ca bán hàng, tiền vào/ra thủ công, in hóa đơn và audit.
- Báo cáo doanh thu, dòng tiền và công nợ cơ bản qua Daily Summary.
- Local Outbox và Receipt reconciliation cho command được phép queue offline.

## 7. Ngoài phạm vi MVP

- Loyalty chạy trực tiếp trong POS.
- Kho và kế toán chuyên sâu.
- Đặt món QR tại bàn.
- NFC/tap-to-pay.
- Marketing automation và khuyến mại phức tạp.
- Hoàn tiền khác phương thức gốc.
- Tự động đối soát ngân hàng đầy đủ hoặc webhook đa nhà cung cấp.
- KDS hoàn toàn qua LAN khi mất Internet.
- Tự động xử lý tiền dư như tín dụng khách hàng.
- Reversal vượt giới hạn một transaction; xử lý đặc biệt thuộc phase sau.

## 8. Luồng nghiệp vụ sống còn

### 8.1 Dine-in

1. Mở bàn `available -> occupied` và tạo Order.
2. Thêm/sửa món nháp.
3. `submitKitchen` lấy toàn bộ draft ở backend, chia ticket theo station và kích thước.
4. KDS cập nhật Ticket và Lines atomically.
5. Trả món đã gửi bếp phải qua ReturnLine và quyền phê duyệt.
6. `beginCheckout` dựng fence; Outbox chưa đồng bộ phải được giải quyết trước.
7. `postInvoice` tạo Invoice/InvoiceLines bất biến.
8. Thanh toán một hoặc nhiều phần. Khi Invoice paid, Order closed và bàn chuyển cleaning.
9. Nhân viên `markTableClean` để bàn trở lại available.

### 8.2 Takeaway

Luồng Order, Kitchen, Invoice và Payment giống dine-in nhưng `tableId` phải absent và không đọc/ghi TableState.

### 8.3 Công nợ

- Ghi nợ tạo Settlement method `debt`, DebtOrigination và DebtEntry; không tạo CashEntry.
- Thu nợ phân bổ FIFO vào tối đa 50 Originations, tạo DebtCollectionAllocation cho từng khoản.
- Thu nợ tăng dòng tiền nhưng không tăng doanh thu lần hai.

### 8.4 Điều chỉnh và đảo/hoàn

- Điều chỉnh phương thức tiêu thụ Settlement gốc, tạo reversal và replacement Settlement bằng nhau về trị tuyệt đối.
- Dòng tiền mặt vật lý sau khi ca gốc đóng dùng command riêng trong ca hiện hành.
- Đảo Invoice tạo Reversal Invoice/Lines, tiêu thụ Active Settlements, giải phóng nợ chưa thu và tạo RefundObligations cho tiền đã thu.
- Hoàn tiền thành công mới tạo RefundEntry; tiền mặt hoàn atomically trong ca mở, ngân hàng theo quy trình bất đồng bộ.

## 9. Nguyên tắc giao diện theo thiết bị

### 9.1 Điện thoại dọc

- Ưu tiên sơ đồ bàn và Order.
- Một vùng chính, thao tác chạm rõ ràng, tránh modal che toàn màn hình không cần thiết.
- Trạng thái đồng bộ phải hiển thị trung thực: đang chờ, xung đột, bị từ chối hoặc đã đồng bộ.

### 9.2 Tablet và Web

- Ưu tiên POS quầy và quản trị.
- Có thể dùng Menu 2/3 - Giỏ hàng 1/3 khi chiều rộng cho phép.
- KDS theo station, giới hạn ticket hiển thị và cảnh báo quá tải.

### 9.3 Kết quả UI

- Chỉ hiển thị thành công sau khi có response/Receipt hợp lệ.
- `business_no_op` được trình bày như kết quả an toàn, không giả định có mutation mới.
- Conflict yêu cầu refresh và nhập lại trong MVP; không tự ghi đè.

## 10. Nguyên tắc offline và phục hồi

- Mặc định command là `online_required`.
- Queueable allowlist: `addLine`, `adjustDraftQuantity`, `cancelDraftLine`, `submitKitchen`, `requestReturn`, các KDS transitions, `openTableOrder`, `markTableClean`.
- Financial, Debt, Refund, Checkout quan trọng và Admin commands luôn online-required.
- Online-required vẫn ghi encrypted Outbox row trước khi dispatch để phục hồi sau crash/timeout.
- Outbox giữ Actor/Device bất biến, mã hóa AES-GCM bằng khóa hệ điều hành, và serialize theo nhiều aggregate keys.
- Kết quả mơ hồ phải point-get Receipt trước khi resend.
- Backend là nguồn sự thật duy nhất của `requestHash`.
- Không có Receipt mới được phép retry hoặc abandon theo đúng race contract.

## 11. Nguyên tắc bảo mật và riêng tư

- Firebase Auth và App Check bắt buộc cho user commands.
- Tenant isolation theo `storeId`; backend xác minh mọi liên kết Store.
- Client không ghi trực tiếp business/financial ledger.
- Payment account configuration và account fingerprint là backend-only; client nhận DTO đã che thông tin.
- Provider reference thô không ghi Audit/Logs; chỉ giữ hash hoặc safe metadata.
- Receipt recovery sau thu hồi quyền chỉ cho actor point-get chính mutation của mình; cấm list/query.
- Audit dùng `summaryCode + safeMetadata`, không chứa phone hoặc bank reference.
- PII chia lớp `PROFILE_PII`, `FINANCIAL_PII`, `SECURITY_SENSITIVE`; snapshot nhạy cảm được miễn index.
- Ledger, Audit và Receipt không hard-delete trong MVP.

## 12. Bất biến nghiệp vụ bắt buộc

1. Một `mutationId` chỉ có một canonical result cho một request hash.
2. Món draft được sửa/hủy; món submitted không bị xóa trực tiếp.
3. Kitchen Ticket deterministic không được tạo trùng.
4. Không báo bếp nhận nếu Ticket chưa acknowledged trên server.
5. Order finalized/closed không sửa Lines.
6. Invoice đã post không sửa/xóa core fields.
7. `allocatedAmount >= 0`, `pendingReservedAmount >= 0`, và tổng hai giá trị không vượt `faceValue`.
8. Invoice paid khi `faceValue == 0` hoặc `allocatedAmount == faceValue && pendingReservedAmount == 0`.
9. Debt không phải tiền thực thu.
10. Thu nợ không tăng doanh thu lần hai.
11. Adjustment không đổi Invoice allocation hoặc doanh thu.
12. Settlement chỉ sinh từ nguồn hợp lệ và là bất biến.
13. Không Settlement từ PaymentAttempt không ở `success`.
14. Claim ngân hàng/outgoing claim chỉ có một owner hợp lệ.
15. Mọi số tiền là Int64 VNĐ; kiểm tra overflow trước phép toán.
16. PaymentAttempt terminal không giải phóng reservation/counter lần hai.
17. Shift đóng không được sửa totals; sai lệch xử lý bằng report/compensation.
18. Revenue chỉ phát sinh từ Sale Invoice và Reversal Invoice.
19. Dòng tiền của Unallocated Fund chỉ ghi một lần khi nhận; allocation không tăng dòng tiền lần hai.
20. Không hiển thị đồng bộ thành công giả khi offline.

## 13. Chỉ tiêu hiệu năng và quy mô

| Chỉ tiêu | Mục tiêu thiết kế | Cách xác minh tại G0/G1 |
|---|---:|---|
| Lines tối đa/Order | 200 | Emulator transaction/load test |
| Items tối đa/Kitchen Ticket | 50 và <= 500 KiB | Payload measurement |
| Settlements tối đa/Invoice | 20 | Backend guard |
| Open Originations/Customer | 50 | DebtAccount counter + query |
| Allocations/DebtCollection | 50 | Transaction guard |
| Active KDS query | 50/tải | Query Explain + overload warning |
| Financial transaction request | < 8 MiB safety target | Emulator/Cloud measurement |
| Projector lag | <= 10 phút | Monitoring |
| Expiration lag | <= 5 phút | Monitoring |
| Typical planning reads | 12.000/store/ngày estimate | Telemetry G0 pilot |
| Planning budget cap 1.000 Store | 509,01 USD/tháng | Billing export/forecast |

Mục tiêu trên là budget/guard thiết kế, không phải kết quả benchmark đã PASS.

## 14. Tiêu chí nghiệm thu G0

G0 chỉ được xem xét PASS khi có bằng chứng tối thiểu:

- Bốn tài liệu baseline được phê duyệt và liên kết nhất quán.
- Repository/Firebase mới chỉ được tạo sau lệnh riêng của Chủ đầu tư.
- Allowlist file và Scope Expansion workflow được thiết lập.
- Emulator chứng minh idempotency, cross-aggregate linkage và terminal counter release.
- Query/index manifest được kiểm tra bằng Query Explain cho các query trọng yếu.
- Transaction 200 Lines và reversal worst-case được đo kích thước thực tế.
- Security Rules/Backend authorization tests chứng minh tenant isolation.
- Cost telemetry pilot thay thế các giả định trung bình bằng số đo.

## 15. Rủi ro và biện pháp

| ID | Mức | Rủi ro | Biện pháp bắt buộc |
|---|---|---|---|
| R-01 | P0 | Giao dịch ngân hàng bị claim hai lần | Registry global, backend normalization/hash, invariant check |
| R-02 | P0 | Reservation/counter giảm hai lần | Terminal no-op/conflict và transaction Attempt-Invoice-Shift |
| R-03 | P0 | Sai Order/Table link khi paid | Branch dine-in/takeaway và link hai chiều |
| R-04 | P0 | Double-count revenue/cash flow | Immutable ledger + versioned Contributions |
| R-05 | P1 | Reverse transaction quá lớn | Caps, preflight < 8 MiB và command riêng phase sau |
| R-06 | P1 | Hot document Summary/Counter | Projector, cursor, contention telemetry; không coi revision conflict là retryable |
| R-07 | P1 | Listener/reconnect làm tăng reads | Scope hẹp, cursor, offline persistence và telemetry |
| R-08 | P1 | Outbox gửi chéo tài khoản | Actor/device lock và encryption AAD |
| R-09 | P1 | Repair phá ledger/ca đóng | Detect/Repair tách biệt; ledger immutable; closed Shift compensation only |
| R-10 | P2 | Giá cloud thay đổi | Pricing effective date và cập nhật budget định kỳ |

## 16. Quyết định đã khóa

- Firestore Standard tại `asia-southeast1` là baseline lập ngân sách.
- Backend-only business writes và immutable financial ledger.
- Store-scoped Receipt cho business commands; actor point-get recovery only.
- Four-state PaymentAttempt: `pending_confirmation`, `success`, `expired`, `cancelled`.
- Shift ownership lấy từ ShiftLock theo device; không tin `shiftId` client.
- Business date tách nguồn theo Invoice, Shift, Fund, Refund và Reversal.
- Daily Summary dùng immutable/versioned Contribution + Projector.
- Budget cap do Chủ đầu tư phê duyệt: 509,01 USD/tháng tại quy mô 1.000 Store theo planning model.

## 17. TBD và giả định cần xác minh tại G0

- Đo request-size và index fanout bằng Emulator cho 200 Lines/reversal worst-case.
- Xác định provider integration cụ thể cho VietQR/bank transfer và chính sách retention raw reference ngoài Firestore nếu cần.
- Đo command reads thực tế thay cho average planning model.
- Chốt chiến lược customerCode sau MVP.
- Chốt thời gian retention/archival dài hạn và backup/PITR.
- Chốt Functions generation, CPU/memory/concurrency và vùng triển khai trước khi thay reserve bằng forecast thực đo.
- Xác nhận số lượng debt customers tối đa trên một Invoice hoặc bổ sung guard cùng customer.

## 18. Phê duyệt

```text
PRE-G0 GOVERNANCE GATE: CLOSED BY OWNER
G0 DOCUMENT BASELINE: CREATED
IMPLEMENTATION STATUS: NOT STARTED
REPOSITORY CREATED: NO
FIREBASE CHANGED: NO
CODE IMPLEMENTED: NO
```
