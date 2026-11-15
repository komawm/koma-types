# Changelog

All notable changes to the koma-types LuaLS definitions are recorded here. Versions follow the 0.0.x incubation line until the first formal 0.1.0 release line.

## [Unreleased]

### Changed

- Regenerated `types/koma.lua` from `komactl gen-types` at Koma revision `cfabbb81e9406f5cba69f8dcd21785989bca3743`, adding the `disable_while_trackpointing?` alias field on `KomaTouchpadInputSpec`.
- Previously synced Koma revision `40d58462aa6466fbfe3349da6a890c0ca1456c4c` (`InputConfigSpec`, 2D `MonitorSpec` fields, monitor focus/move actions).
- Bumped both `github/codeql-action/init` and `github/codeql-action/analyze` to `v4.39.3`.

## [0.0.1] - 2026-11-14

Development prerelease.

### Added

- LuaLS/LuaCATS definition snapshot `types/koma.lua`, reproduced from `komactl gen-types` at Koma revision `c5837c17b92d71234320a502a56e635b70c5df19`.
- Definitions covering `koma.layout`, `koma.unbind`, `koma.input` and `koma.appearance`.
- `artifact.toml` provenance metadata with the generator revision and SHA-256 checksum of the snapshot.
- Release packaging script and tag-triggered GitHub prerelease workflow publishing `koma-types-0.0.1.tar.gz`, a standalone `koma.lua` and `SHA256SUMS`.

### Notes

- Editor completion is not runtime validation: these definitions do not prove that a configuration executes or is compatible with a running Koma host.

[Unreleased]: https://github.com/komawm/koma-types/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/komawm/koma-types/releases/tag/v0.0.1
