# Repo Map

The Distinction Bytes workspace lives under:

- `/home/salisu/projects/flexisaf`

Primary repositories:

- mobile app: `/home/salisu/projects/flexisaf/distinction-bytes`
- backend API: `/home/salisu/projects/flexisaf/saflearn-api`
- AI service: `/home/salisu/projects/flexisaf/bytecore`

Use the workspace locator script or environment overrides if these paths differ in another environment.

## Repository Responsibilities

### `distinction-bytes`

Primary responsibility:

- mobile client behavior and user experience

Typical ownership:

- screens and feature flows
- navigation structure
- Redux or other client state handling
- API client integration
- auth/session behavior on device
- loading, error, retry, and offline behavior where implemented
- UI rendering, accessibility, and performance issues

Observed stack signals:

- Expo / React Native
- React 19
- Redux Toolkit
- Axios
- Vitest

First places to inspect:

- `package.json`
- `src/`
- navigation setup
- state or store setup
- API client and service modules
- screen components tied to the failing flow
- tests under `src/__tests__/`

### `saflearn-api`

Primary responsibility:

- backend API behavior, auth, validation, persistence, and response contracts

Typical ownership:

- REST or websocket endpoints
- authentication and authorization
- validation and request parsing
- domain and business rules
- database access and transactional behavior
- integration support for the mobile app
- contract stability and backward compatibility

Observed stack signals:

- Java 21
- Spring Boot
- Spring Security
- JPA / Flyway
- Maven

First places to inspect:

- `pom.xml`
- `src/main/`
- controllers and request DTOs
- services and domain logic
- repositories and entities
- security configuration
- integration or unit tests under `src/test/`

### `bytecore`

Primary responsibility:

- AI-powered product behavior and service orchestration

Typical ownership:

- prompt handling
- inference orchestration
- model or provider integration
- AI service contracts exposed to the app or API
- response shaping and post-processing
- resilience, retries, and AI-specific diagnostics

Observed stack signals:

- Python
- FastAPI
- Strands Agents SDK
- AWS integrations
- pytest

First places to inspect:

- `requirements.txt`
- service entrypoints
- FastAPI routers
- orchestration or tool modules
- prompt templates or prompt-building code
- tests and fixtures

## Ownership Heuristics

Use these rules to decide where the real change belongs:

- If the UI is wrong but the response payload is already correct, start in the mobile repo.
- If the app cannot complete a flow because required data is missing or shaped incorrectly, inspect the API provider next.
- If the backend delegates meaningfully to AI logic, inspect `bytecore` before changing the API contract.
- If auth fails, trace token creation, transport, validation, and role handling across both client and server.
- If a bug crosses repos, fix the source and then align dependents.

## Cross-Repo Contract Checks

Whenever a flow spans repos, inspect all of these before editing:

- client request builder
- client response parsing
- server request DTO or endpoint signature
- server response serializer
- AI-service request and response contract if the API calls it
- shared enums, identifiers, or status values used across boundaries

Never change only one side of a contract without checking every consumer and provider.
