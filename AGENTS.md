# Koma types guidance

This repository owns the LuaLS definition snapshot. Its generator belongs to [Koma](https://github.com/komawm/koma/blob/main/crates/koma-lua/src/typegen.rs); the canonical API contract belongs to [koma-docs](https://github.com/komawm/docs/blob/main/docs/LUA_API_SPEC.md). Follow the [workspace map](https://github.com/komawm/.github/blob/main/workspace/workspace.toml) and do not create another generator or empty Rust crate here.

Treat the imported file as a preserved snapshot, not a verified fresh generation. A synchronization task must name the exact Koma generator revision, compiler/build result, diff and configuration/API checks. Keep public definitions coordinated with actual host behavior and protocol contracts.

Use this checkout's CarryCtx identity/session, scoped tasks and dependencies. Persist evidence and remaining work, end sessions cleanly and independently verify files before completion. Worktrees are required for delegated code after a first commit; before it, explicitly disjoint scopes apply. Read the [CarryCtx catalog](https://github.com/komawm/koma-types/blob/main/.carryctx/README.md).

The reusable definitions use Apache-2.0 with one root LICENSE; preserve provenance. Incubation begins at 0.0.1 on 0.0.x before the first formal 0.1.0 line. Product Rust 1.100.0/Rust 2024 requirements belong to the generator repository; this static snapshot does not claim a Rust build.

Use the repository justfile gates and canonical HTTPS README/AGENTS links. Store disposable files in `/tmp/koma/` and retained local evidence in ignored workspace `recording/`. Local initialization authorizes no remote publication; future authorized delivery links Issues/tasks, labels/milestones, CodeRabbit review and required CI before merge.
