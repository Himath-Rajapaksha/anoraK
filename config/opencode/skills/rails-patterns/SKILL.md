---
name: rails-patterns
description: Use when building Rails applications with Active Record, service objects, Sidekiq jobs, Action Cable, or API mode.
---

# Ruby on Rails

## When to Use This Skill
- Designing Active Record models with associations and callbacks
- Extracting business logic into service objects
- Background processing with Sidekiq
- Real-time updates with Action Cable
- Building API-only apps with Rails API mode

## Workflow
1. Generate models: `rails g model User name:string email:string`
2. Define associations: `has_many :posts`, `belongs_to :user`
3. Add callbacks: `before_save :normalize_email` or `after_create :send_welcome`
4. Extract services: `app/services/checkout_service.rb` for complex logic
5. Add background jobs: `rails g job SendEmail` and `SendEmailJob.perform_later(user)`
6. Set up Action Cable: channels for real-time subscriptions
7. Test: `rails test` with fixtures or factories
8. Deploy: `rails db:migrate && rails assets:precompile && rails server`

## Rules
- Keep controllers skinny — delegate to service objects for business logic
- Use scopes for reusable query chains, not class methods
- Avoid callbacks for complex side effects — use service objects instead
- Use `includes` to prevent N+1 queries
- Write model tests for every validation, scope, and callback
- Use Rails credentials, not environment variables, for secrets
