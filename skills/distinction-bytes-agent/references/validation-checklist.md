# Validation Checklist

Every Distinction Bytes change should be validated against both the PRD and the affected repos.

## Minimum Validation Standard

For every change:

1. confirm the intended behavior from the PRD or explicitly state the gap
2. run the most relevant tests available in each changed repo
3. verify the touched integration boundary
4. check for obvious regressions in adjacent flows
5. summarize what changed, why it changed, and how it was validated

## Repo-Specific Validation

### `distinction-bytes`

Look for the smallest meaningful validation first:

- targeted unit or integration tests
- existing Vitest suites
- screen or state tests for the affected flow
- manual verification of loading, success, and error states when runtime validation is needed

Common commands to consider:

- `npm test -- --runInBand` if the repo supports it
- `npm run test`
- `npm run test:unit`
- `npm run test:integration`

Also verify environment-sensitive flows if the app uses different Expo environments.

### `saflearn-api`

Prefer:

- targeted Maven tests
- endpoint or service-level tests
- validation of request and response shapes
- auth and permission checks if the flow is protected

Common commands to consider:

- `mvn test`
- narrower test selectors if the suite is large

If you change a contract, validate serialization and request parsing explicitly.

### `bytecore`

Prefer:

- targeted pytest coverage
- request and response normalization checks
- prompt or orchestration tests where available
- verification of timeouts, retries, or malformed output handling if relevant

Common commands to consider:

- `pytest`
- targeted `pytest path/to/test_file.py`

## Integration Validation

When more than one repo changes, verify the boundary itself, not just individual tests:

- request payload matches provider expectations
- response payload matches consumer expectations
- auth or session data is carried correctly
- AI-service outputs are normalized before reaching the app
- user-visible success and failure states match the PRD

## Regression Questions

Before closing a task, check:

- Did this change break adjacent screens or flows?
- Did a contract change affect any other consumer?
- Did new validation reject previously valid input?
- Did error handling change what the user sees?
- Did any logging or retry behavior become noisier or less safe?

## Recommended Close-Out Format

When reporting back, include:

- what changed
- which repo or repos changed
- why the change was necessary
- how behavior now matches the PRD or clarified assumption
- what validation was run
- any residual risk or follow-up item
