---
name: firebase-functions
description: Use when building serverless functions on Firebase with HTTP triggers, Firestore triggers, or pub/sub events.
---

# Firebase Functions

## When to Use This Skill
- Responding to HTTP requests with serverless endpoints
- Triggering code on Firestore document changes
- Running code on user creation, sign-in, or deletion
- Processing messages from pub/sub topics
- Scheduling recurring tasks with cron triggers

## Workflow
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize Functions: `firebase init functions` — select JavaScript or TypeScript
3. Write the function: `exports.myFunction = functions.https.onRequest(async (req, res) => { ... })`
4. For Firestore triggers: `functions.firestore.document('collection/doc').onWrite(...)`
5. For auth triggers: `functions.auth.user().onCreate(...)`
6. Set environment config: `firebase functions:config:set api.key="..."`
7. Deploy: `firebase deploy --only functions`
8. Test with `firebase functions:shell` or the Firebase console

## Rules
- Handle errors in every function — unhandled rejections crash the function
- Use environment config, not hardcoded secrets
- Keep functions small — one trigger, one responsibility
- Set appropriate timeouts and memory allocation
- Use `functions.logger` for structured logging, not `console.log`
- Test with the Firebase emulator before deploying
