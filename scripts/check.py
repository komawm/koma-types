#!/usr/bin/env python3
"""Validate repository identity, license boundaries and checked-in artifacts."""
from pathlib import Path
import hashlib
import tomllib

ROOT = Path(__file__).resolve().parents[1]
for path in ROOT.rglob("*.toml"):
    if ".git" not in path.parts:
        with path.open("rb") as stream:
            tomllib.load(stream)
with (ROOT / "repo.toml").open("rb") as stream:
    metadata = tomllib.load(stream)
repo = metadata["repo"]
assert repo["repository"] == f"https://github.com/komawm/{repo['name']}", "repository URL mismatch"
assert metadata["project"]["version"] == "0.0.1", "incubation version mismatch"
for name in ("README.md", "AGENTS.md", "justfile", ".carryctx/config.toml"):
    assert (ROOT / name).is_file(), f"missing {name}"
assert repo["kind"] == "types", "unexpected repository kind"
assert metadata["licensing"] == {"content": "Apache-2.0"}
with (ROOT / "artifact.toml").open("rb") as stream:
    artifact = tomllib.load(stream)["artifact"]
snapshot = ROOT / artifact["path"]
assert artifact["license"] == "Apache-2.0"
assert artifact["generator_reproduced"] is True, "snapshot must be reproduced from komactl gen-types"
assert len(artifact["source_revision"]) == 40 and all(c in "0123456789abcdef" for c in artifact["source_revision"]), "source_revision must be a 40-char commit SHA"
assert artifact["sha256"] == hashlib.sha256(snapshot.read_bytes()).hexdigest(), "snapshot hash differs from artifact metadata"
assert "---@class" in snapshot.read_text(), "missing LuaCATS classes"
license = (ROOT / "LICENSE").read_text()
assert license.startswith("Apache License") and "Version 2.0" in license and len(license) > 10000, "missing full Apache license text"
assert list(ROOT.glob("LICENSE*")) == [ROOT / "LICENSE"], "keep one root LICENSE"
print(f"{repo['name']}: metadata, licensing and artifacts valid")
