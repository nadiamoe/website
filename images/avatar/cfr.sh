#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo "Usage: $0 <file.gif> [file-cfr.gif]"
  exit 1
fi

out=$2
if [[ -z $out ]]; then
  out=${1/.gif/-cfr.gif}
fi

ffmpeg -i "$1" -vf "fps=30,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "$out"
