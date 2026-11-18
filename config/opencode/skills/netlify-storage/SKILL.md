---
name: netlify-storage
description: Use when storing files or data on Netlify with Blobs, Netlify DB, or Image CDN.
---

# Netlify Storage

## When to Use This Skill
- Storing user uploads, session data, or cached content with Blobs
- Using a managed Postgres database with Netlify DB
- Optimizing images on-the-fly with Image CDN

## Workflow
1. For Blobs: `import { getStore } from '@netlify/blobs'`
2. Write data: `const store = getStore('my-store'); await store.set('key', value)`
3. Read data: `const value = await store.get('key')`
4. For Netlify DB: `import { getNetlifyDB } from '@netlify/db'`
5. Query: `const db = getNetlifyDB(); const result = db.sql('SELECT ...')`
6. For Image CDN: configure in `netlify.toml` with `[[images]]` rules
7. Access optimized images via `/.netlify/images?src=...&width=...`

## Rules
- Use Blobs for simple key-value storage, not relational data
- Use Netlify DB for structured data with relationships
- Set appropriate cache TTLs on Blob stores
- Don't store sensitive data without encryption at rest
- Test with `netlify dev` — Blobs and DB work locally
- Set storage quotas to prevent runaway costs
