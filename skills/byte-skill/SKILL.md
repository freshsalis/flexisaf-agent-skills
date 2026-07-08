---
name: byte-skill
description: Use when building, debugging, or improving the Distinction Bytes ecosystem across the mobile app, backend API, and AI service. Covers PRD-driven feature work, cross-repo contract tracing, end-to-end delivery, integration debugging, and validation across distinction-bytes, saflearn-api, and bytecore.
compatibility: Claude Code, Codex, Cursor, generic AI coding agents
---

# Byte Skill

Use this skill as the main entrypoint for Distinction Bytes engineering work.

This skill is for full-product work across:

- the Distinction Bytes mobile app
- the `saflearn-api` backend
- the `bytecore` AI service
- the product requirements document that defines expected behavior

Treat the PRD as the product source of truth for flows, business rules, UX intent, edge cases, and success criteria. Treat the repositories as the implementation source of truth for what exists today. When they disagree, identify the mismatch explicitly before changing code.

Load only the reference files needed for the current task.

## When To Use

Use this skill when the task involves any of the following:

- translating PRD requirements into implementation work
- building or completing a feature across one or more repos
- debugging mobile, API, or AI integration issues
- fixing build failures, runtime errors, auth problems, or broken contracts
- tracing whether a bug belongs in the mobile app, backend API, or AI service
- improving validation, logging, resilience, maintainability, or tests

Do not use this skill for unrelated work outside the Distinction Bytes stack.

## Workspace Discovery

Start by resolving the local workspace and canonical paths:

```bash
./resources/locate-byte-workspace.sh
```

The script supports overrides through environment variables, so the skill remains portable:

- `BYTE_PRD_PATH`
- `BYTE_WORKSPACE_ROOT`
- `DISTINCTION_BYTES_REPO`
- `SAFLEARN_API_REPO`
- `BYTECORE_REPO`

## Default Workflow

Follow this order unless the user has already narrowed the task:

1. Resolve the PRD and repo paths.
2. Read the PRD first and summarize product goals, core flows, business rules, and likely gaps.
3. Inspect all three repos and map current implementation to the PRD.
4. Determine which repo or repos are actually affected.
5. Trace contracts on both sides before changing request or response shapes.
6. Make the smallest safe cross-repo changes that solve the real problem.
7. Validate behavior, tests, and integration points before closing out.

## Reference Map

Open these only when needed.

### PRD intake and product behavior

The full PRD is bundled with this skill — read [references/prd-distinction-bytes.md](references/prd-distinction-bytes.md) directly (the original PDF is at `resources/distinction-bytes-prd.pdf`). No external download is required.

Open [references/prd-intake.md](references/prd-intake.md) when you need to:

- summarize the PRD
- extract user flows or business rules
- define acceptance criteria
- identify missing implementation or unclear behavior

### Repo map and ownership

Open [references/repo-map.md](references/repo-map.md) when you need:

- the Distinction Bytes workspace layout
- repository responsibilities
- likely stack and starting points for inspection
- guidance for deciding which repo owns a change

### Feature delivery across repos

Open [references/feature-delivery.md](references/feature-delivery.md) when implementing:

- a new feature
- a partially implemented flow
- a contract change between services
- cross-repo fixes that require aligned updates

### Debugging and root cause analysis

Open [references/debugging-and-triage.md](references/debugging-and-triage.md) when handling:

- build errors
- runtime failures
- auth issues
- broken integrations
- crashes, invalid state, bad rendering, or AI-service failures

### Validation and close-out

Open [references/validation-checklist.md](references/validation-checklist.md) when you need:

- a validation plan
- repo-specific test guidance
- regression checks
- a concise final change summary format

## Operating Rules

- Start with the PRD before making product-level assumptions.
- Explore the affected code before editing anything.
- Preserve existing architecture unless there is a clear reason to improve it.
- Reuse existing utilities, components, services, and patterns where possible.
- Do not patch only the symptom if the source is in another repo.
- If the API contract is unclear, inspect both the consumer and provider code first.
- Prefer small, verifiable changes unless a broader refactor is clearly justified.
- State assumptions clearly when the PRD or code leaves a gap.
- Keep mobile, backend, and AI behavior aligned as one product.

## Common Task Shapes

### "Implement feature X from the PRD"

Open:

- `references/prd-intake.md`
- `references/repo-map.md`
- `references/feature-delivery.md`
- `references/validation-checklist.md`

### "This mobile flow is broken"

Open:

- `references/repo-map.md`
- `references/debugging-and-triage.md`
- `references/validation-checklist.md`

Also inspect whether the real cause is API or AI-service behavior before patching the client.

### "The API and app are out of sync"

Open:

- `references/repo-map.md`
- `references/feature-delivery.md`
- `references/debugging-and-triage.md`

### "We need to improve reliability or code quality"

Open:

- `references/repo-map.md`
- `references/feature-delivery.md`
- `references/validation-checklist.md`
