param(
    [string]$Branch = "codex/migrate-kim-chi-nam-20260928"
)

$ErrorActionPreference = "Stop"

$RepoZip = "https://github.com/TuanLamVi/boquytacfnb/archive/refs/heads/$Branch.zip"
$Root = Get-Location
$Temp = Join-Path $env:TEMP "boquytacfnb-governance-sync"
$Zip = Join-Path $env:TEMP "boquytacfnb-governance.zip"

if (Test-Path $Temp) { Remove-Item $Temp -Recurse -Force }
if (Test-Path $Zip) { Remove-Item $Zip -Force }

Write-Host "Dang tai bo quy tac tu GitHub..."
Write-Host "Branch: $Branch"

Invoke-WebRequest -Uri $RepoZip -OutFile $Zip
Expand-Archive -Path $Zip -DestinationPath $Temp -Force

$Extracted = Get-ChildItem $Temp -Directory | Select-Object -First 1
$SourceRoot = $Extracted.FullName

$Required = @(
    "00_KIM_CHI_NAM",
    "01_STATE",
    "02_CONTROL",
    "03_EVIDENCE",
    "05_SESSION"
)

foreach ($name in $Required) {
    $source = Join-Path $SourceRoot $name
    if (-not (Test-Path $source)) {
        throw "Khong tim thay thu muc bat buoc: $name"
    }
}

$Target = Join-Path $Root "docs/boquytacfnb"
New-Item -ItemType Directory -Path $Target -Force | Out-Null

Write-Host "Dang dong bo tai lieu..."
foreach ($name in $Required) {
    Copy-Item (Join-Path $SourceRoot $name) $Target -Recurse -Force
}

Write-Host ""
Write-Host "HOAN TAT"
Write-Host "Tai lieu da duoc dong bo vao:"
Write-Host $Target
Write-Host ""
Write-Host "AGENTS.md phai nam o thu muc ngoai cung cua project F&B SMART."
Write-Host "Khi bo quy tac da duoc merge vao main, co the chay:"
Write-Host ".\SYNC_GOVERNANCE_FROM_GITHUB.ps1 -Branch main"
