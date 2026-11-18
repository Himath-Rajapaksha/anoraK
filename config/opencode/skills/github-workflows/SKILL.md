---
name: github-workflows
description: Use when working with GitHub — creating PRs, managing branch protection, using GitHub Actions, or conducting code reviews.
---

# GitHub Workflows

## When to Use This Skill
- Creating pull requests with proper descriptions and labels
- Setting up branch protection rules
- Writing GitHub Actions workflows
- Conducting code reviews with actionable feedback

## Workflow
1. Create a PR: push a branch and open a PR with a descriptive title
2. Write the PR description: what changed, why, and how to test
3. Add labels: type (bug, feature), size (S/M/L), status (needs review)
4. Set up branch protection: require status checks, reviews, and up-to-date branches
5. Write GitHub Actions: define triggers, jobs, and steps in `.github/workflows/`
6. Review PRs: focus on correctness, security, and design — not style
7. Merge: use squash merge for clean history, rebase for linear history

## Rules
- PR titles should follow conventional commit format
- Require at least one review before merging
- Set up status checks: lint, test, build must pass
- Keep PRs small — under 400 lines of diff when possible
- Review for correctness, not just style — use linters for formatting
- Don't merge with unresolved conversations
