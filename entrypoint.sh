#!/bin/sh
# 환경변수 BACKEND_URL을 HTML에 주입
BACKEND="${BACKEND_URL:-http://localhost:3000}"

# __BACKEND_URL__ 플레이스홀더 치환
sed -i "s|__BACKEND_URL__|${BACKEND}|g" /usr/share/nginx/html/index.html
sed -i "s|__BACKEND_URL__|${BACKEND}|g" /usr/share/nginx/html/admin.html

exec nginx -g 'daemon off;'
