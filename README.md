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

## Contributing

See [AGENTS.md](./AGENTS.md) for structure and skill-authoring guidelines.
