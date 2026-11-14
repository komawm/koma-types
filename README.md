# Koma types

This independent repository holds Koma's checked-in [LuaLS/LuaCATS definition snapshot](https://github.com/komawm/koma-types/blob/main/types/koma.lua) for configuration editors. The generator remains in [Koma's koma-lua crate](https://github.com/komawm/koma/blob/main/crates/koma-lua/src/typegen.rs), exposed by `komactl gen-types`; canonical API requirements live in the [Lua specification](https://github.com/komawm/docs/blob/main/docs/LUA_API_SPEC.md).

The checked-in file is reproduced directly from `komactl gen-types` at Koma revision `28f5d9513e8d2952c1522b8d8ae729f7d5574c50` and validated by `luac -p` and SHA-256 checksum in [Artifact metadata](https://github.com/komawm/koma-types/blob/main/artifact.toml). No Rust crate, package release or new generator is created here.

When a newer Koma revision changes the Lua API, regenerate `types/koma.lua` via `komactl gen-types`, review its diff against the snapshot and update `artifact.toml` with the exact generator revision and SHA-256 checksum. Editor completion does not validate configuration execution or runtime compatibility.

The incubation baseline is 0.0.1 on the 0.0.x line before the first formal 0.1.0 release line. This reusable contract repository uses [Apache-2.0](https://github.com/komawm/koma-types/blob/main/LICENSE); Koma product code retains GPL-3.0-or-later.

Use this repository's justfile gates, local CarryCtx project and [agent guidance](https://github.com/komawm/koma-types/blob/main/AGENTS.md). No submodule setup or remote publication is required for local use.
