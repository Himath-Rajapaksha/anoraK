---
name: jetpack-compose
description: Use when building Android UIs with Jetpack Compose for composable functions, state management, Material 3, or navigation.
---

# Jetpack Compose

## When to Use This Skill
- Building UIs with composable functions
- Managing state with `remember` and `mutableStateOf`
- Applying Material 3 theming and dynamic color
- Adding animations with `animate*AsState`
- Navigating with Compose Navigation

## Workflow
1. Create a composable: `@Composable fun MyScreen() { ... }`
2. Manage state: `val count by remember { mutableIntStateOf(0) }`
3. Apply Material 3: `MaterialTheme(colorScheme = lightColorScheme())`
4. Add components: `Button`, `TextField`, `LazyColumn`, `Card`
5. Navigate: `NavHost` with `composable("route") { ... }`
6. Animate: `animateColorAsState(targetValue = color)`
7. Test: `@Preview` composables and Compose testing library
8. Build: standard Gradle build — Compose is part of the build

## Rules
- Keep composables small and focused — one UI element, one function
- Hoist state up — pass state down, events up
- Use `key` in `LazyColumn` items for stable recomposition
- Avoid side effects in composables — use `LaunchedEffect` instead
- Test with `ComposeTestRule` for interaction tests
- Use `derivedStateOf` for derived computations, not `remember` with lambdas
