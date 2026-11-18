---
name: cloudflare-email
description: Use when sending or receiving email through Cloudflare. Covers Email Sending, Email Routing, and webhook handling.
---

# Cloudflare Email

## When to Use This Skill
- Sending transactional email from a Worker using Cloudflare Email API
- Configuring Email Routing to forward inbound mail to Workers or external addresses
- Processing inbound email via the `email` trigger in a Worker
- Setting up webhooks for email delivery events (sent, delivered, bounced)

## Workflow
1. Identify the direction: **sending** (outbound) or **receiving** (inbound)
2. For sending: configure an Email API token, create a Worker that calls the send endpoint, and add the required DNS records (SPF, DKIM, DMARC)
3. For receiving: enable Email Routing on the target domain, create a catch-all route, and write a Worker to handle the `email` event
4. Add the `email` handler to the Worker using `addEmailHandler` or export a default handler
5. Parse the inbound message from the `MailMessage` object (headers, text body, HTML body, attachments)
6. Deploy and test by sending a message through the configured address

## Rules
- Always verify DNS records before enabling Email Routing on production domains
- Use `env.EMAIL_API_TOKEN` — never hardcode API credentials
- Handle both plain-text and HTML bodies in inbound workers
- Set `allowlist` or address rules to prevent open relay when using catch-all routing
- Test with `wrangler dev` email simulation before deploying
