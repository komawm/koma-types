set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

check: metadata links workflows syntax shell

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

shell:
    shellcheck scripts/*.sh

# Usage: just package-release version=0.0.1 [out=DIR] (positional values also work)
package-release version out="dist":
    v={{quote(version)}}; o={{quote(out)}}; scripts/package-release.sh --version "${v#version=}" --out "${o#out=}"
