---
name: dotnet-core
description: Use when building ASP.NET Core applications with dependency injection, middleware, Entity Framework Core, or minimal APIs.
---

# .NET Core

## When to Use This Skill
- Building APIs with minimal APIs or controllers
- Setting up dependency injection for services
- Using Entity Framework Core for data access
- Adding middleware for auth, logging, or error handling
- Implementing health checks and SignalR for real-time

## Workflow
1. Create a project: `dotnet new webapi -n MyApp`
2. Define models and DbContext: `AppDbContext : DbContext`
3. Register services in `Program.cs`: `builder.Services.AddScoped<IMyService, MyService>()`
4. Add middleware: `app.UseAuthentication()`, `app.UseAuthorization()`
5. Define endpoints: minimal APIs with `app.MapGet()` or controller classes
6. Run migrations: `dotnet ef migrations add <Name> && dotnet ef database update`
7. Add health checks: `builder.Services.AddHealthChecks()` and `app.MapHealthChecks("/health")`
8. Test: `dotnet test`

## Rules
- Use dependency injection for all services — never create instances directly
- Keep controllers thin — business logic goes in services
- Use EF Core migrations, not manual SQL scripts
- Add CORS configuration for client-facing APIs
- Use `IHttpClientFactory` for outbound HTTP calls
- Implement health checks for every external dependency
