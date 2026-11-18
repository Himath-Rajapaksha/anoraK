---
name: react-patterns
description: Use when building React applications with hooks, state management, memoization, Suspense, or component composition.
---

# React Patterns

## When to Use This Skill
- Building custom hooks for shared logic
- Choosing between Context, Redux, or Zustand for state
- Applying memoization to prevent unnecessary re-renders
- Using Suspense for data loading
- Composing components with render props or compound patterns

## Workflow
1. Build small, focused components — one component, one job
2. Extract shared logic into custom hooks: `useFetch()`, `useAuth()`
3. Choose state management: local `useState` → Context → Zustand/Redux
4. Add memoization: `React.memo` for components, `useMemo`/`useCallback` for expensive computations
5. Wrap data-fetching in `Suspense` boundaries with `use()` or `useEffect`
6. Use compound components for complex UIs: `Select`, `Select.Option`, `Select.Group`
7. Test with React Testing Library — test behavior, not implementation
8. Bundle and deploy with Vite, Next.js, or your framework

## Rules
- Don't put everything in one component — extract hooks and sub-components
- Avoid premature optimization — measure before adding `useMemo` everywhere
- Use `key` prop correctly — never use index for dynamic lists
- Keep state as close to where it's used as possible
- Don't mutate state directly — always return new objects/arrays
- Use TypeScript for prop types — don't rely on PropTypes
