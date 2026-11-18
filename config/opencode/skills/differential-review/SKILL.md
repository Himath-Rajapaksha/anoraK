---
name: differential-review
description: Use when performing security-focused code reviews on diffs to find vulnerability introduction or unsafe patterns.
---

# Differential Review

## When to Use This Skill
- Reviewing a pull request for security issues
- Analyzing a diff for vulnerability introduction
- Tracing git history for security context
- Verifying security invariants hold after changes

## Workflow
1. Load the diff or changed files
2. Identify the security-relevant changes: auth, crypto, input handling, data access
3. Trace the context: read the surrounding code and git history
4. Check for unsafe patterns: SQL injection, XSS, path traversal, SSRF
5. Verify security invariants: input validation, access control, output encoding
6. Flag issues with clear explanations of the risk
7. Suggest specific fixes, not vague warnings

## Rules
- Focus on changed code — don't review unchanged code in the diff
- Check for vulnerability introduction, not just existing vulnerabilities
- Verify that input validation still applies after the change
- Look for hardcoded secrets, debug endpoints, or permissive CORS
- Check that error messages don't leak sensitive information
- Report with severity and exploitability assessment
