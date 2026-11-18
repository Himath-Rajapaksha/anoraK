---
name: event-sourcing
description: Use when implementing event sourcing, CQRS, or rebuilding state from an append-only event log.
---

# Event Sourcing

## When to Use This Skill
- Designing event schemas for a new domain
- Building aggregate roots that enforce invariants through events
- Implementing projections for read-optimized views
- Migrating from CRUD to event sourcing
- Handling event versioning and schema evolution

## Workflow
1. Identify domain events as past-tense facts: `OrderPlaced`, `PaymentReceived`
2. Design the event schema with event type, timestamp, aggregate ID, and payload
3. Implement aggregate roots that apply events to build current state
4. Build event handlers that update projections (read models)
5. Set up an event store — append-only table with optimistic concurrency
6. Implement snapshotting for aggregates with long event histories
7. Add event versioning: upcasters that transform old events to new schemas
8. Test by replaying events and verifying projected state

## Rules
- Events are facts — never modify or delete them after recording
- Keep event payloads small — store references, not blobs
- Validate all events against a schema before persisting
- Design projections independently — each serves one query pattern
- Use optimistic concurrency to prevent lost updates
- Never expose event internals to non-admin consumers
