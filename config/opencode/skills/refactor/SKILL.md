---
name: refactor
description: Guides safe, incremental refactoring with behavior preservation checks
---

# refactor

Guides safe, incremental refactoring with behavior preservation checks.

## When to Use

Use this skill when:
- The user asks to refactor code
- Code is working but needs structural improvement
- Duplicated logic needs extraction
- Large functions need decomposition

## Refactoring Workflow

1. **Understand current behavior** — Read the code, trace execution paths
2. **Ensure test coverage** — If no tests exist, write characterization tests first
3. **Plan incremental steps** — Break refactor into small, safe steps
4. **Apply one refactoring at a time** — Run tests after each step
5. **Verify behavior preserved** — All tests pass, no regressions

## Safe Refactoring Patterns

### Extract Function
- Identify cohesive code blocks
- Define clear input/output parameters
- Replace inline code with function call

### Rename
- Choose descriptive names
- Update all references
- Use IDE/language tools if available

### Inline
- Remove unnecessary indirection
- Inline trivial functions
- Simplify over-abstraction

### Move
- Relocate code to proper module/class
- Update imports/references
- Maintain public API

## Rules

- NEVER refactor without tests (or write them first)
- NEVER refactor and add features simultaneously
- ALWAYS make one type of change at a time
- ALWAYS run tests between refactoring steps
- STOP if tests break — revert and try smaller steps
