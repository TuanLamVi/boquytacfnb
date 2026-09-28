# AGENTS — F&B SMART V5

## Việc phải làm trước

Trước khi sửa code hoặc đưa ra quyết định kỹ thuật, hãy đọc:

1. `docs/boquytacfnb/00_KIM_CHI_NAM/AI_READ_FIRST.md`
2. `docs/boquytacfnb/00_KIM_CHI_NAM/KIM_CHI_NAM.md`
3. `docs/boquytacfnb/00_KIM_CHI_NAM/SOURCE_OF_TRUTH.md`
4. `docs/boquytacfnb/01_STATE/CURRENT_STATE.md`
5. `docs/boquytacfnb/02_CONTROL/CHECKPOINTS.md`
6. `docs/boquytacfnb/02_CONTROL/PROTECTION_MAP.md`
7. `docs/boquytacfnb/02_CONTROL/REGRESSION_LOG.md`
8. Tài liệu kỹ thuật liên quan trực tiếp đến việc đang làm.

## Quy tắc dễ nhớ

- Repository governance là nguồn chính.
- Không dùng trí nhớ AI để thay tài liệu trong repository.
- Không tự sửa KIM CHỈ NAM / LAW.
- Không tự ghi `PO_VERIFIED`.
- Không tự mở `LOCKED`.
- Không coi một việc con PASS là toàn bộ giai đoạn PASS.
- Phát hiện lỗi hồi quy ở phần đã bảo vệ → STOP.
- Không xóa lịch sử.
- Sau Work Item phải cập nhật đúng hồ sơ và ghi lịch sử Git.

## Vai trò

- Tuấn = PO / người quyết định.
- ChatGPT = trợ lý PO / người kiểm tra và chuẩn bị hướng dẫn.
- Codex/Gemini = người hỗ trợ thực hiện trong đúng phạm vi.

## Nếu thiếu thông tin

Không đoán.

Báo `UNPROVEN / BLOCKED` và dừng khi chưa đủ thông tin bắt buộc.
