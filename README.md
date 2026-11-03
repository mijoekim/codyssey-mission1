# 🚀 Codyssey Mission 1 - 개발 환경 구축 & Docker 입문

> **미션 목표**: 개발자로서 필수적인 터미널, Git/GitHub, Docker 환경을 구축하고 기본 역량을 증명한다.

![Status](https://img.shields.io/badge/status-completed-success)
![Platform](https://img.shields.io/badge/platform-WSL2%20Ubuntu-blue)
![Docker](https://img.shields.io/badge/docker-ready-blue)

---

## 📋 목차
1. [환경 구성](#1-환경-구성)
2. [터미널 기본 조작](#2-터미널-기본-조작)
3. [파일 권한 관리](#3-파일-권한-관리)
4. [Git & GitHub](#4-git--github)
5. [Docker 기초](#5-docker-기초)
6. [Dockerfile 실습](#6-dockerfile-실습)
7. [증거 파일 목록](#7-증거-파일-목록)
8. [배운 점 & 어려웠던 점](#8-배운-점--어려웠던-점)

---

## 1. 환경 구성

| 항목 | 버전 / 설정 |
|---|---|
| OS | Windows 11 + **WSL2 (Ubuntu)** |
| Shell | PowerShell 7, Bash |
| Git | 설치 및 글로벌 설정 완료 |
| Docker | Docker Desktop + WSL2 연동 |
| Editor | Visual Studio Code |

**검증 완료 항목**:
- ✅ PowerShell 7 실행 확인
- ✅ WSL2 Ubuntu 정상 동작
- ✅ Git 버전 확인 (`git --version`)
- ✅ Docker 버전 확인 (`docker --version`, `docker info`)
- ✅ VSCode + WSL 확장 연동

---

## 2. 터미널 기본 조작

Linux 기본 명령어 실습 완료.

### 실습 명령어
- `pwd` : 현재 경로 확인
- `ls -la` : 상세 목록 조회
- `mkdir` : 디렉토리 생성
- `cp` / `mv` / `rm` : 복사, 이동, 삭제
- `cat` / `touch` : 파일 조회/생성

📄 **증거**: [`mission1-evidence/terminal-practice.log`](./mission1-evidence/terminal-practice.log)

---

## 3. 파일 권한 관리

Linux 파일 권한 체계(소유자/그룹/기타)와 `chmod`를 이용한 권한 변경 실습.

| 권한 | 의미 | 사용 예 |
|---|---|---|
| `644` | rw-r--r-- | 일반 파일 (기본) |
| `755` | rwxr-xr-x | 실행 가능한 스크립트 |
| `700` | rwx------ | 소유자 전용 |
| `600` | rw------- | 민감 설정 파일 |

📄 **증거**: [`mission1-evidence/chmod-practice.log`](./mission1-evidence/chmod-practice.log)

---

## 4. Git & GitHub

- ✅ `git config` 글로벌 설정 (user.name, user.email)
- ✅ 로컬 저장소 초기화 (`git init`)
- ✅ **GitHub 원격 저장소 연동**
- ✅ `add` → `commit` → `push` 전체 워크플로우 수행
- ✅ Pull Request 및 **merge** 경험

🔗 저장소: https://github.com/mijoekim/codyssey-mission1

---

## 5. Docker 기초

Docker Desktop + WSL2 환경에서 컨테이너 기본 명령어 실습.

### 실습 명령어
- `docker --version` : 버전 확인
- `docker info` : 상세 정보
- `docker run hello-world` : 첫 컨테이너 실행
- `docker ps -a` : 전체 컨테이너 조회
- `docker images` : 이미지 목록

📄 **증거**: [`mission1-evidence/docker-practice.log`](./mission1-evidence/docker-practice.log)

---

## 6. Dockerfile 실습 ⭐

**직접 Dockerfile을 작성하고 커스텀 nginx 웹서버를 띄워 브라우저 접속까지 완료.**

### 📄 Dockerfile
FROM nginx:alpine

LABEL maintainer="user@codyssey"
LABEL description="Mission1 Dockerfile 실습용 커스텀 nginx"

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

### 🔨 빌드 & 실행
docker build -t my-nginx:v1 .
docker build -t my-nginx:v2 .
docker run -d --name my-web -p 8080:80 my-nginx:v2


### ✅ 결과 검증
| 항목 | 결과 |
|---|---|
| 이미지 빌드 | `my-nginx:v1`, `my-nginx:v2` 성공 |
| 컨테이너 실행 | `my-web` (Up & Running) |
| 포트 매핑 | `0.0.0.0:8080 → 80/tcp` |
| 브라우저 접속 | http://localhost:8080 → **HTTP 200** ✅ |
| 한글/이모지 | `<meta charset="UTF-8">` 적용 후 정상 출력 🐳 |
| `docker logs` | nginx 액세스 로그 정상 수집 |
| `docker exec` | 컨테이너 내부 `index.html` 존재 확인 |

### 💡 트러블슈팅
- **문제**: 초기 브라우저 접속 시 한글/이모지 깨짐
- **원인**: HTML에 문자 인코딩 선언 누락
- **해결**: `<meta charset="UTF-8">` 추가 → 재빌드(v2) → 정상 출력 확인

📄 **증거**: [`mission1-evidence/dockerfile-practice/`](./mission1-evidence/dockerfile-practice/)

---

## 7. 증거 파일 목록
mission1-evidence/
├── terminal-practice.log # 터미널 명령어 실습 로그
├── chmod-practice.log # 권한 변경 실습 로그
├── docker-practice.log # Docker 기초 명령어 로그
└── dockerfile-practice/
├── Dockerfile # 작성한 Dockerfile
├── index.html # 커스텀 웹 페이지
└── dockerfile-practice.log # 전체 빌드/실행/검증 로그


---

## 8. 배운 점 & 어려웠던 점

### 💡 배운 점
- **WSL2는 생각보다 강력하다**: Windows 안에서 완전한 Linux 개발 환경을 쓸 수 있다는 게 신기했다.
- **Docker는 "격리"의 미학**: 호스트 OS를 더럽히지 않고 nginx 같은 서버를 즉시 띄웠다가 지울 수 있는 게 인상 깊었다.
- **포트 매핑의 중요성**: `-p 8080:80`에서 왼쪽이 호스트, 오른쪽이 컨테이너라는 개념이 처음엔 헷갈렸지만, 실습을 반복하니 명확해졌다.
- **Dockerfile = 재현 가능한 환경**: 같은 Dockerfile만 있으면 누구나 같은 서버를 띄울 수 있다는 점이 Infrastructure as Code의 핵심임을 체감했다.

### 😅 어려웠던 점
- **한글 인코딩 이슈**: 브라우저에서 한글이 깨져서 당황했지만, `<meta charset="UTF-8">` 한 줄로 해결되는 걸 보고 기본의 중요성을 느꼈다.
- **이미지와 컨테이너 개념 구분**: 처음엔 둘이 같은 건 줄 알았는데, "이미지는 설계도, 컨테이너는 실행 중인 인스턴스"라는 비유로 이해했다.
- **파일 권한 숫자(644, 755)**: 처음엔 외우기 힘들었지만, `r=4, w=2, x=1` 조합이라는 규칙을 알고 나니 금방 익숙해졌다.

### 🎯 다음 목표
- Docker Compose로 다중 컨테이너 관리
- Git 브랜치 전략 심화 학습
- 실제 애플리케이션 컨테이너화

---

## 📌 미션 완료

- ✅ 환경 구성 전 항목 통과
- ✅ 터미널 / 권한 / Git 실습 완료
- ✅ Docker + Dockerfile 전 과정 수행
- ✅ 커스텀 웹서버 브라우저 접속 성공
- ✅ 모든 과정 로그로 기록

**Author**: [@mijoekim](https://github.com/mijoekim)
**Mission**: Codyssey Mission 1
