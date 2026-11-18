---
name: durable-objects
description: Use when building stateful, real-time applications on Cloudflare that need coordinated state across requests.
---

# Durable Objects

## When to Use This Skill
- Building real-time collaboration (cursors, editing, chat)
- Coordinating state across multiple WebSocket connections
- Implementing rate limiters, counters, or leader election
- Persisting state with embedded SQLite storage

## Workflow
1. Define a Durable Object class with exported methods
2. Configure the class in `wrangler.toml` with a binding name
3. Implement the `fetch` handler to route requests to the DO instance
4. Use the `ctx.storage` API for reads, writes, and transactions
5. Open WebSockets with `this.ctx.getWebSockets()` for real-time connections
6. Broadcast messages to connected clients with `this.ctx.broadcast()`
7. Implement alarms for scheduled tasks: `alarm() { ... }`
8. Deploy with `wrangler deploy` and verify with WebSocket connections

## Rules
- Each DO instance handles exactly one unique ID — use it for sharding
- Keep state mutations inside the DO class — never mutate from outside
- Use transactions for multi-step state changes to maintain consistency
- Set alarms instead of polling for periodic tasks
- Handle DO migration when changing class definitions
- Test with `wrangler dev` using `--local` mode before deploying
