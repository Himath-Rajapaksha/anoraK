---
name: testing-handbook
description: Use when applying advanced testing techniques like fuzzing, mutation testing, or sanitizer-guided testing to find bugs beyond unit tests.
---

# Testing Handbook

## When to Use This Skill
- Fuzzing code with AFL or libFuzzer to find crashes
- Running mutation testing to evaluate test suite quality
- Using sanitizers (ASan, MSan, UBSan) to detect memory and undefined behavior bugs
- Applying property-based testing to find edge cases

## Workflow
1. Fuzzing: compile with AFL instrumentation, provide seed inputs, run the fuzzer
2. Analyze crashes: reproduce with the minimized test case
3. Mutation testing: run `mutmut` or `Stryker` to inject mutations
4. Review survived mutations: these indicate gaps in test coverage
5. Add tests for survived mutations
6. Sanitizers: compile with `-fsanitize=address,undefined` and run tests
7. Fix all sanitizer reports: memory leaks, use-after-free, undefined behavior
8. Integrate into CI: run sanitizers on every PR

## Rules
- Use fuzzing for parsers, deserializers, and any code handling untrusted input
- Run mutation testing periodically, not on every commit — it's slow
- Fix all high-severity sanitizer findings immediately
- Use property-based testing for functions with mathematical properties
- Don't ignore "low" severity findings — they can be chained
- Keep seed inputs for fuzzers — they're valuable for regression testing
