param(
    [string]$Branch = "codex/migrate-kim-chi-nam-20260928",
    [string]$GovernanceRepo = "https://github.com/TuanLamVi/boquytacfnb.git"
)

$ErrorActionPreference = "Stop"

$ProjectRoot = (Get-Location).Path
$LocalDocs = Join-Path $ProjectRoot "docs/boquytacfnb"

if (-not (Test-Path $LocalDocs)) {
    throw "Khong tim thay docs/boquytacfnb. Hay cai bo governance vao project truoc."
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Chua tim thay Git."
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh auth status
    if ($LASTEXITCODE -ne 0) {
        throw "GitHub chua dang nhap. Hay chay: gh auth login"
    }
    gh auth setup-git | Out-Host
}

$SyncRoot = Join-Path $env:LOCALAPPDATA "FNB-SMART-GOVERNANCE"
$GovernanceClone = Join-Path $SyncRoot "boquytacfnb"

New-Item -ItemType Directory -Path $SyncRoot -Force | Out-Null

if (-not (Test-Path (Join-Path $GovernanceClone ".git"))) {
    Write-Host "Lan dau: dang tai bo governance GitHub..."
    git clone --branch $Branch $GovernanceRepo $GovernanceClone
    if ($LASTEXITCODE -ne 0) { throw "Khong clone duoc governance repository." }
} else {
    Push-Location $GovernanceClone
    try {
        git status --short
        if ($LASTEXITCODE -ne 0) { throw "Khong doc duoc trang thai Git." }

        $status = git status --porcelain
        if ($status) {
            throw "Thu muc governance local dang co thay doi chua luu. Dung de tranh ghi de."
        }

        git fetch origin
        if ($LASTEXITCODE -ne 0) { throw "Khong tai duoc thay doi moi tu GitHub." }

        git checkout $Branch
        if ($LASTEXITCODE -ne 0) { throw "Khong chuyen duoc sang branch $Branch." }

        git pull --ff-only origin $Branch
        if ($LASTEXITCODE -ne 0) {
            throw "GitHub co thay doi khong the tu dong ghep. Dung lai de tranh mat du lieu."
        }
    }
    finally {
        Pop-Location
    }
}

$folders = @("00_KIM_CHI_NAM","01_STATE","02_CONTROL","03_EVIDENCE","05_SESSION")

foreach ($folder in $folders) {
    $source = Join-Path $LocalDocs $folder
    $target = Join-Path $GovernanceClone $folder

    if (-not (Test-Path $source)) {
        continue
    }

    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item (Join-Path $source "*") $target -Recurse -Force
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

    $message = "sync: update FNB SMART governance records"
    git commit -m $message
    if ($LASTEXITCODE -ne 0) { throw "Commit that bai." }

    git push origin $Branch
    if ($LASTEXITCODE -ne 0) { throw "Push len GitHub that bai." }

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
