---
name: sentry-workflow
description: Use when triaging and debugging production issues with Sentry — using breadcrumbs, context, and release tracking.
---

# Sentry Workflow

## When to Use This Skill
- Triaging new issues in the Sentry dashboard
- Using breadcrumbs to trace the path to an error
- Adding context to help diagnose issues faster
- Linking errors to specific deployments
- Integrating Sentry into the development workflow

## Workflow
1. Open the Sentry dashboard and review new issues
2. Triage: assign severity (error, warning, info) and ownership
3. Check breadcrumbs: what happened before the error occurred
4. Add context: user info, request data, and custom tags
5. Reproduce locally: use the stack trace and breadcrumbs
6. Fix and deploy: link the fix to a release in Sentry
7. Mark resolved: verify the issue doesn't recur after deployment

## Rules
- Triage issues within 24 hours — don't let them accumulate
- Use assignees to ensure every issue has an owner
- Link commits to releases for automatic issue resolution
- Don't ignore "resolved" issues — they may recur
- Use Sentry's suspect commits to identify the likely cause
- Review issue trends weekly — spot patterns before they become incidents
