---
name: git-release
description: Automates changelog generation and version tagging via gh CLI
---

# git-release

Automates changelog generation and version tagging via `gh` CLI.

## When to Use

Use this skill when:
- The user asks to create a release
- It's time to bump versions and tag a release
- Changelog needs to be generated from commits

## Workflow

1. **Determine version bump** — Check commits since last tag:
   - `git log $(git describe --tags --abbrev=0)..HEAD --oneline`
   - `feat:` commits → minor bump
   - `fix:` commits → patch bump
   - Breaking changes → major bump
2. **Update version** — Modify version in relevant files (package.json, Cargo.toml, etc.)
3. **Generate changelog** — Group commits by type:
   - Features
   - Bug Fixes
   - Breaking Changes
   - Other changes
4. **Commit release** — `git commit -am "release: v<version>"`
5. **Tag** — `git tag -a v<version> -m "Release v<version>"`
6. **Push** — `git push origin main --tags`
7. **Create GitHub release** — `gh release create v<version> --title "v<version>" --notes "<changelog>"`

## Changelog Format

```markdown
## v1.2.0 (2026-09-13)

### Features
- feature description (commit-hash)

### Bug Fixes
- fix description (commit-hash)

### Breaking Changes
- breaking change description (commit-hash)
```

## Rules

- ALWAYS check for existing tags before bumping
- ALWAYS verify no uncommitted changes before release
- If `gh` is not installed, fall back to git-only workflow
- Ask user to confirm version before pushing
