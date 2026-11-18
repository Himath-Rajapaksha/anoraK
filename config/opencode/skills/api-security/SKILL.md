---
name: api-security
description: "Secure APIs against common attacks — authentication patterns, rate limiting, input validation, CORS, OAuth 2.0, JWT best practices, and API gateway patterns."
license: MIT
---

Most API breaches don't come from zero-days — they come from missing
rate limits, weak authentication, and trusting client input. Defense
in depth means every layer assumes the layer below has failed.

## Authentication patterns

```typescript
// JWT with proper claims and validation
import jwt from 'jsonwebtoken';

interface TokenPayload {
  sub: string;
  role: 'user' | 'admin' | 'service';
  iat: number;
  exp: number;
  iss: string;
  aud: string;
}

function generateToken(userId: string, role: string): string {
  return jwt.sign(
    { sub: userId, role },
    process.env.JWT_SECRET!,
    {
      expiresIn: '15m',     // Short-lived access tokens
      issuer: 'your-app',
      audience: 'your-api',
      algorithm: 'RS256',   // Asymmetric, not HS256
    }
  );
}

function verifyToken(token: string): TokenPayload {
  return jwt.verify(token, process.env.JWT_PUBLIC_KEY!, {
    issuer: 'your-app',
    audience: 'your-api',
    algorithms: ['RS256'],
  }) as TokenPayload;
}
```

## Rate limiting

```typescript
import rateLimit from 'express-rate-limit';
import RedisStore from 'rate-limit-redis';

// Global rate limit
const globalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100,                  // 100 requests per window
  standardHeaders: true,
  legacyHeaders: false,
  store: new RedisStore({ client: redisClient }),
});

// Stricter limit for auth endpoints
const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,                    // 5 attempts per 15 minutes
  skipSuccessfulRequests: true,
});

// Per-user limit for API endpoints
const userLimiter = rateLimit({
  windowMs: 60 * 1000,      // 1 minute
  max: 30,                   // 30 requests per minute
  keyGenerator: (req) => req.user?.id || req.ip,
});
```

## Input validation

```typescript
import { z } from 'zod';

// Validate everything at the boundary
const CreateUserSchema = z.object({
  email: z.string().email().max(255).toLowerCase(),
  name: z.string().min(1).max(100).trim(),
  password: z.string()
    .min(8)
    .max(128)
    .regex(/[A-Z]/, 'Must contain uppercase')
    .regex(/[a-z]/, 'Must contain lowercase')
    .regex(/[0-9]/, 'Must contain number'),
  role: z.enum(['user', 'admin']).default('user'),
});

// Never trust query params
const GetUsersSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  limit: z.coerce.number().int().min(1).max(100).default(20),
  sort: z.enum(['name', 'email', 'created_at']).default('created_at'),
});
```

## CORS configuration

```typescript
// Strict CORS — never use wildcard in production
const corsOptions = {
  origin: (origin, callback) => {
    const allowed = ['https://yourapp.com', 'https://admin.yourapp.com'];
    if (!origin || allowed.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Request-ID'],
  maxAge: 86400, // 24 hours preflight cache
};
```

## Security headers

```typescript
// Helmet.js configuration
import helmet from 'helmet';

app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", 'data:', 'https:'],
      connectSrc: ["'self'", 'https://api.yourapp.com'],
    },
  },
  hsts: { maxAge: 31536000, includeSubDomains: true, preload: true },
  referrerPolicy: { policy: 'strict-origin-when-cross-origin' },
}));
```

## API security checklist

```markdown
## Authentication
- [ ] Use RS256 for JWT (not HS256)
- [ ] Short-lived access tokens (15 min)
- [ ] Refresh token rotation
- [ ] Secure token storage (httpOnly cookies, not localStorage)

## Authorization
- [ ] Check permissions on every request
- [ ] Use principle of least privilege
- [ ] Validate ownership of resources

## Input
- [ ] Validate all input at the boundary
- [ ] Use parameterized queries (never string concatenation)
- [ ] Limit request body size
- [ ] Reject unexpected fields

## Rate limiting
- [ ] Global rate limit
- [ ] Stricter limit on auth endpoints
- [ ] Per-user limits for authenticated routes

## Headers
- [ ] HTTPS only (HSTS)
- [ ] Content Security Policy
- [ ] X-Content-Type-Options: nosniff
- [ ] X-Frame-Options: DENY
```

## Anti-patterns

- Don't store JWTs in localStorage — use httpOnly cookies
- Don't use `HS256` with a shared secret — use `RS256` with key pairs
- Don't return full error messages in production — log them server-side
- Don't skip CORS — every origin must be explicitly allowed
- Don't use API keys as sole authentication — they're for identification, not auth
