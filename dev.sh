#!/usr/bin/env bash

set -eo pipefail

docker container rm -f nadiamoe || true
docker build . -t ghcr.io/nadiamoe/website
docker run -d --name nadiamoe -p 8080:80 ghcr.io/nadiamoe/website

while true; do
  inotifywait --exclude .git -e modify .
  docker cp . "nadiamoe:/usr/share/nginx/html/"
done
