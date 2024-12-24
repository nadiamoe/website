#!/usr/bin/env bash

set -eo pipefail

if [[ -z $1 ]]; then
  echo "Usage: $0 <buttons_path>"
  exit 1
fi

find "$1" -maxdepth 1 -type f | sort | while read -r path; do
  cat <<EOF
<a href="#">
  <img src="${path}" alt="$(basename "$path")">
</a>
EOF
done
