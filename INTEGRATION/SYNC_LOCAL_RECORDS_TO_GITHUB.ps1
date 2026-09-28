param(
    [string]$Branch = "codex/migrate-kim-chi-nam-20260928",
    [string]$GovernanceRepo = "https://github.com/TuanLamVi/boquytacfnb.git"
)

$ErrorActionPreference = "Stop"

$ProjectRoot = (Get-Location).Path
$LocalRules = Join-Path $ProjectRoot "fnb-smart-v5"

if (-not (Test-Path $LocalRules)) {
    throw "Khong tim thay thu muc fnb-smart-v5."
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Chua tim thay Git."
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh auth status | Out-Host
    if ($LASTEXITCODE -ne 0) {
        throw "GitHub chua dang nhap. Hay chay: gh auth login"
    }
    gh auth setup-git | Out-Host
}

$SyncRoot = Join-Path $env:LOCALAPPDATA "FNB-SMART-GOVERNANCE"
$GovernanceClone = Join-Path $SyncRoot "boquytacfnb"

New-Item -ItemType Directory -Path $SyncRoot -Force | Out-Null

if (-not (Test-Path (Join-Path $GovernanceClone ".git"))) {
    git clone --branch $Branch $GovernanceRepo $GovernanceClone
    if ($LASTEXITCODE -ne 0) {
        throw "Khong tai duoc governance repository."
    }
}
else {
    Push-Location $GovernanceClone
    try {
        $status = git status --porcelain
        if ($status) {
            throw "Bo governance tam dang co thay doi chua xu ly. Dung de tranh ghi de."
        }

        git fetch origin
        git checkout $Branch
        git pull --ff-only origin $Branch
        if ($LASTEXITCODE -ne 0) {
            throw "Khong cap nhat duoc governance clone."
        }
    }
    finally {
        Pop-Location
    }
}

$folders = @("00_KIM_CHI_NAM","01_STATE","02_CONTROL","03_EVIDENCE","05_SESSION")

# KIM_CHI_NAM.md is protected from automatic push.
$ProtectedRule = Join-Path $LocalRules "00_KIM_CHI_NAM/KIM_CHI_NAM.md"
$ProtectedHashBefore = $null
$CloneRule = Join-Path $GovernanceClone "00_KIM_CHI_NAM/KIM_CHI_NAM.md"

if (Test-Path $ProtectedRule) {
    $ProtectedHashBefore = (Get-FileHash $ProtectedRule -Algorithm SHA256).Hash
}
$CloneRuleHash = if (Test-Path $CloneRule) { (Get-FileHash $CloneRule -Algorithm SHA256).Hash } else { $null }

foreach ($folder in $folders) {
    $source = Join-Path $LocalRules $folder
    $target = Join-Path $GovernanceClone $folder

    if (-not (Test-Path $source)) { continue }

    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item (Join-Path $source "*") $target -Recurse -Force
}

$ProtectedHashAfter = if (Test-Path $ProtectedRule) { (Get-FileHash $ProtectedRule -Algorithm SHA256).Hash } else { $null }

if ($ProtectedHashBefore -ne $null -and $ProtectedHashAfter -ne $ProtectedHashBefore) {
    throw "Phat hien thay doi KIM_CHI_NAM.md. Sync thuong dung lai; khong push LAW tu dong."
}

Push-Location $GovernanceClone
try {
    git status --short

    $changes = git status --porcelain
    if (-not $changes) {
        Write-Host "Khong co thay doi can dong bo."
        exit 0
    }

    git add 00_KIM_CHI_NAM 01_STATE 02_CONTROL 03_EVIDENCE 05_SESSION
    git restore --staged 00_KIM_CHI_NAM/KIM_CHI_NAM.md 2>$null

    git commit -m "sync: update FNB SMART governance records"
    if ($LASTEXITCODE -ne 0) {
        throw "Commit that bai."
    }

    git push origin $Branch
    if ($LASTEXITCODE -ne 0) {
        throw "Push len GitHub that bai."
    }

    $head = git rev-parse HEAD

    Write-Host ""
    Write-Host "DONG BO THANH CONG"
    Write-Host "Repository: TuanLamVi/boquytacfnb"
    Write-Host "Branch: $Branch"
    Write-Host "Commit: $head"
}
finally {
    Pop-Location
}
