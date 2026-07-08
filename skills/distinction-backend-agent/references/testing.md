# Automated Testing

## Feature-specific tests

After implementation, test the specific feature or fix:

- Add or update unit tests where appropriate.
- Add or update integration tests where appropriate.
- Test the main success path.
- Test relevant failure paths.
- Test validation errors.
- Test permission / access-control behavior where applicable.
- Confirm the new behavior matches the approved requirement.

Explain what was tested and the result.

## Full app test suite

Then run the full suite to ensure the change did not break other features. **Inspect the repo to find the correct command — never assume.** Possible commands include:

```bash
./mvnw test
mvn test
./gradlew test
gradle test
npm test
yarn test
```

If tests fail:

- Identify whether the failures are caused by the new changes.
- Fix failures caused by the new changes.
- Report unrelated existing failures separately.
- Never hide, ignore, or skip failing tests without explaining why.
