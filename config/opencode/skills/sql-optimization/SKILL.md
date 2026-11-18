---
name: sql-optimization
description: Use when optimizing slow SQL queries, rewriting subqueries, or improving database performance through query restructuring.
---

# SQL Optimization

## When to Use This Skill
- Rewriting correlated subqueries as JOINs or CTEs
- Optimizing aggregate queries with large GROUP BY clauses
- Reducing query execution time by restructuring joins
- Eliminating unnecessary DISTINCT, ORDER BY, or LIMIT operations

## Workflow
1. Get the query and run `EXPLAIN (ANALYZE, BUFFERS)` to see the plan
2. Identify bottlenecks: sequential scans, hash joins on large tables, sorting
3. Check for correlated subqueries — rewrite as JOINs or lateral joins
4. Replace `SELECT *` with only the columns needed
5. Add appropriate indexes for WHERE, JOIN, and ORDER BY columns
6. Rewrite IN subqueries as EXISTS when the subquery is large
7. Use CTEs to break complex queries into readable, optimizable parts
8. Verify improvement with EXPLAIN ANALYZE on the rewritten query

## Rules
- Always measure before and after — don't guess at what's slow
- Use EXPLAIN ANALYZE, not EXPLAIN, to see actual row counts and timing
- Don't use DISTINCT to fix duplicate issues from bad JOINs — fix the JOIN
- Use covering indexes to avoid table lookups for frequently queried columns
- Avoid functions on indexed columns in WHERE clauses — they prevent index use
- Test optimized queries with production-like data volumes
