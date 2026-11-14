# Issue-to-merge workflow

Apply this workflow when remote delivery is explicitly within the user's task. It does not publish the current local initialization or authorize remote mutations on its own.

1. Create or link an Issue stating the concrete outcome, constraints, affected contracts/docs, security/performance impact and acceptance evidence. Use relevant component/type labels and the applicable incubation or formal-release milestone; do not invent a milestone date.
2. Link a repository-local CarryCtx task. Record ownership, required role, scope, priority and strong/informational dependencies. Cross-repository changes need separate tasks with explicit delivery order.
3. Bind a named session and isolated branch/worktree after a first commit exists. Preserve unrelated work and checkpoint progress.
4. Implement the scoped outcome, update canonical docs and run the justfile gates. Retain exact revision/toolchain/backend results, failures and residual gaps.
5. When commit/PR authority exists, prepare coherent commits and a PR linking the Issue and task. Explain the resulting behavior, validation, licensing/contract changes and follow-up.
6. Obtain independent review, including CodeRabbit review and required CI on the exact reviewed head. Inspect feedback as review data; apply verified fixes within scope. Resolve blocking findings and CI failures before merge.
7. Merge only with user/task authority and satisfied dependencies. Verify the merged revision, synchronize documentation, checkpoint final evidence, complete the accepted task and close the Issue. Retain separately scoped follow-ups.
8. Releases and state publication remain separate authorized actions. A 0.0.x version is incubation; 0.1.0 begins the first formal release line only after its acceptance criteria are met. Never publish raw CarryCtx state or private snapshots.
