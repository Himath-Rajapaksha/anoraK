---
name: google-workspace
description: Use when managing Google Workspace resources (Drive, Sheets, Gmail, Calendar, Docs) via the CLI or API.
---

# Google Workspace

## When to Use This Skill
- Creating or reading files in Google Drive
- Manipulating spreadsheets in Google Sheets
- Sending emails via Gmail API
- Managing calendar events
- Working with Google Docs programmatically

## Workflow
1. Set up a Google Cloud project with the relevant APIs enabled
2. Create service account credentials or OAuth2 client
3. Authenticate: set `GOOGLE_APPLICATION_CREDENTIALS` env var
4. For Sheets: use the Sheets API to read/write ranges
5. For Gmail: use the Gmail API to send, read, or search emails
6. For Calendar: create, update, or delete events with the Calendar API
7. For Drive: upload, download, or share files

## Rules
- Use service accounts for server-to-server, OAuth for user-facing apps
- Respect Google API quotas — implement backoff on rate limits
- Don't store credentials in code — use environment variables
- Request only the scopes you need — minimize permissions
- Handle token refresh automatically for long-running processes
- Test with a dedicated test account, not a production workspace
