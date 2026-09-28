# CHECKPOINT MODEL — MÔ HÌNH CHECKPOINT VÀ PHONG TOẢ

## Chuỗi Đóng Work Item chuẩn (GOV-025)

```text
PASS
→ PO_VERIFIED
→ REGRESSION CHECK
→ PROTECTED
→ LOCKED
```

---

## Ý nghĩa của `LOCKED`

`LOCKED` nhằm bảo vệ:
- Hành vi đã được nghiệm thu;
- Quy tắc nghiệp vụ;
- Invariant & Constraints;
- Acceptance criteria;
- Bằng chứng kiểm thử (Evidence);
- Phạm vi đã được PO chấp nhận.

**LOCKED không có nghĩa là khóa cứng file vật lý.**

---

## Kiểm tra Tác động trước khi Thực hiện Task Mới (LOCKED SCOPE IMPACT)

Trước khi bắt đầu bất kỳ Work Item nào, bắt buộc phải phân tích:
```text
CURRENT A-STAGE / PHASE
TASK / WORK ITEM
RELATED STAGES / COMPONENTS
LOCKED SCOPE IMPACT
```

Kết quả phân tích:
- `NONE`: Có bằng chứng chắc chắn không ảnh hưởng vùng đã bảo vệ → Tiếp tục.
- `DETECTED`: Phát hiện khả năng ảnh hưởng → Yêu cầu `REGRESSION_CHECK` / Xin lệnh `UNLOCK` từ PO.
- `UNKNOWN`: Chưa đủ thông tin phân tích → Coi là `REGRESSION_RISK` + **STOP**.

---

## Quy trình Mở khóa (UNLOCK)

- Chỉ PO Tuấn có thẩm quyền ban hành lệnh `UNLOCK`.
- Lệnh `UNLOCK` phải ghi rõ:
  1. Lý do mở khóa;
  2. Phạm vi mở khóa giới hạn;
  3. Phân tích tác động;
  4. Kế hoạch kiểm thử hồi quy;
  5. Điều kiện tái phong tỏa (`RELOCK`).

---

## Ranh giới Checkpoint giữa Legacy và Clean Rebuild

- Legacy Checkpoints thuộc về hệ thống cũ và giữ nguyên trạng thái đóng băng (`FROZEN`).
- Clean Rebuild V5.1 áp dụng hệ thống Checkpoints độc lập. Tuyên bố Clean Rebuild PASS phải dựa trên evidence và PO Verification mới, không dùng checkpoint cũ của legacy.
