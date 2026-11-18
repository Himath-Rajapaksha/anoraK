---
name: postgres-best-practices
description: Use when writing efficient PostgreSQL queries, designing indexes, optimizing performance, or setting up connection pooling.
---

# PostgreSQL Best Practices

## When to Use This Skill
- Designing indexes for query performance
- Analyzing and optimizing slow queries with EXPLAIN ANALYZE
- Setting up connection pooling for high-traffic applications
- Implementing table partitioning for large datasets
- Avoiding common PostgreSQL anti-patterns

## Workflow
1. Identify the slow query or performance bottleneck
2. Run `EXPLAIN (ANALYZE, BUFFERS) <query>` to understand the query plan
3. Check for sequential scans on large tables — add an index
4. Choose the right index type: B-tree for equality/range, GIN for full-text/array, GiST for geometric
5. Add the index: `CREATE INDEX CONCURRENTLY idx_name ON table (column)`
6. Set up PgBouncer for connection pooling: configure `pool_mode = transaction`
7. For large tables: partition by range (time) or hash (ID)
8. Re-run EXPLAIN to verify the plan uses the new index

## Rules
- Always use `CREATE INDEX CONCURRENTLY` to avoid locking writes
- Don't over-index — each index slows down writes
- Use `EXPLAIN ANALYZE`, not just `EXPLAIN`, to see actual execution times
- Set `shared_buffers` to 25% of system RAM for dedicated PostgreSQL
- Use connection pooling — don't let application servers open unlimited connections
- Vacuum and analyze regularly — don't rely on autovacuum for all maintenance
