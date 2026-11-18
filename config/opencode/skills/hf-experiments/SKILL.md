---
name: hf-experiments
description: Use when tracking ML experiments, logging metrics, or comparing training runs visually.
---

# HF Experiment Tracking

## When to Use This Skill
- Logging training or evaluation metrics across runs
- Visualizing training progress in real-time dashboards
- Comparing multiple experiments side by side
- Sharing results with a team for review

## Workflow
1. Initialize tracking: `import wandb; wandb.init(project="my-project", name="run-name")`
2. Log metrics during training: `wandb.log({"loss": loss_val, "acc": acc_val})`
3. Log hyperparameters: `wandb.config.update({"lr": 1e-4, "epochs": 10})`
4. Log artifacts (models, datasets): `wandb.log_artifact("model.pt")`
5. Review runs in the dashboard at `https://wandb.ai/<entity>/<project>`
6. Compare runs using the built-in comparison view
7. Export results for reporting or archival

## Rules
- Use consistent metric names across all runs
- Log hyperparameters at run start, not after training begins
- Tag runs with meaningful names that describe the experiment variant
- Never log sensitive data or credentials as metrics
- Archive completed runs with final metric summaries
