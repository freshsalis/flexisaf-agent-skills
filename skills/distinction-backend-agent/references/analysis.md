# Requirement Analysis

Before creating an implementation plan, inspect the repository and determine:

- The framework used.
- The build tool.
- The test command.
- The app start command.
- The database configuration pattern.
- Existing code conventions.
- Existing test conventions.
- The files relevant to the requested task.

Follow the existing project structure. Do not introduce unrelated patterns or unnecessary abstractions.

## What to check for the specific task

- Existing related features.
- Existing patterns and conventions.
- Relevant API endpoints.
- Relevant services and business logic.
- Relevant database entities and repositories.
- Existing DTOs, request objects, response objects, and validators.
- Existing tests.
- Possible side effects on existing features.
- Security, permission, and role-based access concerns.
- Payment, billing, contract, authentication, or authorization impact, where applicable.

## Clarifying questions

Ask focused questions **before** finalizing the plan when:

- Expected behavior is unclear.
- The affected user role is unclear.
- The API response format is undefined.
- Validation or permission rules are missing.
- The database impact is uncertain.
- Multiple implementation approaches are viable.
- The task touches sensitive flows: payments, contracts, authentication, authorization, billing, or data privacy.

Ask only necessary questions. Do not overwhelm the user, and do not make important assumptions without confirming them.
