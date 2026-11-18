---
name: contextual-commits
description: Use when committing code that involves architectural decisions, tradeoffs, or non-obvious choices that future developers need to understand.
---

# Contextual Commits

## When to Use This Skill
- Committing code with architectural decisions that need explanation
- Documenting tradeoffs made during implementation
- Explaining non-obvious choices that future developers will question
- Preserving context that would otherwise be lost

## Workflow
1. Identify what's non-obvious about the change: why this approach, not another
2. Write the commit subject as usual: `<type>(<scope>): <subject>`
3. In the body, explain the reasoning: what alternatives were considered and why this approach was chosen
4. Document tradeoffs: what was sacrificed and what was gained
5. Reference related discussions, issues, or research
6. Keep the body focused on "why", not "what" (the diff shows the "what")

## Rules
- Explain reasoning, not just changes — the diff shows what changed
- Document alternatives considered and why they were rejected
- Reference related issues, discussions, or documentation
- Keep the explanation concise — one paragraph is usually enough
- Don't repeat the diff in the commit message
- Use this style for architectural decisions, not routine changes
