# Delivery rules

1. Record the intended outcome, acceptance evidence, required role, ownership, dependencies and exact file scopes in this repository's CarryCtx. Resolve overlapping scopes before dispatch.
2. Bind a named agent/session and inspect task context before changes. Record progress, decisions, risks, blockers, handoffs and checkpoints while working.
3. After the first commit, delegated code uses isolated branches/worktrees. Before that, shared-checkout work needs explicitly disjoint scopes and preservation of unrelated files.
4. For local-only initialization, keep work local. Do not invent a GitHub Issue/PR prerequisite or publish merely because a template has a remote stage.
5. Use repository justfile gates; retain exact commands, toolchain, revision and results. A fallback compiler, metadata gate or core test is not full target-toolchain or runtime acceptance.
6. The commander reads durable state, inspects the diff and reruns relevant checks before accepting implementation. A subagent's self-report does not complete a task.
7. Keep unresolved acceptance work as explicit linked tasks. Initialization infrastructure can be accepted while product readiness remains open; describe both outcomes clearly.
8. When remote delivery is authorized, link Issue and CarryCtx task, use suitable labels/milestones, synchronize affected docs, require independent review including CodeRabbit and required CI before merge, then checkpoint the actual merged revision.
9. Commits, pushes, remote mutations and releases follow the user's task scope. This rule file itself grants none of those actions.
