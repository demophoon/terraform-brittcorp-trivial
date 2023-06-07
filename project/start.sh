#!/usr/bin/env sh

echo "== envs in container"
env

echo "== creating index.html"
echo "Hello $NAME! <br>This was added by the TFC config sourcer" >> /usr/share/nginx/html/index.html

echo "== starting server..."
nginx
