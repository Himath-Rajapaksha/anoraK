---
name: hf-training
description: Use when training or fine-tuning language models with Hugging Face TRL (SFT, DPO, GRPO) or converting to GGUF.
---

# HF Model Training

## When to Use This Skill
- Supervised fine-tuning (SFT) of a base model on custom data
- Preference alignment with DPO or GRPO
- Converting trained models to GGUF for local inference

## Workflow
1. Install dependencies: `pip install trl transformers datasets`
2. Prepare dataset in the required format (instruction-input-output for SFT, chosen-rejected pairs for DPO)
3. Configure training: set base model, dataset, learning rate, batch size, and output directory
4. Run SFT: `trl sft --model_name_or_path <model> --dataset_name <data> --output_dir ./sft-output`
5. Run DPO: `trl dpo --model_name_or_path <sft-model> --dataset_name <pref-data> --output_dir ./dpo-output`
6. Run GRPO: `trl grpo --model_name_or_path <model> --dataset_name <data> --reward_model <reward> --output_dir ./grpo-output`
7. Convert to GGUF: `python convert_hf_to_gguf.py ./output --outfile model.gguf`
8. Test the converted model with llama.cpp or similar runtime

## Rules
- Validate dataset quality before training — remove duplicates and malformed examples
- Use appropriate learning rates: 1e-5 to 5e-5 for SFT, 1e-6 to 5e-6 for DPO
- Monitor loss curves for overfitting — stop if validation loss increases
- Save checkpoints at regular intervals for recovery
- Evaluate on held-out data before deploying
