---
name: terraform
description: Use when writing Terraform configurations for infrastructure as code on AWS, GCP, or Azure.
---

# Terraform

## When to Use This Skill
- Writing new Terraform modules for cloud infrastructure
- Managing state with remote backends
- Importing existing resources into Terraform
- Testing Terraform configurations with `terraform test`

## Workflow
1. Initialize the project: `terraform init`
2. Write resources in `.tf` files: provider, resources, variables, outputs
3. Use variables for reusable values: `variable "region" { type = string }`
4. Organize into modules for reusable components
5. Set up remote state: S3 + DynamoDB for AWS, GCS for GCP
6. Plan before applying: `terraform plan -out=tfplan`
7. Apply: `terraform apply tfplan`
8. Test: `terraform test` to validate configurations

## Rules
- Never commit state files to Git
- Use remote state with locking to prevent concurrent modifications
- Pin provider versions to avoid breaking changes
- Use `terraform plan` before every apply — review the changes
- Import existing resources before making changes to them
- Use modules for any resource used more than once
- Tag all resources for cost tracking and discovery
