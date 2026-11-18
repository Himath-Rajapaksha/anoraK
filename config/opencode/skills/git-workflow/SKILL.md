---
name: git-workflow
description: Use when managing Git workflows — branching strategies, commit conventions, merge vs rebase, or resolving conflicts.
---

# Git Workflow

## When to Use This Skill
- Choosing a branching strategy (trunk-based, git-flow, GitHub flow)
- Deciding between merge and rebase for integrating changes
- Resolving merge conflicts cleanly
- Writing meaningful commit messages and PR descriptions

## Workflow
1. Choose a branching strategy: trunk-based for small teams, git-flow for release cycles
2. Create feature branches from the main branch
3. Make small, focused commits with conventional commit messages
4. Rebase or merge to integrate: rebase for clean history, merge for traceability
5. Resolve conflicts: read both sides, keep the intended behavior, test the result
6. Open a PR with a clear description of what and why
7. Review and address feedback before merging

## Rules
- Keep the main branch always deployable
- Use feature branches for all non-trivial changes
- Rebase before opening a PR to keep the history clean
- Don't force-push shared branches
- Write commit messages that explain why, not just what
- Resolve conflicts by understanding both sides, not just picking one
