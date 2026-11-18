---
name: static-analysis
description: Use when running static analysis with CodeQL or Semgrep to find vulnerabilities or enforce code patterns.
---

# Static Analysis

## When to Use This Skill
- Scanning code for known vulnerability patterns
- Enforcing code standards across a large codebase
- Auditing a codebase before a security review
- Integrating analysis into CI pipelines

## Workflow
1. Choose the tool: CodeQL for deep semantic analysis, Semgrep for pattern-based scanning
2. For CodeQL: initialize the database, run queries, interpret results
3. For Semgrep: select rules or write custom ones, run against the codebase
4. Interpret SARIF output: focus on ERROR and WARNING severity findings
5. Triage results: filter false positives by understanding the code context
6. Fix confirmed issues and add regression tests
7. Integrate into CI: run on every PR, block merge on ERROR findings

## Rules
- Run static analysis in CI, not just locally
- Triage all findings before dismissing as false positives
- Use SARIF format for standardized output across tools
- Don't block PRs on INFO-level findings
- Keep rule sets updated as new vulnerabilities are discovered
- Document custom rules with their rationale
