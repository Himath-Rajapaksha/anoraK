---
name: django-patterns
description: Use when building Django applications with models, views, middleware, ORM optimization, or Django REST Framework.
---

# Django Patterns

## When to Use This Skill
- Designing models with proper relationships and constraints
- Building class-based views or API endpoints with DRF
- Writing custom middleware for cross-cutting concerns
- Optimizing ORM queries to avoid N+1 and slow lookups

## Workflow
1. Define models in `models.py` with explicit field types and constraints
2. Create and run migrations: `python manage.py makemigrations && python manage.py migrate`
3. Build views: function-based for simple cases, class-based for reuse
4. For APIs: create serializers, viewsets, and routers with DRF
5. Add middleware in `settings.py` for auth, logging, or CORS
6. Optimize queries: use `select_related`, `prefetch_related`, and `only()`
7. Test: `python manage.py test` with Django's test client
8. Deploy with Gunicorn and Nginx, or use a platform like Railway

## Rules
- Always use Django's ORM, never raw SQL unless necessary
- Use `select_related` for foreign keys, `prefetch_related` for many-to-many
- Keep views thin — business logic goes in services or models
- Use Django settings for configuration, not hardcoded values
- Write tests for every model method and API endpoint
- Use Django's built-in auth, don't roll your own
