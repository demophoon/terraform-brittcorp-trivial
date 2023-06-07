#!/usr/bin/env sh

echo "== envs in container"
env

echo "== creating index.html"
echo "<html><body>" > /usr/share/nginx/html/index.html
echo "<h1>Web Debug Toolkit</h1>" >> /usr/share/nginx/html/index.html
echo "<h2>$HEADER</h2><br><br>Set the header message on this page by deploying with the \$HEADER variable set" >> /usr/share/nginx/html/index.html
echo "<br><br>Additional environment vars:<br><ul>" >> /usr/share/nginx/html/index.html
for e in $(env); do
  echo "<li>${e}</li>" >> /usr/share/nginx/html/index.html
done
echo "</ul></body></html>" >> /usr/share/nginx/html/index.html

echo "== starting server..."
nginx
