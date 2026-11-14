# koma-types CarryCtx catalog

This directory stores versioned repository configuration, guidance, rules, personas and delivery workflows. The database is local under the Git common directory, not in this directory; use CarryCtx commands rather than editing it. Raw state and private snapshots are never public artifacts.

The [configuration](https://github.com/komawm/koma-types/blob/main/.carryctx/config.toml) defines this project's identity, Git/worktree policy, sessions, checkpoints and verification command. The [vendored skill](https://github.com/komawm/.github/blob/main/workspace/.agents/skills/use-carryctx/SKILL.md) explains command usage. Read the applicable Markdown guidance explicitly; these documents do not claim to be automatically enforced checks or an engine for running agents.

| Guidance | Purpose |
| --- | --- |
| [Delivery](https://github.com/komawm/koma-types/blob/main/.carryctx/rules/delivery.md) | Scoped local work, ownership, evidence and review. |
| [Documentation](https://github.com/komawm/koma-types/blob/main/.carryctx/rules/documentation.md) | Canonical contracts, portable references, honest status and repository licensing. |
| [Security](https://github.com/komawm/koma-types/blob/main/.carryctx/rules/security.md) | Capability, epoch, input, capture and sandbox boundary review. |
| [Performance](https://github.com/komawm/koma-types/blob/main/.carryctx/rules/performance.md) | Measured budgets and backend-specific evidence. |
| [Personas](https://github.com/komawm/koma-types/blob/main/.carryctx/personas/README.md) | Commander, implementation specialist and independent reviewer responsibilities. |
| [Local development](https://github.com/komawm/koma-types/blob/main/.carryctx/workflows/local-development.md) | Current local-only initialization and validation workflow. |
| [Issue to merge](https://github.com/komawm/koma-types/blob/main/.carryctx/workflows/issue-to-merge.md) | Future remote delivery when explicitly authorized. |

Use named identities and sessions, register scopes/dependencies, checkpoint evidence and read state back before acceptance. Local initialization does not require GitHub publication or a PR. Remote workflows add Issues, labels, milestones, CodeRabbit review, required CI and merge authorization when the user's task includes that work; they do not create that authority by themselves.
