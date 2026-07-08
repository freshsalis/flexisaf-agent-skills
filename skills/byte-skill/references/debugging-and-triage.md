# Debugging And Triage

Use this workflow when Distinction Bytes behavior is broken, inconsistent, or hard to trace.

## Triage Order

1. Define the failing user-visible behavior.
2. Reconstruct the expected behavior from the PRD.
3. Identify the first observable failure point.
4. Determine whether the symptom originates in mobile, API, AI service, or environment.
5. Confirm the real source before editing code.

## Common Failure Classes

### Build and dependency failures

Check:

- package or dependency manifest changes
- lockfile drift
- environment variables and local configuration
- incompatible SDK or runtime versions
- generated files or stale caches if the repo uses them

Prefer minimal dependency changes. Do not upgrade broadly unless the current failure requires it.

### Runtime or navigation failures in the mobile app

Check:

- screen entry params
- route names and navigation registration
- async state transitions
- persisted state or stale cached data
- null or undefined handling
- response parsing before UI render

Trace the data source before assuming the screen is at fault.

### Broken API integrations

Check both sides:

- client request payload
- headers, auth token transport, and base URL selection
- endpoint signature and validation
- serialized response shape
- client-side adapters or selectors

If logs exist, compare the exact payload sent with what the server expects.

### Auth and authorization issues

Trace end to end:

- how the client acquires and stores credentials
- how the client sends them
- how the backend validates them
- role or permission checks
- expiry, refresh, and failure fallback behavior

Do not treat all auth issues as frontend bugs. Many are contract or backend validation problems.

### AI-service issues

Check:

- backend call path into `bytecore`
- prompt or orchestration inputs
- timeout and retry behavior
- malformed or partial model output handling
- response normalization before returning to the app

If the AI output is unstable, add validation or post-processing before widening product behavior.

## Root Cause Discipline

- Fix the first broken boundary, not only the final symptom.
- Confirm whether the bug reproduces with direct API or service invocation when possible.
- Compare working and failing flows to identify the smallest meaningful difference.
- Add diagnostics around ambiguous boundaries before guessing.
- Prefer targeted fixes, then tighten validation so the same issue fails earlier next time.

## Safe Fix Strategy

Use this order:

1. stabilize the broken flow
2. add missing guards, validation, or diagnostics
3. add or improve tests for the exact regression
4. consider a structural improvement only if the local fix would stay brittle
