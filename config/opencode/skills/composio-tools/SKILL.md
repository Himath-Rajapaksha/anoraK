---
name: composio-tools
description: Use when connecting AI agents to external services with Composio for managed auth, pre-built actions, or trigger workflows.
---

# Composio Tools

## When to Use This Skill
- Connecting an AI agent to Gmail, Slack, GitHub, or other services
- Using pre-built actions instead of custom API integrations
- Setting up trigger-based workflows from external events
- Managing OAuth connections for users

## Workflow
1. Install Composio: `pip install composio-core` or `npm install composio`
2. Authenticate: `composio login` or set the API key
3. List available integrations: `composio get integrations`
4. Connect an account: `composio add <integration> --user-id <id>`
5. Use a tool: `composio execute <tool_name> --params '{...}'`
6. Set up triggers: define a webhook or polling trigger for an event
7. Handle trigger events: process the payload in your agent workflow
8. Monitor usage in the Composio dashboard

## Rules
- Don't store OAuth tokens — let Composio manage them
- Use user-scoped connections, not shared credentials
- Test with a sandbox account before connecting production services
- Handle rate limits and retries for external API calls
- Log all tool invocations for debugging and auditing
- Review Composio's permission scopes before connecting
