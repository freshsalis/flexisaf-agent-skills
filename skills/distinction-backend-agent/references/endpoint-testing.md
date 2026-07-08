# Physical Endpoint Testing

After automated tests pass, physically test any endpoint that was created or updated. Do not rely on unit/integration tests alone when an endpoint changed.

## Local database (first target)

```text
Database: saflearn
User:     salisu
Password: 1234
```

Use this local database only for development and testing. Steps:

1. Start the application locally using the correct project command.
2. Ensure the app connects to the local `saflearn` database.
3. Test every created/updated endpoint.
4. Test the success path.
5. Test relevant failure paths.
6. Test validation errors where applicable.
7. Test permission / authorization behavior where applicable.
8. Confirm database state before and after calls when needed.
9. Record request payloads, responses, and observed results.
10. State whether the physical endpoint tests passed or failed.

Do not commit local database credentials or environment-specific configuration changes unless the user explicitly approves.

## Fallback rule when the local `saflearn` DB is unreachable

### Case 1 — feature includes a migration

Stop and ask the user for credentials. Do **not** fall back to the dev database automatically, because migration-dependent changes against a shared/dev database are risky.

```text
The app cannot connect to the local saflearn database, and this feature includes a
database migration. Please provide the database credentials you want me to use for
final endpoint testing.
```

### Case 2 — feature includes no migration

Fall back to the dev database configuration in `saflearn-api/devTaskdefinition.json`:

1. Inspect `devTaskdefinition.json`.
2. Extract the relevant dev database configuration.
3. Start the app using the dev database configuration.
4. Physically test the created/updated endpoints.
5. Record payloads, responses, and results.
6. Clearly state that the dev database was used because the local connection failed.

Never modify or commit credentials from `devTaskdefinition.json`.

## Manual endpoint testing report

At the end of physical testing, report:

- Which database was used: local `saflearn`, user-provided credentials, or dev DB from `devTaskdefinition.json`.
- Whether the feature included a migration.
- Which endpoints were tested.
- Success-path result.
- Failure-path result.
- Validation / permission checks tested.
- Any database records created, updated, or verified.
- Any issue found during manual endpoint testing.
