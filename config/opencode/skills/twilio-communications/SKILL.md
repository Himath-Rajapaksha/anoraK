---
name: twilio-communications
description: Use when building with Twilio for SMS, voice calls, video, or WhatsApp messaging.
---

# Twilio Communications

## When to Use This Skill
- Sending SMS or WhatsApp messages
- Making and receiving voice calls
- Setting up video rooms for real-time communication
- Handling webhooks for message and call events

## Workflow
1. Create a Twilio account and get the Account SID and Auth Token
2. Install: `pip install twilio` or `npm install twilio`
3. Send an SMS: `client.messages.create({ body, from, to })`
4. For voice: create a TwiML response with `<Say>` or `<Gather>`
5. For video: create a room with `client.video.v1.rooms.create()`
6. Handle webhooks: process status callbacks for delivered messages
7. Test with Twilio test credentials, not production numbers

## Rules
- Never expose the Auth Token in client-side code
- Use test credentials for development — don't send real messages
- Handle delivery status webhooks to confirm message delivery
- Respect rate limits and carrier regulations
- Include opt-out instructions in SMS messages
- Monitor usage to prevent unexpected charges
