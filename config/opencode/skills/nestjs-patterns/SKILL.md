---
name: nestjs-patterns
description: Use when building NestJS applications with modules, guards, pipes, exception filters, or microservice transport layers.
---

# NestJS Patterns

## When to Use This Skill
- Organizing code into modules and providers
- Implementing guards for authentication and authorization
- Using pipes for request validation and transformation
- Adding exception filters for error handling
- Connecting to microservices with transport layers

## Workflow
1. Create a module: `nest g module <name>`
2. Create a service: `nest g service <name>`
3. Create a controller: `nest g controller <name>`
4. Add a guard: `nest g guard <name>` — implement `CanActivate`
5. Add a pipe: `nest g pipe <name>` — implement `PipeTransform`
6. Add an exception filter: `nest g filter <name>` — implement `ExceptionFilter`
7. Connect microservice: `app.connectMicroservice<MqttOptions>({ transport: Transport.MQTT })`
8. Build and run: `npm run build && npm run start:prod`

## Rules
- Keep modules focused on one domain or feature
- Use dependency injection for all services — never create instances manually
- Use `ValidationPipe` with `whitelist: true` to strip unknown properties
- Implement guards for auth, not in controllers
- Use exception filters for consistent error responses
- Test with the NestJS testing module for unit and integration tests
