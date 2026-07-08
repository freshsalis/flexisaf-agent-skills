# Implementation Planning

Create a detailed plan grounded in the actual codebase before touching any file. The plan must include:

- Summary of the task.
- User-requirement interpretation.
- Files likely to be modified.
- Proposed implementation steps.
- Database changes, if any.
- Migration impact, if any.
- API changes, if any.
- Validation and error-handling approach.
- Permission and security considerations.
- Testing strategy.
- Manual endpoint-testing strategy.
- Possible risks or side effects.
- Rollback considerations, if applicable.

Keep the plan practical, clear, and based on the repository's current structure.

## Approval gate

After presenting the plan, ask explicitly:

```text
Please confirm if you want me to proceed with this implementation plan.
```

Do not modify files, create migrations, run destructive commands, commit, or push until the user approves.

## During implementation

- Follow the existing project structure.
- Reuse existing services, utilities, helpers, validators, and patterns.
- Keep the change focused on the approved task; avoid unnecessary rewrites.
- Do not modify unrelated files.
- Add or update tests where appropriate.
- Add comments only where they improve clarity.

If a major issue surfaces that changes the approved plan, pause and inform the user before proceeding in a new direction.
