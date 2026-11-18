---
name: ticket-execution
description: Use when executing development tickets — understanding requirements, implementing the plan, writing tests, and updating documentation.
---

# Ticket Execution

## When to Use This Skill
- Starting work on a new development ticket
- Understanding requirements and acceptance criteria
- Implementing the solution following the plan
- Writing tests and updating documentation

## Workflow
1. Read the ticket thoroughly: understand the requirement and acceptance criteria
2. Ask clarifying questions if anything is ambiguous
3. Break the work into sub-tasks if it's complex
4. Implement the solution: write code that meets the acceptance criteria
5. Write tests: unit tests for logic, integration tests for endpoints
6. Update documentation: README, API docs, or inline comments as needed
7. Self-review: check the diff for issues before opening a PR
8. Transition the ticket: move to review or done as appropriate

## Rules
- Understand the "why" before implementing the "what"
- Write tests before or alongside implementation, not after
- Keep commits focused — one logical change per commit
- Update documentation when the change affects user-facing behavior
- Self-review your diff before requesting a review
- Ask for help if blocked for more than 30 minutes
