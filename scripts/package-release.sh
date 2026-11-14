#!/usr/bin/env bash
# Package the koma-types LuaLS definition snapshot for a release.
#
# Usage: scripts/package-release.sh --version X.Y.Z --out DIR
#
# Produces in DIR:
#   koma-types-<version>.tar.gz  (types/, LICENSE, README.md, CHANGELOG.md, artifact.toml)
#   koma.lua                     (standalone copy of types/koma.lua)
#   SHA256SUMS                   (sha256sum format for both files)
set -euo pipefail

usage() {
    echo "usage: $0 --version X.Y.Z --out DIR" >&2
    exit 2
}

die() {
    echo "package-release: $*" >&2
    exit 1
}

version=""
out=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --version)
            [[ $# -ge 2 ]] || usage
            version="$2"
            shift 2
            ;;
        --out)
            [[ $# -ge 2 ]] || usage
            out="$2"
            shift 2
            ;;
        -h | --help)
            usage
            ;;
        *)
            echo "package-release: unknown argument: $1" >&2
            usage
            ;;
    esac
done

[[ -n "$version" && -n "$out" ]] || usage
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || die "version must be X.Y.Z, got '$version'"

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

# Read a quoted string value from a TOML table using Python's tomllib.
toml_get() {
    python3 - "$1" "$2" "$3" <<'PY'
import sys
import tomllib

path, table, key = sys.argv[1:4]
with open(path, "rb") as stream:
    data = tomllib.load(stream)
print(data[table][key])
PY
}

repo_version="$(toml_get repo.toml project version)"
artifact_version="$(toml_get artifact.toml artifact version)"
artifact_path="$(toml_get artifact.toml artifact path)"
artifact_sha="$(toml_get artifact.toml artifact sha256)"

[[ "$repo_version" == "$version" ]] || die "repo.toml [project].version is '$repo_version', expected '$version'"
[[ "$artifact_version" == "$version" ]] || die "artifact.toml version is '$artifact_version', expected '$version'"
[[ "$artifact_path" == "types/koma.lua" ]] || die "unexpected artifact path '$artifact_path'"

for file in types/koma.lua LICENSE README.md CHANGELOG.md artifact.toml; do
    [[ -f "$file" ]] || die "missing $file"
done
grep -Fq "## [$version]" CHANGELOG.md || die "CHANGELOG.md has no '## [$version]' section"

actual_sha="$(sha256sum types/koma.lua | cut -d' ' -f1)"
[[ "$actual_sha" == "$artifact_sha" ]] || die "types/koma.lua sha256 $actual_sha does not match artifact.toml $artifact_sha"

tarball="koma-types-${version}.tar.gz"
mkdir -p "$out"
out="$(cd "$out" && pwd)"
for name in "$tarball" koma.lua SHA256SUMS; do
    [[ ! -e "$out/$name" ]] || die "refusing to overwrite $out/$name"
done

# Reproducible archive: fixed ordering, ownership and timestamp.
prefix="koma-types-${version}"
tar --sort=name --owner=0 --group=0 --numeric-owner \
    --mtime='1970-01-01 00:00:00Z' \
    --transform="s,^,${prefix}/," \
    -cf - types LICENSE README.md CHANGELOG.md artifact.toml |
    gzip -n -9 >"$out/$tarball"
cp types/koma.lua "$out/koma.lua"

(cd "$out" && sha256sum "$tarball" koma.lua >SHA256SUMS)

echo "package-release: wrote $out/$tarball, $out/koma.lua, $out/SHA256SUMS"
