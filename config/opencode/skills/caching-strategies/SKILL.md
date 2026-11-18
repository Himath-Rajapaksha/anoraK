---
name: caching-strategies
description: Use when implementing caching at the application, CDN, or database layer to improve performance and reduce load.
---

# Caching Strategies

## When to Use This Skill
- Choosing a caching strategy (cache-aside, write-through, write-behind)
- Implementing browser caching with HTTP headers
- Setting up CDN caching for static and dynamic content
- Adding application-level caching with Redis or Memcached
- Invalidating cached data correctly

## Workflow
1. Identify what to cache: API responses, database queries, computed results
2. Choose the layer: browser (HTTP headers), CDN (edge), application (Redis), or database (query cache)
3. Set TTLs based on data freshness requirements
4. Implement cache-aside: check cache first, fetch from source on miss, store in cache
5. Add cache invalidation: event-driven or time-based
6. Monitor cache hit rate — aim for >80% for hot paths
7. Handle cache stampedes: use locks or stale-while-revalidate

## Rules
- Cache at the lowest layer that meets your freshness requirements
- Always set a TTL — never cache indefinitely
- Invalidate explicitly, not just by expiration
- Use stale-while-revalidate for better user experience
- Monitor cache hit rates and evictions
- Don't cache error responses — cache only successful results
