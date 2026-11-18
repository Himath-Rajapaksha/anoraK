---
name: courier-notifications
description: Use when sending notifications across channels (email, SMS, push, chat) with Courier for template management and delivery tracking.
---

# Courier Notifications

## When to Use This Skill
- Sending transactional emails, SMS, or push notifications
- Managing notification templates across channels
- Tracking delivery status and engagement
- Building preference centers for user notification settings

## Workflow
1. Create a Courier account and get the API key
2. Install the SDK: `npm install @trycourier/courier` or `pip install pycourier`
3. Create a notification template in the Courier dashboard
4. Send a notification: `courier.send({ recipientId, templateId, data })`
5. Handle delivery events with webhooks: delivered, opened, clicked
6. Build a preference center: let users opt in/out of notification types
7. Track analytics: delivery rate, open rate, and click rate

## Rules
- Use templates, not inline content, for consistency
- Respect user preferences — don't send opted-out notifications
- Handle bounces and failures gracefully — retry or alert
- Test across channels — email, SMS, and push render differently
- Include unsubscribe links in all email communications
- Monitor delivery metrics and alert on anomalies
