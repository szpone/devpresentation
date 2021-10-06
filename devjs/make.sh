#!/usr/bin/env bash

pandoc -t revealjs -f markdown -s --no-highlight  --slide-level=2 -V revealjs-url=./reveal.js -o index.html presentation.md
