# ============================================
#  환경 점검 스크립트 (check-env.ps1)
#  실행:  pwsh ./check-env.ps1
#  또는:  .\check-env.ps1  (PowerShell 7)
# ============================================

Write-Host "=== 환경 점검 결과 ===" -ForegroundColor Cyan
Write-Host ("점검 일시: " + (Get-Date).ToString("yyyy-MM-dd HH:mm:ss"))
Write-Host ""

# --- [1] PowerShell ---
Write-Host "--- [1] PowerShell ---" -ForegroundColor Yellow
$PSVersionTable.PSVersion
Write-Host ""

# --- [2] WSL ---
Write-Host "--- [2] WSL ---" -ForegroundColor Yellow
try {
    wsl --status
    Write-Host ""
    wsl -l -v
} catch {
    Write-Host "WSL 확인 실패: $_"
}
Write-Host ""

# --- [3] Git ---
Write-Host "--- [3] Git ---" -ForegroundColor Yellow
try {
    git --version
} catch {
    Write-Host "Git 미설치 또는 확인 실패"
}
Write-Host ""

# --- [4] Docker ---
Write-Host "--- [4] Docker ---" -ForegroundColor Yellow
try {
    docker --version
} catch {
    Write-Host "Docker 미설치 또는 확인 실패"
}
Write-Host ""

# --- [5] VSCode ---
Write-Host "--- [5] VSCode ---" -ForegroundColor Yellow
try {
    code --version
} catch {
    Write-Host "VSCode(code 명령) 미설치 또는 확인 실패"
}
Write-Host ""

Write-Host "=== 점검 완료 ===" -ForegroundColor Cyan
