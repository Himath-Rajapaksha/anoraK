---
name: duckdb-analytics
description: Use when running analytical SQL queries on local files, DataFrames, or in-process data with DuckDB.
---

# DuckDB Analytics

## When to Use This Skill
- Running SQL queries on CSV, Parquet, or JSON files
- Analyzing DataFrames from pandas or Polars without a database server
- Using window functions, CTEs, or complex aggregations in-process
- Building data pipelines that need embedded analytical queries

## Workflow
1. Install: `pip install duckdb`
2. Query a file directly: `duckdb.sql("SELECT * FROM 'data.parquet' WHERE col > 10")`
3. Query a pandas DataFrame: `duckdb.sql("SELECT * FROM df WHERE col > 10")`
4. Use CTEs and window functions: `WITH cte AS (...) SELECT *, ROW_NUMBER() OVER (...) FROM cte`
5. Write results to Parquet: `duckdb.sql("COPY (...) TO 'output.parquet' (FORMAT PARQUET)")`
6. Use the Python API for interactive analysis: `conn = duckdb.connect(); conn.execute(query)`
7. Integrate with Polars for zero-copy DataFrame operations

## Rules
- Use DuckDB for analytics, not transactional workloads
- Prefer Parquet over CSV for large files — it's faster and typed
- Use `read_parquet` and `read_csv_auto` for automatic schema detection
- Avoid loading entire datasets into memory — let DuckDB handle batching
- Use `EXPLAIN` to understand query plans before optimizing
- Don't use DuckDB as a production database — it's for analytics and development
