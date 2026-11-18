---
name: resend-email
description: Use when sending transactional or marketing emails with the Resend API using React Email templates.
---

# Resend Email

## When to Use This Skill
- Sending transactional emails from a Node.js or Python app
- Building email templates with React Email
- Handling delivery events with webhooks
- Managing domains and DNS records for email sending

## Workflow
1. Create a Resend account and get the API key
2. Install: `npm install resend` or `pip install resend`
3. Verify a domain: add SPF, DKIM, and DMARC DNS records
4. Send an email: `resend.emails.send({ from, to, subject, react: <Template /> })`
5. Use React Email for templates: `npm create email@latest`
6. Set up webhooks for delivery events: delivered, bounced, opened
7. Monitor delivery in the Resend dashboard

## Rules
- Use a verified domain for the `from` address
- Include unsubscribe links in marketing emails
- Handle bounces and complaints — they affect deliverability
- Don't send test emails from production domains
- Test templates across email clients (Gmail, Outlook, Apple Mail)
- Monitor bounce rate and reputation in the dashboard
