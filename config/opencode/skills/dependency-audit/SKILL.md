---
name: dependency-audit
description: Checks for vulnerable, outdated, or risky dependencies
---

# dependency-audit

Checks for vulnerable, outdated, or risky dependencies.

## When to Use

Use this skill when:
- The user asks about dependency security
- Before deploying to production
- Setting up CI/CD pipelines
- After adding new dependencies

## Audit Steps

1. **Identify package manager** — npm, cargo, go modules, pip, etc.
2. **Run audit command**:
   - npm: `npm audit`
   - cargo: `cargo audit`
   - go: `govulncheck ./...`
   - pip: `pip-audit`
3. **Check for outdated packages** — `npm outdated`, `cargo outdated`
4. **Review findings** — Categorize by severity
5. **Recommend updates** — Patch, minor, or major version changes

## Risk Assessment

### Critical/High
- Remote code execution
- Authentication bypass
- Data exfiltration
→ Update immediately

### Medium
- Denial of service
- Information disclosure
→ Update within week

### Low
- Theoretical attacks
- Minor information leaks
→ Schedule update

## Output Format

```
## Dependency Audit Report

**Project:** [name]
**Package Manager:** [npm/cargo/go/pip]
**Total Dependencies:** N

### Vulnerabilities
| Package | Severity | Description | Fix |
|---------|----------|-------------|-----|
| pkg | HIGH | RCE via... | upgrade to 1.2.3 |

### Outdated Packages
| Package | Current | Latest | Type |
|---------|---------|--------|------|
| pkg | 1.0.0 | 1.2.3 | minor |

### Recommendations
1. [immediate] Update X to fix CVE-YYYY-NNNN
2. [scheduled] Upgrade Y for performance improvements
```

## Rules

- NEVER ignore critical vulnerabilities
- Check both direct and transitive dependencies
- Consider supply chain risks (maintainer trust, download count)
- Recommend pinning versions in production
