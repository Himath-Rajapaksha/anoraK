---
name: firebase-apk-scan
description: Use when scanning Android APKs for Firebase misconfigurations like exposed databases or insecure security rules.
---

# Firebase APK Scanner

## When to Use This Skill
- Scanning an APK for hardcoded Firebase URLs
- Detecting exposed Firebase Realtime Database or Firestore
- Checking Firebase security rules configuration
- Identifying insecure Firebase configurations in mobile apps

## Workflow
1. Extract the APK: `apktool d app.apk`
2. Search for Firebase URLs: `grep -r "firebaseio.com" .` and `grep -r "firestore.googleapis.com" .`
3. Check for Google services config: `cat assets/google-services.json`
4. Extract Firebase project ID and URLs from the config
5. Test database access: `curl <firebase-url>/.json`
6. Check for open security rules: attempt unauthorized reads/writes
7. Document findings: exposed URLs, open databases, missing rules

## Rules
- Never modify or access data in databases you don't own
- Document exposed URLs without exploiting them
- Report all Firebase URLs found, even if access is restricted
- Check both Realtime Database and Firestore configurations
- Look for API keys in the manifest and config files
- Report findings to the app owner responsibly
