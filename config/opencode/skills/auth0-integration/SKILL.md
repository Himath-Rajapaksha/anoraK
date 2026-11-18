---
name: auth0-integration
description: Use when integrating Auth0 for authentication, authorization, social logins, or RBAC in an application.
---

# Auth0 Integration

## When to Use This Skill
- Adding Auth0 authentication to a web or API application
- Configuring social or enterprise connections (Google, SAML, etc.)
- Implementing role-based access control (RBAC)
- Customizing login flows with Auth0 Actions
- Managing tokens and session lifecycle

## Workflow
1. Create an Auth0 application and API in the dashboard
2. Install the SDK: `@auth0/auth0-react` for React, `auth0` for Node
3. Configure the SDK with domain, clientId, and audience
4. Wrap the app with `Auth0Provider`
5. Use `useAuth0()` hook for login, logout, and user info
6. Protect routes: check `isAuthenticated` before rendering
7. Configure RBAC: assign roles to users, check permissions in API middleware
8. Add Actions for post-login customization

## Rules
- Never store Auth0 tokens in localStorage — use httpOnly cookies
- Validate JWT tokens on every API request
- Use refresh tokens for long-lived sessions, not access tokens
- Configure CORS and callback URLs correctly in the Auth0 dashboard
- Test with multiple connection types before deploying
- Monitor Auth0 logs for failed login attempts
