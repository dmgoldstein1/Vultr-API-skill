---
name: vultr-api-guide
description: Teach agents how to use the Vultr API v2 from an OpenAPI contract. Use this skill whenever the user asks to build, debug, or explain Vultr API requests, automation, pagination loops, resource lifecycle workflows, or authentication with Vultr bearer keys, even if they do not mention OpenAPI explicitly.
---

# Vultr API Guide Skill

Use this skill to translate user goals into correct Vultr API calls based on the repository OpenAPI definition at ../../openapi.json.

## When This Skill Should Trigger

Use this skill when the user asks for any of the following:
- Vultr API request examples in curl, Python, JavaScript, or shell.
- Creating, listing, updating, or deleting Vultr resources.
- Understanding request/response fields for Vultr endpoints.
- Handling Vultr pagination, auth, rate limiting, and common errors.
- Building scripts that orchestrate multiple Vultr API endpoints.

## Required Inputs

Before generating requests, confirm:
- The target resource domain (for example instances, VPCs, managed databases, Kubernetes).
- Whether they want read-only inspection or write operations.
- Required identifiers (instance ID, vpc-id, region, plan, etc.).

If required IDs are missing, ask for them or provide a discovery call first.

## Core Workflow

1. Parse intent into concrete operations.
2. Resolve endpoints from ../../openapi.json:
   - Prefer operationId matches.
   - Fall back to path + method + tag matching.
3. Build a request with:
   - Base URL: https://api.vultr.com/v2
   - Header: Authorization: Bearer ${VULTR_API_KEY}
   - Content-Type: application/json for body requests.
4. Validate payload fields against the operation requestBody schema.
5. Include safe execution notes:
   - Mention destructive impact for DELETE/replace operations.
   - Include retries and Retry-After handling for HTTP 429.
6. Present response parsing guidance and next-step calls.

## Output Contract

When providing an actionable answer, use this order:
1. Goal summary (1-2 sentences)
2. Endpoint and method
3. Minimal request example
4. Optional production-ready variant (retry + error handling)
5. Expected response fields

## Vultr-Specific Rules

- Treat auth as mandatory for all API calls.
- Never print or invent actual API keys.
- Use cursor-based pagination patterns when listing resources.
- For long workflows, present read-check-write phases:
  - Read current resource.
  - Check preconditions.
  - Apply mutation.
- Keep operation names aligned with OpenAPI operationId values when possible.

## Domain Map

See ./references/domain-map.txt for high-volume endpoint groups and quick routing.

## Tooling

- Vultr linter: ./lint/lint-vultr-openapi.sh
- Agent-agnostic LSP guide: ./lsp/README.md

## Examples

### Example: Find endpoint before coding
Input: "Create a VPC and attach a NAT gateway"
Output strategy:
- Resolve VPC create/list endpoints.
- Resolve NAT gateway endpoints under /vpcs/{vpc-id}/nat-gateway.
- Return ordered calls with ID extraction between steps.

### Example: Safe delete
Input: "Delete old snapshot by label"
Output strategy:
- List snapshots filtered by label in user script.
- Confirm exact snapshot ID.
- Execute delete endpoint with clear warning about irreversibility.
