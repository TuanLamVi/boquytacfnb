# SYNC RULE

## Luồng hai chiều

### GitHub → máy

```
GitHub boquytacfnb
→ SYNC_GOVERNANCE_FROM_GITHUB.ps1
→ fnb-smart-v5
→ Codex/Gemini đọc
```

### Máy → GitHub

```
Codex/Gemini
→ cập nhật fnb-smart-v5
→ SYNC_LOCAL_RECORDS_TO_GITHUB.ps1
→ GitHub boquytacfnb
→ ChatGPT đọc được
```

## Cái gì được đồng bộ?

- 00_KIM_CHI_NAM
- 01_STATE
- 02_CONTROL
- 03_EVIDENCE
- 05_SESSION

Không đồng bộ mã ứng dụng.

## Đặc biệt

Thay đổi LAW/KIM CHỈ NAM không được tự động push bằng sync thường.
