---
name: sentry-setup
description: Use when setting up Sentry for error tracking, source maps, release tracking, or alert configuration.
---

# Sentry Setup

## When to Use This Skill
- Adding Sentry error tracking to a web or backend application
- Configuring source maps for readable stack traces
- Setting up release tracking and deployment markers
- Creating alerts for new errors or regression spikes

## Workflow
1. Create a Sentry project at sentry.io
2. Install the SDK: `@sentry/nextjs` for Next.js, `sentry-python` for Python, etc.
3. Initialize with DSN: `Sentry.init({ dsn: '...' })`
4. Upload source maps: `sentry-cli releases files upload-sourcemaps`
5. Set release: `Sentry.init({ release: 'my-app@1.0.0' })`
6. Configure alerts: create rules for new issues or error rate spikes
7. Add context: `Sentry.setContext('user', { id, email })`
8. Test: trigger an error and verify it appears in Sentry

## Rules
- Upload source maps on every deploy — stale maps give useless stack traces
- Set the release version to match your deployment tag
- Use `beforeSend` to filter out known noise (e.g., browser extensions)
- Add environment tags to separate dev, staging, and production errors
- Configure sampling rates — don't send 100% in high-traffic apps
- Review and triage issues regularly — don't let them pile up
