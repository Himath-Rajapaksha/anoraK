---
name: vertex-ai
description: Use when developing on Google Vertex AI with Gemini models, the Gen AI SDK, grounding, or fine-tuning.
---

# Vertex AI

## When to Use This Skill
- Deploying Gemini models on Vertex AI
- Using the Gen AI SDK for Python or Node.js
- Implementing grounding with Google Search
- Fine-tuning models on custom data

## Workflow
1. Install the SDK: `pip install google-cloud-aiplatform`
2. Initialize: `aiplatform.init(project="my-project", location="us-central1")`
3. Load a Gemini model: `GenerativeModel("gemini-2.0-flash")`
4. Generate content: `model.generate_content("prompt")`
5. Enable grounding: `model.generate_content("prompt", tools=[grounding_tool])`
6. For fine-tuning: prepare training data in JSONL, submit a tuning job
7. Monitor job status and retrieve the tuned model endpoint

## Rules
- Use service accounts, not user credentials, for production
- Set appropriate safety thresholds for your use case
- Validate model outputs before using them in downstream systems
- Monitor Vertex AI usage and costs in the Google Cloud console
- Use region-specific endpoints for latency requirements
- Test with the free tier before committing to paid resources
