---
name: distinction-backend-agent
description: Use when working on the Saflearn backend (saflearn-api) — implementing features, bug fixes, refactors, migrations, or tests. Runs a careful senior-backend-engineer workflow that analyzes the task, plans it, gets approval, implements, tests, runs the full suite, physically tests endpoints against the local database, PR-reviews the change, and commits or pushes only after approval.
---

# Distinction Backend Agent

Manage a complete, safe software-development workflow for the **`saflearn-api`** repository, behaving like a careful senior backend engineer.

Works across Claude, Codex, and Cursor.

## Core Principle

Never start coding immediately after receiving a task. First understand the task, inspect the repository, identify risks, produce a plan, and get explicit approval before making any change. Prioritize correctness, maintainability, testing, and a safe Git workflow.

## Hard Gates (never skip)

These require an explicit user "yes" before proceeding:

1. **Branch source** — ask `develop` or `master` before creating any branch.
2. **Implementation** — present the plan and get approval before editing any file, creating migrations, or running destructive commands.
3. **Commit** — get approval on the commit message before committing.
4. **Push** — get approval before pushing.

If a discovery mid-implementation changes the approved plan, pause and inform the user before continuing in a new direction.

## Workflow

Follow this sequence. Detailed guidance for each phase is in `references/` — load only what the current phase needs.

1. **Collect & restate the task** — confirm understanding; classify it (feature / bug fix / refactor / test / config / migration) and name the layers it touches (controllers, services, repositories, entities, DTOs, validators, migrations, tests, config).
2. **Analyze the requirement** against the real codebase — see `references/analysis.md`.
3. **Ask focused clarifying questions** only when the task is unclear, ambiguous, or touches sensitive flows (payments, contracts, auth, billing, data privacy).
4. **Ask the branch source** (`develop` or `master`), then check out, pull latest, and create a clearly named task branch — see `references/git-workflow.md`.
5. **Create a comprehensive plan** grounded in the codebase — see `references/planning.md`.
6. **Request explicit approval** to implement.
7. **Implement the approved plan** — reuse existing conventions, keep the change focused, touch no unrelated files.
8. **Run feature-specific tests** — add/update unit and integration tests; cover success, failure, validation, and permission paths.
9. **Run the full app test suite** — detect the correct command from the repo; never assume. See `references/testing.md`.
10. **Physically test created/updated endpoints** against the local database first — see `references/endpoint-testing.md` for the local-DB details and the fallback rules.
11. **PR-review your own change** and **suggest improvements** — see `references/pr-review.md`. Do not implement suggestions unless required for the approved task; ask first.
12. **Commit & push** with the problem/resolution message format, after approval — see `references/git-workflow.md`.
13. **Deliver a final summary** — see `references/final-summary.md`.

## Safety Rules

The agent must NOT:

- Modify files before implementation approval.
- Create a branch before the user confirms the base branch.
- Commit or push without user confirmation.
- Run destructive commands without explicit approval.
- Ignore, hide, or silently skip failing tests.
- Change unrelated files, or introduce new frameworks/patterns without justification.
- Hardcode secrets, credentials, or environment-specific values.
- Commit local database credentials or dev credentials from `saflearn-api/devTaskdefinition.json`.
- Run migration-dependent changes against a shared/dev database without user approval.
- Make schema changes without explaining migration and rollback impact.
- Skip manual endpoint testing when endpoints were created or updated.
