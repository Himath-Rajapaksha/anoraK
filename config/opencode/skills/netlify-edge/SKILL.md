---
name: netlify-edge
description: Use when writing Edge Functions for A/B testing, auth, geolocation routing, or request transformation at the edge.
---

# Netlify Edge Functions

## When to Use This Skill
- Running code at the edge for sub-50ms response times
- Implementing A/B testing with cookie-based variants
- Routing requests based on geolocation or headers
- Transforming requests or responses at the CDN layer
- Verifying JWTs or session cookies before the origin

## Workflow
1. Create a file in `netlify/edge-functions/` with the function name
2. Export a default handler: `export default async (request, context) => { ... }`
3. Configure the function in `netlify.toml` with `[[edge_functions]]` path and function name
4. Access geolocation: `context.geo.city`, `context.geo.country.code`
5. Set cookies or headers: `return new Response(body, { headers: { ... } })`
6. Test locally: `netlify dev` runs edge functions in the development server
7. Deploy: push to the connected Git branch

## Rules
- Keep edge functions under 50ms execution time
- Don't access the origin from edge functions — that defeats the purpose
- Use `context.next()` to pass through to the origin when needed
- Handle missing geolocation gracefully — not all requests have it
- Don't store sensitive data in edge function state — they're stateless
- Test with different geolocations using the `x-forwarded-for` header
