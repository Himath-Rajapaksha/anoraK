---
name: transformers-js
description: Use when running ML models in the browser or Node.js with Transformers.js for inference tasks like classification, generation, or embeddings.
---

# Transformers.js

## When to Use This Skill
- Running ML models directly in the browser without a server
- Performing text classification, summarization, or translation client-side
- Generating embeddings for semantic search
- Running image segmentation or object detection in the browser

## Workflow
1. Install: `npm install @huggingface/transformers`
2. Import the pipeline: `import { pipeline } from '@huggingface/transformers'`
3. Create a task pipeline: `const classifier = await pipeline('sentiment-analysis', 'Xenova/bert-base-uncased')`
4. Run inference: `const result = await classifier('This is great!')`
5. For embeddings: `const extractor = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2')`
6. Handle model loading — first run downloads and caches the model
7. Optimize with quantized models for smaller bundle size

## Rules
- Use quantized models for browser deployment to reduce download size
- Cache models in IndexedDB for repeat visits
- Handle model loading states — show a spinner, not a blank page
- Set reasonable timeouts — some models are slow on low-end hardware
- Test across browsers — Safari, Chrome, Firefox have different WASM performance
- Don't run large models (>500MB) in the browser without user consent
