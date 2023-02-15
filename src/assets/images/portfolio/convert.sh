#!/bin/bash

mkdir webp >/dev/null 2>&1

for i in jpeg/*.jpg; do
  filename=$(basename "$i")
  cwebp -q 60 -resize 0 1080 "$i" -mt -quiet -o "webp/${filename%.*}.webp" 
done

du -sh webp/*.webp
echo "Total images size:"
du -sh webp
du -sh jpeg
