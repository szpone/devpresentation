#!/usr/bin/env bash

# pandoc -t revealjs -f markdown -s -c assets/styles.css --slide-level=2 -V revealjs-url=./reveal.js -o index.html presentation.md
pandoc \
  -t revealjs \
  --no-highlight \
  --template=template.html \
  -f markdown \
  -s \
  -c assets/styles.css \
  -c reveal.js/plugin/highlight/zenburn.css \
  --slide-level=2 \
  -V revealjs-url=./reveal.js \
  -o index.html \
  presentation.md
