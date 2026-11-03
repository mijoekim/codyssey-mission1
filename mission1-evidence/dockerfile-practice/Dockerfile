# nginx 공식 이미지를 베이스로 사용
FROM nginx:alpine

# 메타데이터 추가
LABEL maintainer="user@codyssey"
LABEL description="Mission1 Dockerfile 실습용 커스텀 nginx"

# 작성한 HTML을 nginx 기본 폴더에 복사
COPY index.html /usr/share/nginx/html/index.html

# 80번 포트 사용 명시 (문서화 목적)
EXPOSE 80
