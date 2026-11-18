---
name: netlify-functions
description: Use when building serverless API endpoints, background tasks, or scheduled jobs with Netlify Functions.
---

# Netlify Functions

## When to Use This Skill
- Creating API endpoints for a static site
- Handling form submissions serverlessly
- Running background tasks without blocking the response
- Scheduling periodic data processing with cron triggers
- Storing and retrieving files with Netlify Blobs

## Workflow
1. Create a file in `netlify/functions/` with the function name
2. Export a handler: `exports.handler = async (event, context) => { statusCode, body }`
3. For scheduled functions: add `export const config = { schedule: "@hourly" }`
4. Access environment variables via `process.env`
5. Read request body: `JSON.parse(event.body)`
6. Use Netlify Blobs: `import { getStore } from '@netlify/blobs'`
7. Test locally: `netlify dev` provides a local Functions server
8. Deploy: push to the connected branch or `netlify deploy --functions=netlify/functions`

## Rules
- Return proper HTTP responses with status codes and CORS headers
- Handle errors gracefully — return 500 with a generic message, log the details
- Keep functions under 10 seconds execution time
- Use environment variables for secrets, never hardcode
- Set appropriate memory and timeout in `netlify.toml` for heavy functions
- Test with `netlify dev` before pushing to production
