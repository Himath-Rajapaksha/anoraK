---
name: expo-deployment
description: Use when building, submitting, and updating Expo apps with EAS Build, EAS Submit, and over-the-air updates.
---

# Expo Deployment

## When to Use This Skill
- Building iOS and Android builds with EAS Build
- Submitting to the App Store and Play Store
- Managing signing credentials and certificates
- Deploying over-the-air updates with EAS Update
- Creating preview builds for testing

## Workflow
1. Install EAS CLI: `npm install -g eas-cli`
2. Login: `eas login`
3. Configure: `eas build:configure` — creates `eas.json`
4. Build: `eas build --platform ios` or `eas build --platform android`
5. Submit: `eas submit --platform ios` — uploads to App Store Connect
6. For OTA updates: `eas update --branch production`
7. For preview builds: `eas build --profile preview`
8. Monitor builds in the EAS dashboard

## Rules
- Use `eas.json` profiles: `development`, `preview`, and `production`
- Never commit credentials to Git — use EAS credentials management
- Test preview builds before submitting to stores
- Use OTA updates for JS-only changes, not native code updates
- Keep build profiles separate for each environment
- Monitor crash reports after each store submission
