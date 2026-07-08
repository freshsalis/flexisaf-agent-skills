# FlexiSAF Agent Skills Repository

Independent agent skills for FlexiSAF's AI coding assistants (Claude, Codex, Cursor).

This repository is **not** a fork of any other skills marketplace. It is authored and maintained independently under FlexiSAF's GitHub.

## Canonical Structure

The source of truth is the top-level `skills/` tree.

- `skills/<skill-name>/SKILL.md` — canonical skill entrypoint.
- `skills/<skill-name>/references/` — supporting docs loaded progressively.
- `skills/<skill-name>/resources/` — helper scripts, templates, and static assets.

## Skill Development Guidelines

### Naming

- Use kebab-case for all directories and files.
- Skill names should be descriptive.

### Component Types

- **Skills**: Agent Skills packages with `SKILL.md`.
- **References**: support material loaded only when a workflow phase needs it (progressive disclosure).
- **Resources**: scripts and templates used by a skill.

### Path References

- Inside skills, prefer repository-relative paths such as `references/...` and `resources/...`.
- Avoid hardcoding absolute paths.

### Cross-Platform Compatibility

Skills are authored once under `skills/` and used directly by Claude, Codex, and Cursor.

## Adding a Skill

1. Create `skills/<skill-name>/SKILL.md` with `name` and `description` frontmatter.
2. Add phase detail under `references/` and any helpers under `resources/`.
3. Register the skill in `.claude-plugin/marketplace.json`.
4. Add a row to the table in `README.md`.
