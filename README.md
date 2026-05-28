# Vultr API Skill Repository

This repository packages an agent-agnostic Vultr API skill based on the OpenAPI contract in openapi.json.

## Canonical skill docs

- Skill overview: skills/vultr-api/README.md
- Skill behavior and triggering: skills/vultr-api/SKILL.md
- Skill role definitions: skills/vultr-api/AGENTS.md

## Tooling

- Vultr linter: skills/vultr-api/lint/lint-vultr-openapi.sh
- LSP profile docs: skills/vultr-api/lsp/README.md
- LSP schema profile: skills/vultr-api/lsp/vultr-openapi.schema.json

## Quick start

1. Validate the contract:
   - ./skills/vultr-api/lint/lint-vultr-openapi.sh openapi.json
2. Read the package documentation:
   - skills/vultr-api/README.md
