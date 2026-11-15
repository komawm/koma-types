# Changelog

All notable changes to the koma-types LuaLS definitions are recorded here. Versions follow the 0.0.x incubation line until the first formal 0.1.0 release line.

## [Unreleased]

## [0.0.1] - 2026-11-16

### Added (agent cursor & multi-waypoint macro types)

- Added `KomaPathSplineKind` (`"auto"` | `"catmull_rom"` | `"bezier"`),
  `KomaAgentCursorSpec` (including `label_enabled?`), `KomaPathSpec`, and Lua
  `MacroContext` trajectory methods (`move_path`, `stroke_path`, `path`,
  `settle_cursor`) generated from `komactl gen-types` (`sha256`
  `cd7d9c441db6f4c0e951341505685290cd90afcc84b10824ef3e6bf18a9f8df2`).

Development prerelease.

### Added

- LuaLS/LuaCATS definition snapshot `types/koma.lua`, reproduced from `komactl gen-types` at Koma revision `c8199965f6f6ea3bba595ce1c0563ab26d2e086a`.
- Definitions covering `koma.layout`, `koma.unbind`, `koma.input`, `koma.appearance`, `koma.bezier`, `koma.spring`, `KomaCurveSpec`, `KomaAnimationChannelConfig`, `KomaAnimationConfig` channels/solver fields, `KomaBorderConfig` dual-stop rotating gradient fields, `KomaWindowRuleSpec` rice overrides, desktop query types (`KomaWindowInfo`, `KomaOutputInfo`, `KomaWorkspaceInfo`), `MacroContext` query/`dispatch` methods, `KomaKinematicProfile`, `KomaKinematicsSpec` (2D Hooke spring & cubic-bezier cursor kinematics for `MacroContext:move_to` and `MacroContext:drag`), `koma.act.window.focus`/`koma.act.workspace.set_layout`, and `koma.on` event hooks (`KomaEventName`).
- `artifact.toml` provenance metadata with the generator revision and SHA-256 checksum of the snapshot.
- Release packaging script and tag-triggered GitHub prerelease workflow publishing `koma-types-0.0.1.tar.gz`, a standalone `koma.lua` and `SHA256SUMS`.

### Changed

- Synced Koma revisions `40d58462aa6466fbfe3349da6a890c0ca1456c4c` (`InputConfigSpec`, 2D `MonitorSpec` fields, monitor focus/move actions), `cfabbb81e9406f5cba69f8dcd21785989bca3743` (`disable_while_trackpointing?` alias on `KomaTouchpadInputSpec`), `aef9652814d216803dd05c1fb57b4fa340acc225` (Lua 5.4 animations, gradients, queries & events), and `c8199965f6f6ea3bba595ce1c0563ab26d2e086a` (Hooke spring / Bezier mouse kinematics & Wayland compat release baseline).
- Bumped both `github/codeql-action/init` and `github/codeql-action/analyze` to `v4.39.3`.

### Notes

- Editor completion is not runtime validation: these definitions do not prove that a configuration executes or is compatible with a running Koma host.

[Unreleased]: https://github.com/komawm/koma-types/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/komawm/koma-types/releases/tag/v0.0.1
