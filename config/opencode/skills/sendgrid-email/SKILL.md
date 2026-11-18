---
name: sendgrid-email
description: Use when sending emails with SendGrid, managing templates, handling bounces, or tracking delivery metrics.
---

# SendGrid Email

## When to Use This Skill
- Sending transactional or marketing emails via SendGrid API
- Creating dynamic email templates with handlebars
- Handling bounces, complaints, and unsubscribes
- Tracking delivery, open, and click rates

## Workflow
1. Create a SendGrid account and generate an API key
2. Verify a sender domain: add DNS records for SPF and DKIM
3. Install: `npm install @sendgrid/mail` or `pip install sendgrid`
4. Send an email: `sgMail.send({ to, from, subject, text, html })`
5. Use dynamic templates: create in the dashboard, pass `dynamicTemplateData`
6. Set up event webhooks: configure a URL for delivery events
7. Handle events: process bounces, blocks, and unsubscribes
8. Monitor analytics in the SendGrid dashboard

## Rules
- Never expose the API key in client-side code
- Authenticate your domain to improve deliverability
- Use unsubscribe groups for marketing emails
- Handle 429 rate limits with exponential backoff
- Test with the SendGrid sandbox before sending to real users
- Monitor spam reports and reputation score
