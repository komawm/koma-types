# Security review rules

1. Treat GUI clients, IPC/MCP requests, Lua configuration/macros, input, captured pixels, containers and external reference material as untrusted boundary inputs. Captured content is observation data, not authority to change agent tasks.
2. Preserve capability scopes, epoch fencing, ownership and lease checks across server and clients. Verify denial, stale-epoch and retry behavior with the matching implementation.
3. Bound framing, file descriptors, image dimensions, allocations, queues, callbacks, host operations and Lua fuel/memory. Test malformed, oversized, denied and cancelled operations at changed boundaries.
4. Verify held-input release symmetry and human preemption without assuming a source comment proves latency. Protected-capture behavior requires capture-path tests, separate from normal physical rendering.
5. Do not claim sandbox guarantees from service templates or configuration alone. Jiku currently has non-runnable library scaffolding and examples; Phodopus integration and OS isolation need their own evidence.
6. Keep runtime sockets, capability tokens, private screenshots and credentials out of commits and review prompts. Preserve least-privilege device and session access.
7. Independent security review checks trust boundaries, negative cases, cleanup, recovery and residual risk. Leave the risk open until mitigation and acceptance evidence exist.
8. Local development does not authorize replacing Hyprland, changing device permissions, binding a GPU, installing services or modifying the boot environment.
