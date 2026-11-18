---
name: notion-automation
description: Use when automating Notion — querying databases, creating pages, updating properties, or syncing with other tools.
---

# Notion Automation

## When to Use This Skill
- Querying a Notion database with filters and sorts
- Creating or updating pages programmatically
- Managing relations between pages and databases
- Syncing Notion data with external systems
- Building workflows that trigger on Notion changes

## Workflow
1. Create an integration at developers.notion.com
2. Share databases with the integration: click "Connect to" in the database menu
3. Install the SDK: `npm install @notionhq/client` or `pip install notion-client`
4. Query a database: `notion.databases.query({ database_id, filter, sorts })`
5. Create a page: `notion.pages.create({ parent, properties, children })`
6. Update a page: `notion.pages.update({ page_id, properties })`
7. Add blocks as children: `notion.blocks.children.append({ block_id, children })`
8. Handle webhooks for real-time updates (if available)

## Rules
- Store the integration token in environment variables, never in code
- Respect Notion's rate limits — implement exponential backoff
- Use the `start_cursor` for pagination on large databases
- Validate page properties before creating — Notion is strict about types
- Test with a dedicated workspace, not production data
- Log API responses for debugging failed operations
