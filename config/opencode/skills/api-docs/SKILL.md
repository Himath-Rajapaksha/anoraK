---
name: api-docs
description: Use when generating or maintaining API documentation with OpenAPI/Swagger, interactive examples, or auto-generated reference docs.
---

# API Documentation

## When to Use This Skill
- Writing OpenAPI/Swagger specifications for REST APIs
- Generating interactive API documentation (Swagger UI, Redoc)
- Creating SDKs or code samples from API specs
- Validating API docs against actual endpoint behavior

## Workflow
1. Define the API spec in OpenAPI 3.0+ format: paths, methods, schemas, and responses
2. Document every endpoint: method, path, parameters, request body, and responses
3. Add request/response examples for each endpoint
4. Set up authentication definitions: API key, OAuth2, or Bearer token
5. Generate docs: Redoc, Swagger UI, or Stoplight Elements
6. Validate the spec: `npx @redocly/cli lint openapi.yaml`
7. Add code samples in multiple languages using `x-code-samples`
8. Publish and version alongside the API code

## Rules
- Keep the spec in sync with the code — drift causes confusion
- Use $ref for reusable schemas to avoid duplication
- Document error responses, not just success cases
- Include rate limit headers in the documentation
- Test examples against the live API before publishing
- Version the docs when the API has breaking changes
