#!/bin/sh
set -e

BACKEND="${BACKEND_URL:-http://localhost:3000}"
echo "BACKEND_URL = $BACKEND"

sed -i "s|__BACKEND_URL__|${BACKEND}|g" /usr/share/nginx/html/index.html
sed -i "s|__BACKEND_URL__|${BACKEND}|g" /usr/share/nginx/html/admin.html

echo "치환 완료, nginx 시작..."
exec nginx -g 'daemon off;'
