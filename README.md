# Mission 1 - 개발 환경 구축

## 개요
Codyssey 미션1 수행 기록.
개발 환경 점검부터 Git, Docker 기초까지 실습했다.

## 수행 내용
- 환경 점검 (PowerShell 7 / WSL2 / Git / Docker / VSCode)
- 터미널 기본 조작 (pwd, ls, mkdir, cp, mv, rm 등)
- 파일 권한 실습 (chmod 숫자/문자 방식)
- Git 로컬 설정 및 GitHub 연동 (init → commit → push)
- Docker 기초 (run, ps, rm, 컨테이너 진입)

## 환경 점검 결과

점검 일시: 2026-11-03 12:02:54

```
=== 환경 점검 결과 ===
점검 일시: 2026-11-03 12:02:54

--- [1] PowerShell ---

Major  Minor  Patch  PreReleaseLabel BuildLabel
-----  -----  -----  --------------- ----------
7      6      9

--- [2] WSL ---
기본 배포: Ubuntu
기본 버전: 2

  NAME              STATE           VERSION
* Ubuntu            Running         2
  docker-desktop    Running         2

--- [3] Git ---
git version 2.56.0.windows.4

--- [4] Docker ---
Docker version 29.9.2, build a82e528

--- [5] VSCode ---
1.144.0
2c33b50b16c472efe58357d1d2a8a5414bc23fbf
x64

=== 점검 완료 ===
```

> WSL 점검 시 "WSL1이 지원되지 않습니다" 메시지가 출력될 수 있으나,
> WSL2 환경에서는 정상이며 동작에 문제가 없다.

## 환경 점검 스크립트 (check-env.ps1)

```powershell
# ============================================
#  환경 점검
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
```

### 실행 방법
```powershell
# 결과를 화면에 출력
pwsh ./check-env.ps1

# 결과를 파일로 저장
pwsh ./check-env.ps1 > env-check-result.txt
```

> 실행 정책 오류가 날 경우:
> `pwsh -ExecutionPolicy Bypass -File ./check-env.ps1`

## 실행 환경
- OS: Windows + WSL2 (Ubuntu)
- 컨테이너: Ubuntu 26.04.1 LTS

## 배운 점
- 파일 권한 644, 755의 의미를 숫자로 이해하게 됐다.
- git add → commit → push 흐름을 처음으로 직접 해봤다.
- Docker 컨테이너는 exit 해도 사라지지 않는다는 걸 알았다.