---
name: secrets-management
description: Use when managing secrets with environment variables, secret managers, credential rotation, or secret scanning.
---

# Secrets Management

## When to Use This Skill
- Storing secrets with a secret manager (Vault, AWS SSM, GCP Secret Manager)
- Rotating credentials and API keys
- Scanning code for leaked secrets
- Setting up environment-based secret management

## Workflow
1. Audit existing secrets: scan the codebase for hardcoded credentials
2. Choose a secret manager: HashiCorp Vault, AWS SSM, GCP Secret Manager
3. Store secrets: create entries for each secret with appropriate access policies
4. Retrieve secrets: use the SDK to fetch secrets at runtime
5. Set up rotation: schedule regular credential rotation
6. Scan for leaks: add pre-commit hooks or CI checks for secret detection
7. Monitor: alert on unauthorized secret access attempts

## Rules
- Never commit secrets to source control — use environment variables or secret managers
- Rotate credentials regularly — don't let them sit indefinitely
- Use least-privilege access policies for secret retrieval
- Scan for leaked secrets in every PR and before every deployment
- Use short-lived tokens when possible (OIDC, STS)
- Audit secret access — log who retrieved what and when
