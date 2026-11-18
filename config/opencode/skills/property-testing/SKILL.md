---
name: property-testing
description: Use when writing property-based tests to find edge cases that example-based tests miss.
---

# Property-Based Testing

## When to Use This Skill
- Testing functions with many possible inputs
- Finding edge cases that manual test cases miss
- Verifying invariants that hold for all valid inputs
- Testing serializers, parsers, or data transformations

## Workflow
1. Identify the property: what invariant must hold for all inputs
2. Choose a library: Hypothesis (Python), fast-check (TypeScript), jqwik (Java)
3. Define generators for input data using the library's strategies
4. Write the property: `forAll(generator, (input) => expect(fn(input)).toSatisfy(property))`
5. Run with increasing complexity: start with default, increase max examples if needed
6. When a failure is found, minimize it with the library's shrinking feature
7. Add the minimized failing case as a regression test

## Rules
- Start with simple properties before complex ones
- Use the library's built-in generators when possible
- Set explicit random seeds for reproducible failures
- Limit test duration — set timeouts for long-running properties
- Don't test implementation details — test observable behavior
