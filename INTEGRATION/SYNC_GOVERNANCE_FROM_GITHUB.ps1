param(
    [string]$Branch = "codex/migrate-kim-chi-nam-20260928",
    [string]$GovernanceRepo = "https://github.com/TuanLamVi/boquytacfnb.git"
)

$ErrorActionPreference = "Stop"

$ProjectRoot = (Get-Location).Path
$LocalRules = Join-Path $ProjectRoot "fnb-smart-v5"

if (-not (Test-Path $LocalRules)) {
    throw "Khong tim thay fnb-smart-v5."
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Chua tim thay Git."
}

$SyncRoot = Join-Path $env:LOCALAPPDATA "FNB-SMART-GOVERNANCE-SYNC"
$Zip = Join-Path $env:TEMP "boquytacfnb-governance.zip"
$Temp = Join-Path $env:TEMP "boquytacfnb-governance-extract"

if (Test-Path $Zip) { Remove-Item $Zip -Force }
if (Test-Path $Temp) { Remove-Item $Temp -Recurse -Force }

Invoke-WebRequest -Uri "https://github.com/TuanLamVi/boquytacfnb/archive/refs/heads/$Branch.zip" -OutFile $Zip
Expand-Archive -Path $Zip -DestinationPath $Temp -Force

$Extracted = Get-ChildItem $Temp -Directory | Select-Object -First 1
if (-not $Extracted) {
    throw "Khong giai nen duoc governance package."
}

$BackupRoot = Join-Path $ProjectRoot ".backups/governance-sync-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
New-Item -ItemType Directory -Path $BackupRoot -Force | Out-Null

# Backup current local governance before overwriting.
Copy-Item $LocalRules $BackupRoot -Recurse -Force

$folders = @("00_KIM_CHI_NAM","01_STATE","02_CONTROL","03_EVIDENCE","05_SESSION")

foreach ($folder in $folders) {
    $source = Join-Path $Extracted.FullName $folder
    $target = Join-Path $LocalRules $folder

    if (-not (Test-Path $source)) { continue }

    if (Test-Path $target) {
        Remove-Item $target -Recurse -Force
    }

    Copy-Item $source $target -Recurse -Force
}

Write-Host ""
Write-Host "DONG BO TU GITHUB THANH CONG"
Write-Host "Branch: $Branch"
Write-Host "Ban sao luu cu:"
Write-Host $BackupRoot
