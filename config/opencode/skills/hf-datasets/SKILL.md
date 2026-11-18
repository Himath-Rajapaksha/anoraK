---
name: hf-datasets
description: Use when creating, loading, or uploading datasets on the Hugging Face Hub with configs and dataset cards.
---

# HF Datasets

## When to Use This Skill
- Creating datasets with multiple configurations or splits
- Uploading data to the Hub with proper dataset cards
- Querying datasets via the Dataset Viewer API or SQL
- Loading datasets for training or evaluation pipelines

## Workflow
1. Install dependencies: `pip install datasets`
2. Load a dataset: `ds = load_dataset("org/name", split="train")`
3. Create a dataset from local data: `Dataset.from_dict({"col": [...]})` or `Dataset.from_pandas(df)`
4. Add configurations if the dataset has multiple subsets: define `DatasetBuilder` subclasses
5. Push to Hub: `ds.push_to_hub("org/name", token=os.environ["HF_TOKEN"])`
6. Write a `README.md` with dataset card (description, uses, structure, licensing)
7. Verify with the Dataset Viewer API: `GET https://datasets-server.huggingface.co/rows?dataset=org/name&config=default&split=train`

## Rules
- Always include a dataset card (`README.md`) with metadata YAML frontmatter
- Use standard split names: `train`, `validation`, `test`
- Validate data quality before uploading — check for duplicates, missing values, and label balance
- Document column types and intended use cases
- Respect data licensing and privacy requirements
