---
name: eslint-config
description: Use when setting up or configuring ESLint rules for a JavaScript or TypeScript project.
---

# ESLint Config

## When to Use This Skill
- Setting up ESLint in a new project
- Configuring rules for TypeScript, React, or other frameworks
- Migrating from older ESLint configs (`.eslintrc` to flat config)
- Adding custom rules or plugins

## Workflow
1. Install ESLint: `npm install -D eslint @eslint/js typescript-eslint`
2. Create `eslint.config.js` (flat config format)
3. Import and extend recommended configs: `tseslint.configs.recommended`
4. Add framework plugins (React, Vue, etc.) if applicable
5. Define overrides for specific file patterns (e.g., test files, config files)
6. Run: `npx eslint .` and fix auto-fixable issues: `npx eslint . --fix`
7. Add to `package.json` scripts and CI pipeline

## Rules
- Use flat config format (`eslint.config.js`) — not legacy `.eslintrc`
- Don't disable rules globally — disable per-line with `// eslint-disable-next-line` when needed
- Keep the config minimal — only add rules that catch real issues
- Use `typescript-eslint` for TypeScript projects, not separate parsers
- Test the config against the codebase before committing
