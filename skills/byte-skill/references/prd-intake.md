# PRD Intake

Use the product requirements document as the main behavioral reference for Distinction Bytes:

- `/home/salisu/Downloads/Distinction Bytes (Mobile App).pdf`

If that path is not valid in the current environment, resolve the PRD path through `BYTE_PRD_PATH` or the workspace locator script before proceeding.

## Goals

When you open the PRD, extract the following first:

- product goals and primary user outcomes
- supported user roles if the PRD defines them
- core flows from entry to success state
- required screens or feature areas
- business rules and validation constraints
- backend or AI integrations implied by the flow
- failure cases, fallback behavior, and retry expectations
- acceptance criteria or success signals

## Required First Pass

Before making implementation plans, produce a concise internal summary of:

1. app purpose
2. key user journeys
3. major product surfaces
4. integrations required to support those surfaces
5. obvious implementation gaps or ambiguities

Do not jump into code changes until this pass is complete unless the task is narrowly scoped and already mapped.

## Turning The PRD Into Engineering Work

Translate each relevant PRD requirement into concrete work items across:

- mobile UI and navigation
- state management and local persistence
- backend endpoints and authorization
- request and response contracts
- AI-service prompts, orchestration, or inference logic
- validation and error handling
- tests and instrumentation if present in the codebase

For each feature or bug, ask:

- What user-visible behavior is required?
- Which repo owns the first failing step?
- What contract crosses repo boundaries?
- What success and error states must be represented?
- What existing code already partially implements this?

## Handling Gaps And Conflicts

If the PRD is incomplete, infer cautiously from:

- adjacent flows in the PRD
- existing implementation patterns
- contract shapes already used in the product

When the PRD conflicts with the code:

1. document the mismatch clearly
2. identify whether the code looks stale, partial, or intentionally divergent
3. propose the most likely intended behavior
4. implement only after that reasoning is explicit

## Useful Output Shape

When a task starts from the PRD, structure the working summary as:

- feature or flow being analyzed
- PRD expectation
- current implementation status
- gaps or inconsistencies
- affected repo or repos
- proposed safe next step
