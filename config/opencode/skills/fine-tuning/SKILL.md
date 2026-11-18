---
name: fine-tuning
description: Use when fine-tuning LLMs on custom data with LoRA, QLoRA, or full-parameter training.
---

# Fine-Tuning

## When to Use This Skill
- Adapting a base model to a specific domain or task
- Improving model performance on specialized datasets
- Reducing inference cost by creating smaller, focused models
- Preparing training data and evaluating fine-tuned results

## Workflow
1. Prepare the dataset: instruction-following format for chat, input-output pairs for tasks
2. Clean and deduplicate data — quality matters more than quantity
3. Choose a base model and fine-tuning method: full params for large datasets, LoRA/QLoRA for efficiency
4. Configure training: learning rate, batch size, epochs, warmup steps
5. Train with Hugging Face TRL or Axolotl: `trl sft --model_name_or_path <model> --dataset_name <data>`
6. Evaluate on a held-out test set — measure task-specific metrics
7. Export the fine-tuned model: save adapter weights or merge into base model
8. Test inference with representative prompts before deployment

## Rules
- Validate dataset quality before training — remove duplicates, malformed examples, and noise
- Use LoRA/QLoRA when GPU memory is limited — full fine-tuning requires significant resources
- Monitor validation loss to detect overfitting early
- Save checkpoints at regular intervals for recovery
- Evaluate with task-specific metrics, not just loss
- Document the training configuration and dataset for reproducibility
