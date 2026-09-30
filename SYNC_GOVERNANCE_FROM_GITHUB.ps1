param([string]$Branch="codex/migrate-kim-chi-nam-20260928")
$ErrorActionPreference="Stop"
$RepoZip="https://github.com/TuanLamVi/boquytacfnb/archive/refs/heads/$Branch.zip"
$Temp=Join-Path $env:TEMP "boquytacfnb-sync"
$Zip=Join-Path $env:TEMP "boquytacfnb.zip"
if(Test-Path $Temp){Remove-Item $Temp -Recurse -Force}
if(Test-Path $Zip){Remove-Item $Zip -Force}
Invoke-WebRequest -Uri $RepoZip -OutFile $Zip
Expand-Archive -Path $Zip -DestinationPath $Temp -Force
$Root=(Get-ChildItem $Temp -Directory | Select-Object -First 1).FullName
$Target=Join-Path (Get-Location) "docs/boquytacfnb"
New-Item -ItemType Directory -Path $Target -Force | Out-Null
foreach($name in @("00_KIM_CHI_NAM","01_STATE","02_CONTROL","03_EVIDENCE","05_SESSION")){Copy-Item (Join-Path $Root $name) $Target -Recurse -Force}
Write-Host "Da dong bo governance tu GitHub branch: $Branch"
