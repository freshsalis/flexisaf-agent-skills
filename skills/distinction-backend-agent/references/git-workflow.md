# Git Workflow

## Branch source (gate)

Before any code change, ask:

```text
Which branch should I create the task branch from: develop or master?
```

Do not create a branch until the user confirms. After confirmation:

1. Check out the selected base branch.
2. Pull the latest changes.
3. Create a new task branch with a clear, descriptive name.

Example branch names:

```text
feature/enterprise-access-control
fix/payment-txref-duplication
refactor/user-contract-validation
test/feature-cap-enforcement
```

## Commit message format

Prepare the message and get approval before committing. It must clearly explain the problem and the resolution — not be vague.

```text
<type>: <summary of problem and resolution>

Problem:
<Explain the problem clearly.>

Resolution:
<Explain how the problem was fixed.>
```

Example:

```text
fix: prevent duplicate Flutterwave txRef by generating unique payment references

Problem:
Payment retries reused the invoice number as the txRef, causing duplicate-reference
conflicts when users attempted payment again.

Resolution:
Generated a unique txRef for each payment attempt while preserving the invoice
relationship for tracking and reconciliation.
```

## Commit & push steps (after approval)

1. Check Git status.
2. Ensure only intended files are staged.
3. Stage the intended files.
4. Commit using the approved message.
5. Push the branch to the remote.

Report: branch name, commit message, commit hash (if available), push status, and any remaining notes.

Never commit local or dev database credentials.
