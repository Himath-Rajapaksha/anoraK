---
name: replicate-api
description: Use when running predictions on Replicate, managing deployments, or handling webhooks for async model inference.
---

# Replicate API

## When to Use This Skill
- Running predictions on hosted models via Replicate
- Searching and comparing models on the Replicate catalog
- Setting up webhooks for async prediction results
- Managing deployments and scaling

## Workflow
1. Install the client: `pip install replicate`
2. Authenticate: `export REPLICATE_API_TOKEN=<token>`
3. Run a prediction: `replicate.run("owner/model:version", input={"prompt": "..."})`
4. For async: create a prediction with `replicate.predictions.create()`, poll or use webhooks
5. Set up a webhook endpoint: `replicate.webhooks.create(url="https://your-endpoint/webhook")`
6. Handle webhook callbacks: verify signature, parse prediction result
7. Monitor costs and latency in the Replicate dashboard

## Rules
- Pin model versions — don't rely on `latest` in production
- Handle rate limits with exponential backoff
- Set appropriate timeouts — some models take minutes to run
- Validate webhook signatures before processing
- Cache results when the same input is requested repeatedly
- Monitor costs — set budget alerts in the dashboard
