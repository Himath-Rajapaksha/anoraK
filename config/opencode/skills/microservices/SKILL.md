---
name: microservices
description: Use when decomposing a monolith into services, designing inter-service communication, or managing distributed data.
---

# Microservices

## When to Use This Skill
- Deciding service boundaries from a domain model
- Choosing sync (HTTP/gRPC) vs async (queues/events) communication
- Managing data ownership across services
- Implementing distributed transactions or sagas
- Adding observability across service boundaries

## Workflow
1. Identify bounded contexts in the domain — each becomes a service boundary
2. Define the service API: what it owns, what it exposes, what it consumes
3. Choose communication pattern: sync for queries, async for commands/events
4. Set up a message broker (Kafka, RabbitMQ) for async communication
5. Implement the saga pattern for cross-service transactions
6. Add correlation IDs to trace requests across services
7. Deploy with health checks, circuit breakers, and retry policies
8. Monitor with distributed tracing (OpenTelemetry) and centralized logging

## Rules
- Each service owns its data — no shared databases
- Design for failure: every service call must have a timeout and fallback
- Use contract testing between services, not integration tests
- Keep services small enough that a single developer can understand them
- Don't split a service unless the team size or domain complexity demands it
- Document the system architecture and update it when services change
