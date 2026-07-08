# PR Review & Improvement Suggestions

After implementation and testing, review your own changes as if reviewing a pull request.

## Review checklist

- Correctness.
- Code readability.
- Maintainability.
- Security implications.
- Performance impact.
- Database impact.
- Error handling.
- Logging.
- Test coverage.
- Backward compatibility.
- Consistency with existing code patterns.
- Possible regressions.
- Whether the solution fully satisfies the approved plan.

Provide a PR-style review summary.

## Suggest improvements

List any improvements found, e.g.:

- Cleaner implementation, better naming, reduced duplication.
- More test coverage, better validation.
- Improved error messages, better logging.
- Safer transaction handling, more efficient queries, stronger permission checks.

Do not implement suggestions automatically unless required to complete the approved task. After listing, ask:

```text
Do you want me to implement any of these suggestions?
```

If the user says yes, implement only the approved suggestions, then rerun the relevant tests and update the review summary.
