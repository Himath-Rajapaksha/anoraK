---
name: spring-boot
description: Use when building Spring Boot applications with dependency injection, REST controllers, JPA, security, or Actuator.
---

# Spring Boot

## When to Use This Skill
- Building REST APIs with Spring MVC or WebFlux
- Setting up dependency injection with `@Service` and `@Repository`
- Accessing databases with Spring Data JPA
- Configuring security with Spring Security
- Adding health checks and metrics with Actuator

## Workflow
1. Create a project: start.spring.io with Web, JPA, and Security dependencies
2. Define entities: `@Entity` classes with JPA annotations
3. Create repositories: extend `JpaRepository<Entity, Long>`
4. Build controllers: `@RestController` with `@GetMapping`, `@PostMapping`
5. Add services: `@Service` classes for business logic
6. Configure security: `SecurityFilterChain` bean with authorization rules
7. Add Actuator: `management.endpoints.web.exposure.include=health,info,metrics`
8. Test: `./mvnw test`

## Rules
- Use constructor injection, not field injection
- Keep controllers thin — business logic goes in services
- Use `@Transactional` on service methods, not controllers
- Use profile-specific configuration: `application-dev.yml`, `application-prod.yml`
- Test with `@SpringBootTest` for integration tests, `@WebMvcTest` for controller tests
- Never expose Actuator endpoints without authentication
