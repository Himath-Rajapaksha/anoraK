---
name: hf-paper-publishing
description: Use when publishing research papers on the Hugging Face Hub with linked models and datasets.
---

# HF Paper Publishing

## When to Use This Skill
- Publishing a research paper on the Hub
- Linking models and datasets to a paper page
- Formatting content for the paper page
- Sharing research with the ML community

## Workflow
1. Create a new Space with the `paper` template
2. Write content in Markdown with YAML frontmatter for metadata
3. Link related models: add `model` entries in the frontmatter pointing to repos
4. Link related datasets: add `dataset` entries in the frontmatter
5. Include figures as images in the Space repo
6. Push to the Space repo to publish
7. Verify the paper page renders correctly with all linked resources

## Rules
- Use clear, descriptive titles and abstracts
- Link all related models and datasets — don't make readers search for them
- Include reproducibility information: model versions, hardware, training details
- Follow academic citation conventions for references
- Update the paper page if models or datasets are revised
