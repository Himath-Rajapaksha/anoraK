---
name: performance
description: Identifies performance bottlenecks and suggests optimizations
---

# performance

Identifies performance bottlenecks and suggests optimizations.

## When to Use

Use this skill when:
- The user reports slow behavior
- Code needs performance optimization
- Profiling results need interpretation
- Resource usage needs reduction

## Analysis Areas

### Time Complexity
- Identify algorithmic bottlenecks (O(n²) loops, etc.)
- Check for unnecessary iterations
- Look for redundant computations

### Space Complexity
- Memory allocation patterns
- Cache efficiency
- Data structure choices

### I/O Operations
- Database query efficiency (N+1 queries, missing indexes)
- Network call batching
- File system access patterns

### Concurrency
- Blocking operations in async contexts
- Thread contention
- Lock granularity

## Optimization Process

1. **Measure first** — Don't guess; profile or benchmark
2. **Identify bottleneck** — Find the actual slow path
3. **Quantify impact** — How much does this affect overall performance?
4. **Propose optimization** — Specific, actionable change
5. **Verify improvement** — Benchmark before and after

## Common Optimizations

- Cache expensive computations
- Batch database queries
- Use lazy loading
- Add database indexes
- Reduce memory allocations
- Use efficient data structures
- Parallelize independent work

## Rules

- NEVER optimize without measuring first
- ALWAYS verify optimization doesn't break correctness
- Focus on the biggest bottleneck first
- Consider trade-offs (memory vs speed, complexity vs performance)
- Document performance characteristics
