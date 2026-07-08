# FlexiSAF Agent Skills

Independent agent skills for FlexiSAF's AI coding assistants (Claude Code, Codex, Cursor, OpenClaw, and 70+ more).

The canonical source of truth is the top-level `skills/` tree.

## Install

Using the Agent Skills CLI with the GitHub repo source:

```bash
# Install all skills into the current project (detects your agent automatically)
npx skills add freshsalis/flexisaf-agent-skills
```

Other useful forms:

```bash
# Install globally (available in every project for your user)
npx skills add freshsalis/flexisaf-agent-skills --global

# Install one specific skill only
npx skills add freshsalis/flexisaf-agent-skills --skill distinction-bytes-agent

# Install to specific agents (comma-separated); use '*' for all agents
npx skills add freshsalis/flexisaf-agent-skills --agent claude-code
npx skills add freshsalis/flexisaf-agent-skills --agent codex,cursor,openclaw

# From a full URL or a local checkout
npx skills add https://github.com/freshsalis/flexisaf-agent-skills
npx skills add /path/to/flexisaf-agent-skills

# List the skills in the repo without installing
npx skills add freshsalis/flexisaf-agent-skills --list
```

Valid agent ids include `claude-code`, `codex`, `cursor`, `openclaw`, `gemini-cli`,
`github-copilot`, `windsurf`, `zed`, `warp`, and many more (run any install with
`--agent __x__` to print the full list).

## Using the Skills in Each Agent

After installing, every skill **auto-activates** when your request matches its
`description` — so in any agent you can just describe the task (e.g. *"implement the
streaks feature from the Distinction Bytes PRD"*) and the right skill kicks in.

You can also trigger a skill explicitly. The trigger character differs per agent:

| Agent           | Install with            | Invoke explicitly                                   |
| --------------- | ----------------------- | --------------------------------------------------- |
| **Claude Code** | `--agent claude-code`   | `/distinction-bytes-agent`                          |
| **Codex**       | `--agent codex`         | `$distinction-bytes-agent`                          |
| **Cursor**      | `--agent cursor`        | `@distinction-bytes-agent` (or just describe the task) |
| **OpenClaw**    | `--agent openclaw`      | `/distinction-bytes-agent`                          |

Examples (either skill works the same way — swap the name):

```text
# Claude Code
/distinction-backend-agent add a rate limit to the AI endpoints

# Codex
$distinction-bytes-agent trace why the mobile course sync returns 401

# Cursor
@distinction-backend-agent review this PR branch before I push

# OpenClaw
/distinction-bytes-agent generate a byte path for "Newton's Laws"
```

Prefer not to install? Generate a one-off prompt for a single skill and pipe it to
your agent:

```bash
npx skills use freshsalis/flexisaf-agent-skills@distinction-bytes-agent | claude
```

## Canonical Structure

```text
skills/<skill-name>/
  SKILL.md      # canonical entrypoint (name + description frontmatter)
  references/   # progressive-disclosure support material
  resources/    # helper scripts, templates, static assets
```

## Available Skills

| Skill                                                              | Description                                                                                                                                                            |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [distinction-backend-agent](./skills/distinction-backend-agent)    | Careful senior-backend-engineer workflow for `saflearn-api`: analyze, plan, approve, implement, test, physically test endpoints, PR-review, and commit/push on approval. |
| [distinction-bytes-agent](./skills/distinction-bytes-agent)        | Full-product engineering across the Distinction Bytes ecosystem — `distinction-bytes` (mobile), `saflearn-api` (backend), and `bytecore` (AI). PRD-driven features, cross-repo contract tracing, integration debugging, and validation. |

## How `distinction-backend-agent` Delivers

It behaves like a careful senior backend engineer and never starts coding
immediately. It moves through these steps, stopping at each **approval gate** for
your explicit "yes":

1. **Restate the task** and classify it (feature, bug fix, refactor, test, config, migration).
2. **Inspect `saflearn-api`** to learn the framework, build tool, test/run commands, DB pattern, and conventions.
3. **Ask clarifying questions** when the requirement is unclear or touches sensitive flows (payments, auth, billing, data privacy).
4. **Ask the branch source** (gate) — `develop` or `master` — then check out, pull latest, and create a task branch.
5. **Present a comprehensive plan** grounded in the real codebase (files, DB/migration impact, API changes, risks, rollback).
6. **Get approval to implement** (gate) — no files change before this.
7. **Implement** the approved plan, reusing existing patterns and touching no unrelated files.
8. **Run feature-specific tests** (success, failure, validation, and permission paths).
9. **Run the full app test suite**, using the repo's real test command; fixes regressions it caused.
10. **Physically test the endpoints** against the local `saflearn` database (with documented migration-aware fallback rules).
11. **PR-review its own change** and **suggest improvements** — implements them only if you approve.
12. **Commit and push** (gates) — with a problem/resolution commit message, only after your approval.
13. **Deliver a final summary** (what changed, tests, endpoints, DB used, branch, commit, push status, follow-ups).

The agent will not modify files before approval, create a branch before you pick the
base, commit or push without confirmation, ignore failing tests, or commit
credentials. Full detail lives in
[skills/distinction-backend-agent/SKILL.md](./skills/distinction-backend-agent/SKILL.md)
and its `references/`.

## Contributing

See [AGENTS.md](./AGENTS.md) for structure and skill-authoring guidelines.
