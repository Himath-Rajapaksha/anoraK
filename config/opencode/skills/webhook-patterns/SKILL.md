---
name: webhook-patterns
description: "Build production webhooks — signature verification, retry logic, idempotency, event schemas, delivery guarantees, and debugging patterns."
license: MIT
---

Webhooks are the backbone of integrations, but most implementations
are fragile — no verification, no retries, no idempotency. Build
webhooks that survive network failures and malicious callers.

## Webhook receiver with signature verification

```typescript
import crypto from 'crypto';
import express from 'express';

const app = express();

// Raw body for signature verification
app.post('/webhooks/stripe', express.raw({ type: 'application/json' }), (req, res) => {
  const signature = req.headers['stripe-signature'] as string;
  const secret = process.env.STRIPE_WEBHOOK_SECRET!;

  // Verify signature
  const elements = signature.split(',').reduce((acc, part) => {
    const [key, value] = part.split('=');
    acc[key] = value;
    return acc;
  }, {} as Record<string, string>);

  const signedPayload = `${elements['t']}.${req.body}`;
  const expectedSignature = crypto
    .createHmac('sha256', secret)
    .update(signedPayload)
    .digest('hex');

  if (!crypto.timingSafeEqual(
    Buffer.from(elements['v1']),
    Buffer.from(expectedSignature)
  )) {
    return res.status(401).json({ error: 'Invalid signature' });
  }

  // Parse and handle event
  const event = JSON.parse(req.body.toString());

  // Idempotency check
  if (await isEventProcessed(event.id)) {
    return res.status(200).json({ received: true });
  }

  // Process event
  await handleStripeEvent(event);
  await markEventProcessed(event.id);

  res.status(200).json({ received: true });
});
```

## Webhook sender with retries

```typescript
interface WebhookPayload {
  url: string;
  event: string;
  data: Record<string, unknown>;
  secret: string;
}

interface DeliveryAttempt {
  timestamp: Date;
  status: number;
  response: string;
  duration: number;
}

async function deliverWebhook(payload: WebhookPayload): Promise<DeliveryAttempt[]> {
  const maxRetries = 5;
  const backoff = [1000, 5000, 30000, 300000, 3600000]; // 1s to 1h
  const attempts: DeliveryAttempt[] = [];

  for (let attempt = 0; attempt <= maxRetries; attempt++) {
    if (attempt > 0) {
      await sleep(backoff[attempt - 1]);
    }

    const start = Date.now();
    const body = JSON.stringify({
      event: payload.event,
      data: payload.data,
      timestamp: new Date().toISOString(),
      attempt,
    });

    // Generate signature
    const signature = crypto
      .createHmac('sha256', payload.secret)
      .update(body)
      .digest('hex');

    try {
      const response = await fetch(payload.url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Webhook-Signature': `sha256=${signature}`,
          'X-Webhook-Event': payload.event,
          'X-Webhook-Attempt': String(attempt),
          'X-Webhook-Timestamp': Date.now().toString(),
        },
        body,
        signal: AbortSignal.timeout(10000),
      });

      const duration = Date.now() - start;
      const responseText = await response.text();

      attempts.push({
        timestamp: new Date(),
        status: response.status,
        response: responseText,
        duration,
      });

      if (response.ok) {
        return attempts; // Success
      }

      // Don't retry on 4xx (except 429)
      if (response.status >= 400 && response.status < 500 && response.status !== 429) {
        return attempts;
      }
    } catch (error) {
      attempts.push({
        timestamp: new Date(),
        status: 0,
        response: error instanceof Error ? error.message : 'Unknown error',
        duration: Date.now() - start,
      });
    }
  }

  // All retries exhausted
  await alertOpsTeam(payload, attempts);
  return attempts;
}
```

## Idempotency with Redis

```typescript
import Redis from 'ioredis';

const redis = new Redis();

async function isEventProcessed(eventId: string): Promise<boolean> {
  const key = `webhook:processed:${eventId}`;
  const exists = await redis.exists(key);
  return exists === 1;
}

async function markEventProcessed(eventId: string, ttlSeconds = 86400): Promise<void> {
  const key = `webhook:processed:${eventId}`;
  await redis.setex(key, ttlSeconds, '1');
}
```

## Event schema

```typescript
// Standardized webhook event structure
interface WebhookEvent {
  id: string;              // Unique event ID (for idempotency)
  type: string;            // e.g., 'payment.succeeded'
  version: string;         // e.g., '2024-01-01'
  timestamp: string;       // ISO 8601
  data: {
    object: Record<string, unknown>;
    previousAttributes?: Record<string, unknown>;
  };
  metadata?: Record<string, string>;
}

// Event type registry
const EventHandlers: Record<string, (event: WebhookEvent) => Promise<void>> = {
  'payment.succeeded': handlePaymentSucceeded,
  'payment.failed': handlePaymentFailed,
  'subscription.created': handleSubscriptionCreated,
  'subscription.cancelled': handleSubscriptionCancelled,
};
```

## Debugging webhooks

```markdown
## Common issues

1. **Signature mismatch**
   - Check: Is the raw body being used? (not parsed JSON)
   - Check: Is the secret correct?
   - Check: Are timestamps within 5 minutes?

2. **Timeout errors**
   - Check: Is the handler taking > 10 seconds?
   - Fix: Return 200 immediately, process async

3. **Duplicate events**
   - Check: Are you implementing idempotency?
   - Fix: Store processed event IDs with TTL

4. **Events not received**
   - Check: Is the endpoint publicly accessible?
   - Check: Is the webhook configured with the right URL?
   - Check: Are there firewall rules blocking the sender?
```

## Webhook security checklist

```markdown
## Receiver
- [ ] Verify HMAC signature on every request
- [ ] Use timing-safe comparison (crypto.timingSafeEqual)
- [ ] Validate event timestamp (within 5 minutes)
- [ ] Implement idempotency (store processed event IDs)
- [ ] Return 200 quickly, process async
- [ ] Log all incoming webhooks for debugging

## Sender
- [ ] Sign payloads with HMAC-SHA256
- [ ] Implement exponential backoff retries
- [ ] Don't retry on 4xx (except 429)
- [ ] Set reasonable timeouts (10 seconds)
- [ ] Monitor delivery rates and failures
- [ ] Provide a dashboard for webhook management
```

## Anti-patterns

- Don't process webhooks synchronously — return 200 first, process async
- Don't skip signature verification — anyone can forge requests
- Don't use `setTimeout` for retries — use a queue with backoff
- Don't store webhook secrets in code — use environment variables
- Don't ignore failed deliveries — set up alerts for high failure rates
