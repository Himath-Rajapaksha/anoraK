---
name: data-pipelines
description: Use when building or maintaining batch ETL or real-time streaming data pipelines. Covers Airflow DAGs, Kafka producers/consumers, validation, and monitoring.
---

# Data Pipelines

## When to Use This Skill

- Creating new batch or streaming data pipelines
- Migrating or refactoring existing ETL workflows
- Adding data validation or quality checks to pipelines
- Setting up monitoring and alerting for pipeline failures
- Integrating multiple data sources into a unified flow

## Workflow

1. Identify the data sources, destinations, and transformation requirements
2. Select the pipeline type: batch (Airflow) or streaming (Kafka) based on latency needs
3. Define the data schema and validation rules before implementation
4. Implement the pipeline with idempotent operations and proper error handling
5. Add data quality checks at ingestion and after transformations
6. Configure monitoring: success/failure alerts, latency metrics, and throughput dashboards
7. Test with representative data volumes and edge cases
8. Document the pipeline topology, dependencies, and recovery procedures

## Rules

- Every pipeline must have explicit error handling and retry logic with backoff
- Use idempotent operations so pipelines can safely re-run without data duplication
- Validate data at both ingestion and output stages—never trust upstream data blindly
- Keep pipeline stages small and focused; avoid monolithic DAGs or consumer chains
- Log all transformations and data lineage for auditability
- Set up alerting for failures, stalls, and data freshness SLAs before deploying to production
