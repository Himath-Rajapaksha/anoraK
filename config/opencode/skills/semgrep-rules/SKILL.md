---
name: semgrep-rules
description: Use when writing custom Semgrep rules to detect vulnerability patterns or enforce code standards.
---

# Semgrep Rules

## When to Use This Skill
- Detecting specific vulnerability patterns in code
- Enforcing custom coding standards across a codebase
- Creating rules for organization-specific security issues
- Testing rules against known-good and known-bad code samples

## Workflow
1. Identify the pattern: what code structure indicates the issue
2. Write a rule in YAML with `pattern` or `patterns` fields
3. Use `pattern-inside` and `pattern-not` to refine scope
4. Add `message` explaining what the rule detects and why it matters
5. Set `severity`: ERROR for security, WARNING for quality, INFO for style
6. Test: `semgrep --test --config rule.yaml`
7. Run against the codebase: `semgrep --config rule.yaml`
8. Tune false positives with `pattern-not` and `metavariable-comparison`

## Rules
- Write rules that detect real issues, not style preferences
- Test with both positive (should match) and negative (should not match) samples
- Use metavariables (`$X`) for flexible matching
- Keep rules focused — one rule, one issue
- Document the rule with a clear message and reference link
