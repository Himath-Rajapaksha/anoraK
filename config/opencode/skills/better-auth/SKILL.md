---
name: better-auth
description: Use when implementing authentication with Better Auth for email/password, social providers, 2FA, or organization management.
---

# Better Auth

## When to Use This Skill
- Setting up email/password authentication
- Adding social login providers (Google, GitHub, etc.)
- Implementing two-factor authentication (2FA)
- Managing organizations and team membership
- Handling session tokens and refresh logic

## Workflow
1. Install: `npm install better-auth`
2. Configure the server: define plugins, adapters, and providers
3. Set up the client: configure the client SDK with the server URL
4. Add email/password sign-up and sign-in endpoints
5. Configure social providers: add client ID and secret for each
6. Enable 2FA plugin: configure TOTP or backup codes
7. Add organization plugin: create orgs, invite members, assign roles
8. Test the full flow: sign up, sign in, 2FA, and org management

## Rules
- Hash passwords with bcrypt or argon2, never MD5 or SHA
- Use httpOnly cookies for session tokens, not localStorage
- Implement rate limiting on auth endpoints to prevent brute force
- Validate email addresses before creating accounts
- Log all authentication events for security auditing
- Test with invalid inputs, expired tokens, and concurrent sessions
