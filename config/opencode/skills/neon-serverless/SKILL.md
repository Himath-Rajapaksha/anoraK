---
name: neon-serverless
description: Use when building serverless apps with Neon Postgres, database branching, autoscaling, or the serverless driver.
---

# Neon Serverless Postgres

## When to Use This Skill
- Building apps that need autoscaling Postgres without connection management
- Using database branching for preview environments and CI
- Running queries from edge runtimes (Cloudflare Workers, Vercel Edge)
- Setting up connection pooling for serverless functions

## Workflow
1. Create a Neon project at console.neon.tech
2. Get the connection string from the dashboard
3. For serverless: install `@neondatabase/serverless` and use WebSocket support
4. Create a branch: `neon branches create --project-id <id> --name preview`
5. Run migrations against the branch, not main
6. Use the pooled connection string for serverless functions
7. Merge the branch after review to apply changes to main
8. Set up autoscaling parameters in the Neon console

## Rules
- Use the serverless driver with WebSocket support for edge runtimes
- Never use the direct connection string in serverless — it will exhaust connections
- Use branching for every PR that changes the schema
- Delete branches after merging to avoid storage costs
- Set appropriate autoscaling min/max to control costs
- Monitor connection pool usage in the Neon dashboard
