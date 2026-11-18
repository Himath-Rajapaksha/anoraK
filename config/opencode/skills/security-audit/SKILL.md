---
name: security-audit
description: Performs security audits and identifies vulnerabilities in codebases
---

# security-audit

Performs security audits and identifies vulnerabilities in codebases.

## When to Use

Use this skill when:
- The user asks for a security review
- Before deploying to production
- After adding authentication or authorization logic
- When handling sensitive data (PII, credentials, tokens)

## Audit Areas

### Input Validation
- All user inputs sanitized before use?
- Parameterized queries used (no string concatenation)?
- File uploads validated (type, size, content)?

### Authentication & Authorization
- Passwords hashed with bcrypt/argon2 (not MD5/SHA1)?
- Sessions properly invalidated on logout?
- RBAC/ABAC checks on all endpoints?
- No hardcoded credentials?

### Data Protection
- Sensitive data encrypted at rest and in transit?
- PII not logged unnecessarily?
- API keys in environment variables, not code?
- CORS properly configured?

### Dependencies
- No known CVEs in dependencies?
- Dependencies pinned to specific versions?
- Supply chain risks assessed?

### Configuration
- Debug mode disabled in production?
- Error messages don't leak internals?
- Security headers set (CSP, HSTS, X-Frame-Options)?

## Output Format

```
## Security Audit Report

**Scope:** [files/endpoints reviewed]
**Risk Level:** LOW / MEDIUM / HIGH / CRITICAL

### Findings

#### [SEVERITY] Finding Title
- **Location:** `file:line`
- **Description:** What the issue is
- **Impact:** What an attacker could do
- **Recommendation:** How to fix it

### Summary
- Critical: N
- High: N
- Medium: N
- Low: N
```

## Rules

- NEVER ignore even low-severity findings
- ALWAYS provide remediation steps
- Prioritize findings by exploitability
- Check for OWASP Top 10 vulnerabilities
