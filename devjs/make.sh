#!/usr/bin/env bash

pandoc -t revealjs -f markdown -s -o index.html  --slide-level=2 -V revealjs-url=./reveal.js presentation.md
