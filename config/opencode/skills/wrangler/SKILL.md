---
name: wrangler
description: Use when building and deploying on Cloudflare Workers, KV, R2, D1, or Durable Objects with the Wrangler CLI.
---

# Cloudflare Workers

## When to Use This Skill
- Building serverless functions on Cloudflare Workers
- Setting up KV for key-value storage
- Using R2 for object storage (S3-compatible)
- Running SQL queries with D1
- Building stateful apps with Durable Objects

## Workflow
1. Install Wrangler: `npm install -g wrangler`
2. Scaffold: `wrangler init my-worker`
3. Write the Worker: export a `fetch` handler in `src/index.ts`
4. Configure `wrangler.toml` with bindings, routes, and variables
5. Test locally: `wrangler dev`
6. Deploy: `wrangler deploy`
7. For KV/R2/D1: create the resource and add bindings in `wrangler.toml`
8. Verify in the Cloudflare dashboard: logs, analytics, and resource usage

## Rules
- Use `wrangler.toml` for all configuration — never inline secrets
- Keep Worker scripts under the subrequest limit (50 per invocation)
- Prefer R2 over KV for large objects and binary data
- Use D1 for relational queries; KV for simple key-value lookups
- Test with `wrangler dev --local` before deploying
- Monitor logs and errors in the Cloudflare dashboard
