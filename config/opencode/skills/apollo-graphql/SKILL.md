---
name: apollo-graphql
description: Use when building with Apollo GraphQL for schema design, resolver implementation, caching, subscriptions, or federation.
---

# Apollo GraphQL

## When to Use This Skill
- Designing GraphQL schemas and type definitions
- Implementing resolvers with Apollo Server
- Configuring client-side caching with Apollo Client
- Setting up subscriptions for real-time updates
- Federating schemas across microservices

## Workflow
1. Define the schema: types, queries, mutations, and subscriptions
2. Implement resolvers: `Query`, `Mutation`, and `Subscription` resolvers
3. Add data sources for database and API access
4. Configure caching: `InMemoryCache` with type policies
5. For subscriptions: set up WebSocket transport with `SubscriptionServer`
6. For federation: use `@apollo/gateway` to compose subgraph schemas
7. Test with Apollo Studio Sandbox
8. Deploy and monitor with Apollo Studio

## Rules
- Use code-first or schema-first consistently — don't mix approaches
- Keep resolvers thin — delegate to services for business logic
- Use DataLoader for N+1 prevention on every relationship
- Set cache policies per field, not globally
- Test subscriptions with simulated WebSocket connections
- Version federated schemas with `@link` directives
