---
name: hf-vision-training
description: Use when training or fine-tuning vision models for image classification, object detection, or other computer vision tasks.
---

# HF Vision Training

## When to Use This Skill
- Fine-tuning pretrained vision models on custom image data
- Building image classification or object detection pipelines
- Deploying vision models to production

## Workflow
1. Install dependencies: `pip install transformers datasets torchvision`
2. Load a pretrained model: `AutoModelForImageClassification.from_pretrained("google/vit-base-patch16-224")`
3. Prepare dataset with `ImageFolder` or HF Datasets with image features
4. Apply transformations: resize, normalize, augmentation for training split
5. Configure training arguments: learning rate, batch size, epochs, evaluation strategy
6. Train with `Trainer` or `SFTTrainer` from TRL
7. Evaluate on test set with accuracy, precision, recall, F1
8. Export to ONNX or TorchScript for production deployment

## Rules
- Use appropriate image sizes for the model architecture (e.g., 224x224 for ViT)
- Apply data augmentation only to training splits, not validation/test
- Freeze backbone layers for small datasets, fine-tune fully for large ones
- Report per-class metrics, not just overall accuracy
- Validate on diverse data — check for bias across categories
