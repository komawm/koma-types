# Local development workflow

1. Read the workspace routing, this repository's AGENTS, current-state inventory and affected specification. Confirm the change belongs here.
2. Register a named CarryCtx identity, create/select a scoped task, record dependencies and start a session. Inspect existing work and conflicts.
3. Use a task branch/worktree after the first commit. Before the first commit, shared-checkout agents must have explicitly disjoint scopes.
4. Implement the requested outcome, preserve unrelated work and update affected documentation. Record decisions and intermediate evidence.
5. Run the relevant justfile gates. Record target-toolchain availability separately from structural fallback probes, and preserve failures without weakening checks.
6. Checkpoint the changes, validation and remaining work before handoff or stopping. End the session cleanly.
7. The commander reads state back, inspects files and independently verifies acceptance. Keep unresolved product readiness in explicit tasks even when initialization itself is accepted.

No remote Issue, PR, push, merge or release is required by this local workflow. If the user authorizes remote delivery later, transition to the issue-to-merge workflow using the existing local task and evidence.
