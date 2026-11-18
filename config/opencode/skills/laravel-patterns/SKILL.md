---
name: laravel-patterns
description: Use when building Laravel applications with Eloquent ORM, routes, middleware, queues, or Livewire for reactive UIs.
---

# Laravel Patterns

## When to Use This Skill
- Designing Eloquent models with relationships and scopes
- Organizing routes and controllers
- Writing middleware for request filtering
- Scheduling tasks and queueing jobs
- Building reactive UIs with Livewire

## Workflow
1. Define models: `php artisan make:model Post -m` creates model and migration
2. Define relationships: `hasMany`, `belongsTo`, `belongsToMany` in the model
3. Write scopes: `scopePublished($query)` for reusable query constraints
4. Organize routes: resource routes for CRUD, route groups for middleware
5. Add middleware: `php artisan make:middleware CheckAge` and register in `Kernel.php`
6. Schedule tasks: define in `Kernel.php` with `schedule` method
7. Queue jobs: `php artisan make:job SendEmail` and dispatch with `dispatch(new SendEmail())`
8. For Livewire: `php artisan make:livewire Counter` and build interactive components

## Rules
- Use Eloquent relationships, not raw queries or manual joins
- Keep controllers thin — business logic goes in services or actions
- Use form requests for validation, not inline rules
- Use scopes for reusable query constraints
- Queue anything that takes more than a few seconds
- Test with `RefreshDatabase` trait for clean test state
