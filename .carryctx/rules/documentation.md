# Documentation rules

1. Koma owns source and local implementation guidance; koma-docs owns the canonical architecture/API and shared development corpus. Organization routing belongs to the organization repository; Phodopus owns its upstream contracts.
2. Distinguish accepted requirements, proposals, source inventory, compilation evidence, observed runtime behavior and security/performance acceptance. A specification or source file does not establish the latter results.
3. Synchronize changed public commands, protocols, errors, defaults, configuration, licensing and support claims with the owning specification and implementation evidence.
4. Use canonical HTTPS repository URLs in README and AGENTS references. Keep executable configuration paths and command examples concrete without hardcoding a workstation clone location.
5. The type snapshot uses Apache-2.0 under one root LICENSE. Koma and Jiku use GPL-3.0-or-later for all their crates. Preserve third-party notices and provenance.
6. The incubation line is 0.0.x, starting at 0.0.1; the first formal release line is 0.1.0. A package version is not release acceptance.
7. Keep repository documentation consistently English and user conversation in the user's language. Retain original design status labels while clarifying current implementation boundaries in development docs.
8. Durable local evidence belongs in ignored recording storage; publish only intentionally selected, checked and authorized artifacts. Never embed credentials, runtime tokens or raw CarryCtx snapshots in documentation.
