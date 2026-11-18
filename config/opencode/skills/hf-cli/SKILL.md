---
name: hf-cli
description: Use when uploading, downloading, or managing models and datasets on the Hugging Face Hub via the CLI.
---

# Hugging Face CLI

## When to Use This Skill
- Uploading or downloading models, datasets, or spaces from the Hub
- Searching for models or datasets by task, library, or language
- Managing repo settings, tokens, and access permissions
- Automating Hub interactions in CI/CD pipelines

## Workflow
1. Install or update the `huggingface_hub` CLI: `pip install -U huggingface_hub`
2. Authenticate: `huggingface-cli login` — store token in environment, not code
3. Search for models: `huggingface-cli model search --task <task> --library <lib>`
4. Download a model: `huggingface-cli model download <repo-id> --local-dir ./models`
5. Upload artifacts: `huggingface-cli repo create <name> --type model && huggingface-cli upload <repo-id> ./local-path .`
6. Set repo visibility: `huggingface-cli repo update <repo-id> --private`
7. Verify uploads with `huggingface-cli repo info <repo-id>`

## Rules
- Never commit HF tokens to source control
- Use `--token` flag or `HF_TOKEN` env var, never inline credentials
- Pin model versions with specific revision tags in production
- Use `--commit-message` for meaningful upload history
- Test downloads in CI before deploying依赖它们的服务
