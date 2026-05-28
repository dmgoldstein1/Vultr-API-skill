# Vultr API Skill

This skill package teaches an agent how to use the Vultr API v2 from the local OpenAPI contract at ../../openapi.json.

It is assistant-agnostic and can be used with GitHub Copilot, OpenCode, Hermes, Claude, and other coding agents.

## What is included

- SKILL.md: Triggering and execution guidance for Vultr API tasks.
- AGENTS.md: Suggested specialized agent roles for API planning and debugging.
- references/domain-map.txt: Fast route map of major Vultr API domains.
- lint/validate-api-call.js: **Pre-flight API call linter** — validates a planned request (method, path, params, body) against the OpenAPI contract before execution. No extra npm dependencies required.
- lint/lint-vultr-openapi.sh: Runner script for linting openapi.json.
- lsp/README.md: Agent-agnostic language-server setup for OpenAPI authoring.
- lsp/vultr-openapi.schema.json: Vultr-specific JSON schema profile for LSP clients.

## Quick start

1. Validate a planned API call (pre-flight check):
   - `node ./skills/vultr-api/lint/validate-api-call.js --method GET --path /instances`
   - `node ./skills/vultr-api/lint/validate-api-call.js --method POST --path /instances --body '{"region":"ewr","plan":"vc2-1c-1gb","os_id":387}'`
2. Run the OpenAPI spec linter:
   - `./lint-vultr-openapi.sh ../../openapi.json`
3. Configure your editor or LSP client using lsp/README.md.

## Covered Vultr behaviors

- Bearer auth via Authorization header.
- Cursor-based pagination for list endpoints.
- Rate-limit handling for HTTP 429 with Retry-After.
- Endpoint discovery using operationId, tags, and path patterns.

## Notes

- The OpenAPI source of truth is ../../openapi.json.
- Keep operation references aligned with operationId values where possible.
