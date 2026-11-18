---
name: expo-api-routes
description: Use when creating server-side API routes in Expo Router for backend logic, auth, or data fetching.
---

# Expo API Routes

## When to Use This Skill
- Creating server-side endpoints in an Expo app
- Adding middleware for authentication or rate limiting
- Handling file uploads or form submissions
- Deploying API routes to EAS Hosting

## Workflow
1. Create a route file in `app/api/` directory: `app/api/hello+api.ts`
2. Export a handler: `export function GET(request: Request) { ... }`
3. Access URL params: `const url = new URL(request.url)`
4. Add middleware logic at the top of the handler
5. Return responses: `Response.json({ data })` or `new Response(body)`
6. Test with `npx expo start` — routes are available at `/api/`
7. Deploy: `eas deploy` to EAS Hosting

## Rules
- Keep API routes thin — delegate to shared services for business logic
- Validate all inputs before processing
- Use proper HTTP methods: GET for reads, POST for writes
- Return consistent response shapes: `{ data, error, status }`
- Handle errors gracefully — return meaningful error messages
- Test with the Expo dev server before deploying
