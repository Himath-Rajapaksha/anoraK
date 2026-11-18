---
name: react-native-upgrade
description: Use when upgrading React Native versions, updating native dependencies, or fixing post-upgrade issues.
---

# React Native Upgrade

## When to Use This Skill
- Upgrading to a new React Native version
- Updating native dependencies (iOS and Android)
- Fixing common post-upgrade build errors
- Testing across platforms after an upgrade

## Workflow
1. Check the React Native changelog for breaking changes
2. Use the upgrade helper: `npx react-native upgrade`
3. Update dependencies: `npm install` or `yarn`
4. Fix iOS: `cd ios && pod install --repo-update`
5. Fix Android: update `build.gradle` files if needed
6. Clean and rebuild: `npx react-native run-ios` and `run-android`
7. Fix TypeScript errors: `npx tsc --noEmit`
8. Test all screens and features on both platforms

## Rules
- Upgrade one major version at a time
- Read the changelog before upgrading — don't skip breaking changes
- Update native dependencies alongside React Native
- Test on both iOS and Android — they may break differently
- Clean build folders before rebuilding: `rm -rf ios/build android/build`
- Keep a branch for the upgrade — don't upgrade directly on main
