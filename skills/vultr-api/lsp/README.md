# Vultr OpenAPI LSP Setup (Agent-Agnostic)

This directory defines an LSP profile that is editor- and assistant-agnostic.

You can use it with GitHub Copilot, OpenCode, Hermes, Claude, or any other coding agent, as long as your editor supports a JSON/OpenAPI language server.

## Scope

The profile is intentionally scoped to:

- openapi.json

## What to use

- LSP schema profile: lsp/vultr-openapi.schema.json
- Vultr API linter: lint/lint-vultr-openapi.sh

## How to wire it in any editor

1. Configure your JSON/OpenAPI language server to map openapi.json to lsp/vultr-openapi.schema.json.
2. Keep openapi.json as the contract source of truth.
3. Run lint/lint-vultr-openapi.sh as a pre-commit or CI step.

## Optional VS Code convenience

If you use VS Code, this repository already includes a settings entry in .vscode/settings.json that associates openapi.json with the Vultr schema profile.
