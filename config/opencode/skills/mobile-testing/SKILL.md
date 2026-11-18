---
name: mobile-testing
description: Use when testing mobile apps with unit tests, component tests, E2E tests, or visual regression testing.
---

# Mobile Testing

## When to Use This Skill
- Writing unit tests for business logic
- Testing components with React Native Testing Library
- Setting up E2E tests with Detox or Maestro
- Adding visual regression testing

## Workflow
1. Unit tests: use Jest for pure functions and hooks
2. Component tests: use React Native Testing Library to render and interact
3. E2E tests: set up Detox (React Native) or Maestro (cross-platform)
4. Write E2E flows: launch app, navigate, interact, assert
5. Add visual regression: screenshot comparison with Detox or Percy
6. Run in CI: execute tests on every PR
7. Test on multiple devices: different screen sizes and OS versions

## Rules
- Test behavior, not implementation — don't test internal state
- Use `testID` props for E2E selectors, not text content
- Mock external dependencies: network, storage, native modules
- Test on real devices in CI — emulators miss platform-specific issues
- Keep E2E tests short and focused — one flow per test
- Run unit tests fast, E2E tests nightly
