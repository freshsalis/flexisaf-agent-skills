# Feature Delivery

Use this workflow for any feature, enhancement, or partially implemented flow.

## Delivery Sequence

1. Read the relevant PRD section and summarize expected behavior.
2. Identify every repo touched by the flow.
3. Inspect current implementation in each repo before proposing edits.
4. Map the end-to-end path:
   client action -> mobile state -> API request -> backend logic -> AI call if any -> response -> client rendering
5. Identify what is already implemented, partially implemented, missing, or inconsistent.
6. Apply the smallest coherent set of changes that makes the flow work end to end.
7. Validate each changed boundary and then validate the complete user flow.

## Implementation Rules

- Prefer existing components, hooks, services, DTOs, and helpers over new abstractions.
- Keep naming and structure aligned with each repository's current style.
- Avoid duplicate logic between screen code, services, and backend handlers.
- Preserve working behavior outside the targeted change.
- If a refactor is needed, keep it tightly coupled to the user-visible problem being solved.

## Cross-Repo Planning Template

For non-trivial work, think in this order:

- UI or screen behavior required
- state transitions and local caching or persistence
- API request contract
- backend validation and authorization
- business logic or database changes
- AI service input and output behavior
- response parsing and rendering on the client
- tests needed at each touched layer

## Contract Alignment

When a request or response shape changes:

1. update the provider
2. update every consumer
3. update validation and parsing
4. update fixtures, mocks, and tests
5. check older paths for compatibility if the product still depends on them

If the change is risky, prefer additive contract changes before breaking ones.

## Quality Upgrades Worth Making

While implementing a feature, improve nearby code only when it provides clear value:

- missing guard clauses
- weak validation
- brittle null handling
- poor loading or error states
- missing diagnostics around known failure points
- tests for the exact flow being changed

Do not widen scope into speculative cleanup unrelated to the active flow.
