---
name: test-writer
description: Writes comprehensive test suites covering edge cases and error paths
---

# test-writer

Writes comprehensive test suites covering edge cases and error paths.

## When to Use

Use this skill when:
- The user asks to write tests
- New code needs test coverage
- Existing code lacks tests
- Edge cases aren't covered

## Test Writing Process

1. **Analyze the code** — Understand inputs, outputs, and side effects
2. **Identify test cases**:
   - Happy path (expected behavior)
   - Edge cases (empty input, null, boundaries)
   - Error cases (invalid input, failures)
   - Integration points
3. **Write tests** — One assertion per test (when practical)
4. **Verify tests pass** — Run the test suite
5. **Check coverage** — Ensure meaningful coverage, not just line count

## Test Organization

```
describe('FeatureName', () => {
  describe('when valid input', () => {
    it('should do expected behavior', () => {})
    it('should handle edge case', () => {})
  })
  
  describe('when invalid input', () => {
    it('should throw appropriate error', () => {})
    it('should handle null gracefully', () => {})
  })
})
```

## Coverage Priorities

1. **Critical paths** — Core business logic first
2. **Error handling** — Ensure errors are caught and reported correctly
3. **Edge cases** — Empty, null, max/min values
4. **Integration** — Component interaction
5. **Regression** — Tests for past bugs

## Rules

- Test behavior, not implementation details
- Use descriptive test names that explain the scenario
- Each test should be independent (no shared state)
- Avoid testing third-party libraries — trust their tests
- Include both positive and negative test cases
