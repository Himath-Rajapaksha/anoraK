---
name: supply-chain-security
description: Use when securing the software supply chain — verifying package integrity, auditing dependencies, or protecting CI/CD pipelines.
---

# Supply Chain Security

## When to Use This Skill
- Verifying package integrity with lockfiles and checksums
- Auditing dependencies for known vulnerabilities
- Generating SBOMs (Software Bill of Materials)
- Protecting CI/CD pipelines from tampering

## Workflow
1. Use lockfiles: `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml` — commit them
2. Audit dependencies: `npm audit`, `pip-audit`, `cargo audit`
3. Pin dependency versions — don't use ranges in production
4. Verify package integrity: check checksums and signatures
5. Generate SBOM: `syft` or `cyclonedx` for the project
6. Scan for vulnerabilities: `grype` or `trivy` against the SBOM
7. Protect CI/CD: use signed commits, protected branches, and secret scanning
8. Monitor for new vulnerabilities: set up Dependabot or Renovate

## Rules
- Never install packages without verifying the source
- Use lockfiles and commit them — they ensure reproducible builds
- Pin versions in production, not just development
- Run vulnerability scans on every PR and before every deploy
- Generate SBOMs for compliance and incident response
- Review dependencies for typosquatting — check the package name carefully
