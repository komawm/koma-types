#!/usr/bin/env python3
"""Check own-repository canonical links without requiring unpublished remotes."""
from pathlib import Path
from urllib.parse import unquote, urlsplit
import re
import tomllib
ROOT = Path(__file__).resolve().parents[1]
with (ROOT / "repo.toml").open("rb") as stream:
    repo = tomllib.load(stream)["repo"]["name"]
prefix = f"/komawm/{repo}/"
count = 0
for path in ROOT.rglob("*.md"):
    if ".git" in path.parts:
        continue
    for target in re.findall(r"\]\(([^)]+)\)", path.read_text()):
        if path.name in {"README.md", "AGENTS.md"}:
            assert target.startswith("https://"), f"{path}: non-HTTPS documentation link {target}"
        url = urlsplit(target)
        if url.netloc == "github.com" and url.path.startswith(prefix):
            location = url.path[len(prefix):]
            if location.startswith(("blob/main/", "tree/main/")):
                local = ROOT / unquote(location.split("/", 2)[2])
                assert local.exists(), f"{path}: missing canonical target {target}"
                count += 1
print(f"{repo}: {count} own-repository file links valid; external links not network-checked")
