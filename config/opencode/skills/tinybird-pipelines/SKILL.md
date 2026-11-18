---
name: tinybird-pipelines
description: Use when building real-time data pipelines with Tinybird for analytics, event processing, or API endpoints.
---

# Tinybird Pipelines

## When to Use This Skill
- Ingesting real-time event data into Tinybird
- Writing SQL pipes for analytics and aggregations
- Exposing data as API endpoints
- Using the Tinybird CLI for development and deployment

## Workflow
1. Install the CLI: `pip install tinybird-cli`
2. Authenticate: `tb auth`
3. Create a datasource: define the schema in a `.datasource` file
4. Create a pipe: write SQL in a `.pipe` file
5. Push to Tinybird: `tb push`
6. Call the API: `GET /v0/pipes/<pipe_name>.json`
7. Use the Python or TypeScript SDK for integration
8. Schedule materialized views for pre-computed aggregations

## Rules
- Design datasource schemas for your query patterns — columns you filter on should come first
- Use materialized views for expensive aggregations
- Keep pipe SQL simple — avoid complex subqueries in real-time endpoints
- Test with `tb locally` before pushing to production
- Monitor API latency and throughput in the Tinybird dashboard
- Use batch ingestion for large historical imports, not streaming
