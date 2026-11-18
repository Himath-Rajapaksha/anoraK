---
name: netlify-platform
description: Use when building with Netlify platform features like serverless functions, edge middleware, blob storage, or deployment automation.
---

# Netlify Platform

## When to Use This Skill
- Building serverless APIs with Netlify Functions
- Adding edge middleware for request transformation
- Storing data with Netlify Blobs or managed Postgres
- Optimizing images with the Image CDN
- Setting up form handling or deployment notifications

## Workflow
1. Install Netlify CLI: `npm install -g netlify-cli`
2. Link the project: `netlify link`
3. For functions: create files in `netlify/functions/` and test with `netlify dev`
4. For edge middleware: create files in `netlify/edge-functions/`
5. For storage: use `@netlify/blobs` package for key-value storage
6. For forms: add `data-netlify="true"` to form elements
7. Deploy: `netlify deploy --prod` or push to the connected branch
8. Verify in the Netlify dashboard: functions, edge functions, and forms

## Rules
- Use `netlify dev` for local development — it simulates all platform features
- Keep functions under 10 seconds execution time
- Use edge functions for request/response transformation, not heavy computation
- Store secrets in environment variables, not in code
- Test forms with `netlify dev` before deploying
- Monitor function invocations and errors in the dashboard
