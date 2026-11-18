---
name: expo-native-ui
description: Use when building native mobile UIs with Expo Router, styling, shared element transitions, or gesture animations.
---

# Expo Native UI

## When to Use This Skill
- Building file-based navigation with Expo Router
- Styling components with StyleSheet or NativeWind
- Creating shared element transitions between screens
- Implementing gesture-based animations

## Workflow
1. Set up Expo Router: `npx create-expo-app --template tabs`
2. Create routes: add files in `app/` directory — `index.tsx`, `about.tsx`, `[id].tsx`
3. Style with StyleSheet: `const styles = StyleSheet.create({ ... })`
4. Or use NativeWind: `className="bg-blue-500 p-4"` with Tailwind
5. Add shared element transitions: wrap elements with `SharedElement`
6. Implement gestures: use `react-native-gesture-handler` for swipes and drags
7. Add animations: `react-native-reanimated` for smooth 60fps transitions
8. Test on real devices — simulators miss gesture and performance issues

## Rules
- Use Expo Router for navigation — don't mix with React Navigation
- Prefer NativeWind for rapid prototyping, StyleSheet for production
- Test animations on low-end devices — not just the latest iPhone
- Use `react-native-reanimated` for animations, not `Animated` API
- Handle safe areas with `SafeAreaView` or `useSafeAreaInsets()`
- Test with both light and dark mode
