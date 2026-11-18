---
name: nextjs-upgrade
description: Use when upgrading Next.js versions, migrating from Pages to App Router, or resolving breaking changes.
---

# Next.js Upgrade

## When to Use This Skill
- Upgrading to a new Next.js major or minor version
- Migrating from Pages Router to App Router
- Updating dependencies after a version bump
- Running codemods to fix breaking changes

## Workflow
1. Check the changelog for the target version: `https://nextjs.org/blog`
2. Update dependencies: `npm install next@latest react@latest react-dom@latest`
3. Run the codemod tool: `npx @next/codemod@latest upgrade`
4. Fix any TypeScript errors: `npx tsc --noEmit`
5. Test the build: `npm run build` — fix errors before testing
6. Test the dev server: `npm run dev` — verify pages render correctly
7. For Pages to App Router: create `app/` directory, move pages incrementally
8. Deploy to a preview environment and verify all routes

## Rules
- Read the changelog before upgrading — don't skip breaking changes
- Upgrade one major version at a time, not multiple at once
- Run codemods first, then fix remaining issues manually
- Test every route after the upgrade — don't assume partial coverage
- Keep Pages Router and App Router side by side during migration
- Deploy to preview before production — catch issues in staging
