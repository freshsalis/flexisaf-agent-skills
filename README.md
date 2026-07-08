# FlexiSAF Agent Skills

Independent agent skills for FlexiSAF's AI coding assistants (Claude, Codex, Cursor).

This is a standalone marketplace — **not** a fork of any other skills repository. The canonical source of truth is the top-level `skills/` tree.

## Install

Using the Agent Skills CLI with the GitHub repo source:

```bash
npx skills add freshsalis/flexisaf-agent-skills
```

Other forms:

```bash
npx skills add https://github.com/freshsalis/flexisaf-agent-skills
npx skills add /path/to/flexisaf-agent-skills
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

## Contributing

See [AGENTS.md](./AGENTS.md) for structure and skill-authoring guidelines.
