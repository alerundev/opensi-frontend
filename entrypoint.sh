#!/bin/sh
# 환경변수 BACKEND_URL을 HTML에 주입
BACKEND=${BACKEND_URL:-http://localhost:3000}

for file in /usr/share/nginx/html/index.html /usr/share/nginx/html/admin.html; do
  sed -i "s|window.BACKEND_URL || 'http://localhost:3000'|'${BACKEND}'|g" "$file"
done

exec nginx -g 'daemon off;'
