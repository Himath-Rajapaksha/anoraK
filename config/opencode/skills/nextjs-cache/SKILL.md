---
name: nextjs-cache
description: Use when optimizing Next.js performance with fetch cache, router cache, full route cache, or revalidation strategies.
---

# Next.js Caching

## When to Use This Skill
- Configuring fetch cache for data fetching
- Using the router cache for client-side navigation
- Leveraging full route cache for static rendering
- Implementing `unstable_cache` for custom cache keys
- Setting up revalidation tags for on-demand invalidation

## Workflow
1. For fetch: add `cache: 'force-cache'` or `next: { revalidate: 3600 }`
2. For full route cache: export `export const dynamic = 'force-static'`
3. For custom cache: `unstable_cache(fetchData, ['key'], { tags: ['tag'] })`
4. Revalidate by time: `revalidate = 60` in page or layout config
5. Revalidate by tag: `revalidateTag('tag')` after data mutation
6. Clear router cache: `router.refresh()` after client-side mutations
7. Monitor cache behavior with `x-nextjs-cache` header

## Rules
- Default to static rendering — only use dynamic when freshness is required
- Use revalidation tags for on-demand cache invalidation
- Don't cache user-specific data in the full route cache
- Use `unstable_cache` for expensive computations with custom keys
- Test cache behavior in development and production — they differ
- Monitor `x-nextjs-cache` header to verify cache hits
