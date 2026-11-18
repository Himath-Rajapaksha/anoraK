---
name: hf-evaluation
description: Use when benchmarking model performance, comparing models, or serving models for evaluation with vLLM and lighteval.
---

# HF Model Evaluation

## When to Use This Skill
- Running standardized benchmarks against a model
- Comparing multiple models on the same tasks
- Serving models for evaluation with vLLM
- Producing evaluation tables or reports

## Workflow
1. Install lighteval: `pip install lighteval`
2. Select benchmark tasks (e.g., `mmlu`, `hellaswag`, `arc_challenge`)
3. Run evaluation: `lighteval model <model-id> --tasks <task-list> --output-path ./results`
4. For custom serving: start vLLM server with `vllm serve <model-id> --port 8000`
5. Point lighteval at the local server: `lighteval model local --model-args endpoint=http://localhost:8000 --tasks <tasks>`
6. Compare results across models using the output JSON or CSV
7. Generate a summary table with metrics, latency, and cost estimates

## Rules
- Pin model versions and quantization settings for reproducibility
- Report both accuracy and latency — a fast wrong model is still wrong
- Use the same prompt format across all models being compared
- Document hardware specs (GPU type, memory) alongside results
- Store raw outputs, not just summary metrics
