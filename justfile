set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

check: metadata links workflows syntax

metadata:
    python3 scripts/check.py

links:
    python3 scripts/check-links.py

workflows:
    actionlint -color

hooks-install:
    lefthook install pre-commit
    carryctx hooks install --compose

syntax:
    luac -p types/koma.lua
