---
name: clickhouse-patterns
description: Use when working with ClickHouse for analytical queries, designing schemas with merge tree engines, or optimizing partitioning and materialized views.
---

# ClickHouse Patterns

## When to Use This Skill

Use this skill when you need to design or optimize ClickHouse schemas, write efficient analytical queries, configure materialized views, or implement batch insert strategies for high-throughput workloads.

## Workflow

1. Identify the analytical query pattern and data access pattern
2. Select the appropriate merge tree engine variant (MergeTree, ReplacingMergeTree, AggregatingMergeTree)
3. Design partitioning strategy based on time ranges or query filters
4. Create materialized views for pre-aggregation or incremental updates
5. Implement batch inserts using the `INSERT ... VALUES` or `INSERT ... SELECT` pattern
6. Optimize queries by filtering on primary keys and avoiding unnecessary columns

## Rules

- Always use `ReplacingMergeTree` for deduplication scenarios instead of `MergeTree`
- Partition tables by time ranges (daily or monthly) for time-series data
- Use materialized views instead of manual aggregation for real-time dashboards
- Prefer `INSERT ... SELECT` over multiple single-row inserts for batch operations
- Filter on primary key columns first to leverage index pruning
- Avoid `SELECT *`—always specify required columns
- Use `FINAL` modifier sparingly as it impacts performance
