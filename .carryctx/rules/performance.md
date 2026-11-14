# Performance review rules

1. Convert performance targets into measurable budgets before claiming acceptance. Do not repeat sub-millisecond, zero-copy or high-refresh specifications as measured behavior.
2. Record exact revision, build profile, compiler, feature set, kernel/driver, hardware, workload, warmup, sample count, distribution and comparison baseline.
3. Measure input/preemption latency, layout/state updates, frame pacing, render/capture latency, startup, memory, GPU allocation and idle behavior separately.
4. Keep unbounded work, blocking I/O and uncontrolled allocation off the compositor's input/render loop. Preserve bounded Lua/host operation scheduling and cancellation.
5. Distinguish core model, nested Winit, software-rendered VM, DRM/KMS and physical multi-GPU results. Evidence on one backend does not establish another.
6. Check correctness, capability/epoch isolation, protected captures, fallback and recovery before accepting an optimization. Record regressions and remaining uncertainty in CarryCtx.
