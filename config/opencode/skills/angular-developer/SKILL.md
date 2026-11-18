---
name: angular-developer
description: Use when building Angular applications with components, dependency injection, signals, or the Angular CLI.
---

# Angular Developer

## When to Use This Skill
- Building components with lifecycle hooks and dependency injection
- Using signals for reactive state management
- Creating standalone components without NgModules
- Implementing route guards and resolvers
- Scaffolding and managing projects with Angular CLI

## Workflow
1. Create a project: `ng new my-app --routing --style=scss`
2. Generate a component: `ng generate component <name>`
3. Define the component: template, styles, and TypeScript class
4. Use signals for reactive state: `signal()`, `computed()`, `effect()`
5. Inject services: `constructor(private svc: MyService)` or `inject(MyService)`
6. Set up routing: define routes in `app.routes.ts` with guards
7. Add HTTP calls: use `HttpClient` with typed responses
8. Build and deploy: `ng build --configuration production`

## Rules
- Use standalone components — avoid NgModules for new projects
- Prefer signals over RxJS for simple state — use RxJS for complex streams
- Keep components focused on one view, one responsibility
- Use OnPush change detection for performance
- Lazy-load routes with `loadComponent` for faster initial loads
- Test with Angular Testing utilities, not just DOM queries
