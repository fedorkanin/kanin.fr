#!/bin/bash

mkdir tmp
count=1

sorted_images=$(ls jpeg/*.jpg | sort -V)

for file in $sorted_images
do
  mv "$file" "tmp/$count.jpg"
  ((count++))
done

mv tmp/* jpeg/

rm -r tmp




