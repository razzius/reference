#!/usr/bin/env fish
git-commit (echo (cat README.md | grep '###' | tail -1 | string split ' ')[2..])
