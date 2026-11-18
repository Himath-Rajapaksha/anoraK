---
name: web-core-vitals
description: Use when measuring or improving Core Web Vitals (LCP, INP, CLS) for better user experience and SEO.
---

# Core Web Vitals

## When to Use This Skill
- Measuring LCP, INP, and CLS for a web page
- Diagnosing performance issues with Lighthouse or Web Vitals library
- Fixing layout shift caused by images, fonts, or dynamic content
- Improving interaction responsiveness for INP
- Optimizing largest contentful paint for perceived speed

## Workflow
1. Measure: install `web-vitals` library or use Lighthouse in Chrome DevTools
2. Identify the metric: LCP (loading), INP (interactivity), CLS (visual stability)
3. For LCP: optimize the largest element — preload images, use `fetchpriority="high"`
4. For INP: break up long tasks, use `requestIdleCallback` for non-critical work
5. For CLS: set explicit dimensions on images and embeds, use `font-display: swap`
6. Fix: address the highest-impact issues first
7. Re-measure: verify the fix improved the metric
8. Monitor: set up Real User Monitoring (RUM) for ongoing tracking

## Rules
- Measure on real devices, not just Lighthouse — use Chrome UX Report
- Target: LCP < 2.5s, INP < 200ms, CLS < 0.1
- Fix the biggest offender first — don't try to optimize everything at once
- Set explicit width and height on all images and videos
- Preload the LCP image with `<link rel="preload">`
- Avoid injecting content above existing content after page load
