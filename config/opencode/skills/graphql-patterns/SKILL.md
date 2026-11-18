---
name: graphql-patterns
description: Use when designing GraphQL schemas, implementing resolvers, or optimizing query performance with DataLoader.
---

# GraphQL Patterns

## When to Use This Skill
- Designing type definitions and schema structure
- Implementing resolvers with proper error handling
- Preventing N+1 query problems with DataLoader
- Setting up subscriptions for real-time updates
- Federating schemas across microservices

## Workflow
1. Design the schema first — define types, queries, mutations, and subscriptions
2. Map domain entities to GraphQL types with clear field names
3. Implement resolvers: one resolver per field, keep them thin
4. Add DataLoader for any field that triggers a database or API call
5. Implement error handling with GraphQL errors and custom extensions
6. Add input validation at the resolver level, not just the schema level
7. Set up query complexity limits to prevent abuse
8. Test with GraphQL playground and verify query performance

## Rules
- Use input types for mutations, never raw scalar arguments
- Return consistent error shapes across all resolvers
- Batch database queries with DataLoader — never query in a loop
- Use fragments to reduce duplication in client queries
- Version the schema with `@deprecated` directives, never remove fields
- Monitor query performance and set complexity budgets
