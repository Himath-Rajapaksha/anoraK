---
name: quarkus-java
description: Use when building Quarkus applications with CDI, RESTEasy Reactive, Panache ORM, or native compilation.
---

# Quarkus Java

## When to Use This Skill
- Building REST APIs with RESTEasy Reactive
- Using CDI for dependency injection
- Accessing databases with Panache ORM
- Adding metrics with SmallRye Metrics
- Compiling to native images with GraalVM

## Workflow
1. Create a project: `quarkus create app my-app`
2. Add extensions: `quarkus extension add cdi resteasy-reactive hibernate-orm-panache`
3. Define entities: extend `PanacheEntity` for active record pattern
4. Inject services: `@Inject MyService myService;`
5. Build endpoints: `@Path("/items")` with `@GET`, `@POST` annotations
6. Add metrics: `@Counted`, `@Timed` annotations on methods
7. Test: `./mvnw test` or `./gradlew test`
8. Build native: `./mvnw package -Pnative` for GraalVM native image

## Rules
- Use Panache for simple entities, avoid it for complex query patterns
- Keep CDI beans stateless — use request scope for mutable state
- Use reactive endpoints when I/O-bound, blocking when CPU-bound
- Test with Quarkus dev mode: `./mvnw quarkus:dev`
- Use `%prod.` profile for production-specific configuration
- Verify native builds pass all tests before deploying
