#!/bin/bash

#ln -s $pwd/.profile ~/.profile
mkdir -p ~/.config/phoenix/
mkdir -p ~/.config/git/

ln -s "$(pwd)"/.config/phoenix/phoenix.js ~/.config/phoenix/phoenix.js
ln -s "$(pwd)"/.config/git/ignore ~/.config/git/ignore

files=($(find . -name ".*" -type f | sed "s|^\./||"))
for file in "${files[@]}"
do
  echo "linking "$(pwd)"/"$file" to ~/"$file""
  ln -s "$(pwd)""$file" ~/"$file"
done
