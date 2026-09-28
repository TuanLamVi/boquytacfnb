# Đồng bộ bộ KIM CHỈ NAM từ GitHub xuống Android Studio
# Chạy script này từ thư mục ngoài cùng của project F&B SMART.
#
# Yêu cầu:
# - PowerShell 5+ hoặc PowerShell 7
# - Internet
#
# Script này chỉ tải bộ governance về thư mục:
# docs/boquytacfnb
#
# Nó KHÔNG sửa source code ứng dụng.

$ErrorActionPreference = "Stop"

$RepoZip = "https://github.com/TuanLamVi/boquytacfnb/archive/refs/heads/main.zip"
$Root = Get-Location
$Temp = Join-Path $env:TEMP "boquytacfnb-governance-sync"
$Zip = Join-Path $env:TEMP "boquytacfnb-main.zip"

if (Test-Path $Temp) { Remove-Item $Temp -Recurse -Force }
if (Test-Path $Zip) { Remove-Item $Zip -Force }

Write-Host "Tai bo governance tu GitHub..."
Invoke-WebRequest -Uri $RepoZip -OutFile $Zip

Expand-Archive -Path $Zip -DestinationPath $Temp -Force

$Extracted = Get-ChildItem $Temp -Directory | Select-Object -First 1
$Source = Join-Path $Extracted.FullName "00_KIM_CHI_NAM"

$Target = Join-Path $Root "docs/boquytacfnb"

New-Item -ItemType Directory -Path $Target -Force | Out-Null

Write-Host "Dong bo tai lieu..."
Copy-Item (Join-Path $Extracted.FullName "00_KIM_CHI_NAM") $Target -Recurse -Force
Copy-Item (Join-Path $Extracted.FullName "01_STATE") $Target -Recurse -Force
Copy-Item (Join-Path $Extracted.FullName "02_CONTROL") $Target -Recurse -Force
Copy-Item (Join-Path $Extracted.FullName "03_EVIDENCE") $Target -Recurse -Force
if (Test-Path (Join-Path $Extracted.FullName "05_SESSION")) {
    Copy-Item (Join-Path $Extracted.FullName "05_SESSION") $Target -Recurse -Force
}

Write-Host ""
Write-Host "Xong. Governance da duoc dong bo vao:"
Write-Host $Target
Write-Host ""
Write-Host "Luu y: AGENTS.md phai nam o thu muc ngoai cung cua project."
