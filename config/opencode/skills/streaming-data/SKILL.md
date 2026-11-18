---
name: streaming-data
description: Use when building real-time data systems with Kafka, Redis Streams, or event-driven architectures.
---

# Streaming Data

## When to Use This Skill
- Building real-time data ingestion with Kafka or Redis Streams
- Implementing consumer groups for parallel processing
- Designing event-driven architectures with message queues
- Handling exactly-once or at-least-once delivery semantics

## Workflow
1. Choose the broker: Kafka for high-throughput, Redis Streams for simpler setups
2. Define the topic/stream and message schema (Avro, JSON, Protobuf)
3. Implement producers: serialize messages, set partition keys, handle acknowledgments
4. Implement consumers: subscribe to topics, process messages, commit offsets
5. Configure consumer groups for parallel processing across partitions
6. Add dead-letter queues for messages that fail processing
7. Monitor lag, throughput, and error rates in the broker dashboard
8. Test with realistic message volumes and failure scenarios

## Rules
- Design messages to be self-contained — consumers shouldn't need external context
- Use idempotent consumers so retries don't cause duplicates
- Set appropriate retention periods — keep messages long enough for replays
- Handle schema evolution gracefully with versioned schemas
- Monitor consumer lag and set alerts for growing backlogs
- Never commit offsets before processing completes (at-least-once)
