STATUS: DRAFT — REVIEW CANDIDATE
AUTHORITY: NOT YET ADOPTED
SOURCE: FORENSIC V1/V2 + EXISTING DOCS
DO NOT TREAT AS ACTIVE GOVERNANCE UNTIL PO APPROVAL
# MÔ HÌNH THẨM QUYỀN

## Vai trò
1. PO Tuấn: người duy nhất quyết định PO PASS/FAIL và PO_VERIFIED; PO quyết định adoption.
2. Bốn hợp đồng G0 — PRODUCT_CHARTER_V5.1, DATABASE_SCHEMA_V0.1, STATE_MACHINES_V0.1, FIRESTORE_QUERY_COST_BUDGET_V0.1 — áp dụng trong lĩnh vực riêng; V2 không sửa hoặc override.
3. Governance V2 là dự thảo quy trình cho Coding Agent; chỉ có hiệu lực sau adoption riêng.
4. Hồ sơ dự án ghi thông tin theo chức năng; hồ sơ không tự tạo quyết định.
5. Audit, snapshot, baseline là đánh giá/claim tại thời điểm và phạm vi ghi trong nguồn.
6. Coding Agent thực hiện trong phạm vi prompt, báo AI PASS và bằng chứng; chỉ ghi PO_VERIFIED sau PO PASS trực tiếp và lệnh ghi nhận riêng.
7. ChatGPT thẩm định bằng chứng, phạm vi, tiêu chí và tuân thủ; xác nhận READY_FOR_PO_VERIFICATION hoặc nêu phần thiếu. Không quyết định PO PASS/FAIL, không cấp PO_VERIFIED.

## Quyết định và ghi nhận
Quyền quyết định PO PASS/FAIL thuộc PO. READY_FOR_PO_VERIFICATION là cổng thẩm định hồ sơ của ChatGPT, không phải chấp nhận nghiệp vụ. Ghi PO_VERIFIED cần PO PASS trực tiếp và lệnh riêng, rõ ID/phạm vi. CHECKPOINTS ghi nhưng không cấp PO_VERIFIED. Evidence hỗ trợ, không quyết định. Audit finding không phải quyết định quản trị.

## Thứ tự và track
Dùng hợp đồng G0 cho đúng lĩnh vực. Governance điều chỉnh quy trình, không thay nội dung hợp đồng. Hồ sơ không override quyết định PO hoặc lẫn vai trò. Claim mâu thuẫn ghi UNRESOLVED; thiếu evidence ghi UNPROVEN; lựa chọn cần PO ghi CONFLICT REQUIRES PO DECISION.
Phạm vi hiện được nêu là phục hồi/cải tạo repository F&B SMART hiện hữu. Không tạo repo/project mới từ suy luận. Điều khoản Product Charter về repo/Firebase mới giữ nguyên; khả năng áp dụng vào đợt phục hồi cần PO quyết định.