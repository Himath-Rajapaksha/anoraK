---
name: sandbox-sdk
description: Use when executing untrusted code safely in isolated environments with the Sandbox SDK.
---

# Sandbox SDK

## When to Use This Skill
- Running user-submitted code (e.g., code editors, coding challenges)
- Building browser-based IDEs or playgrounds
- Isolating file system access for multi-tenant applications
- Integrating sandboxed execution with Cloudflare Workers

## Workflow
1. Install the Sandbox SDK
2. Create a sandbox instance with memory and CPU limits
3. Mount a virtual file system with read/write access
4. Execute code inside the sandbox: `sandbox.run(code)`
5. Capture stdout, stderr, and exit codes
6. Implement network restrictions based on trust level
7. Clean up sandbox instances after execution completes
8. Handle timeouts and resource exhaustion gracefully

## Rules
- Always enforce memory and CPU limits before execution starts
- Never trust user-provided code — sandbox everything
- Implement execution timeouts to prevent infinite loops
- Log execution metadata (user, duration, resource usage) for auditing
- Clean up sandbox instances immediately after use
- Test with adversarial code samples before deploying
