# AGENTS

This file defines suggested specialist roles when using the Vultr API skill in multi-agent workflows.

## Endpoint Scout

Purpose:

- Locate the exact Vultr endpoint(s), method, and operationId that satisfy a user request.

Responsibilities:

- Map natural language intent to OpenAPI paths.
- Identify required path/query/body parameters.
- Return minimal endpoint shortlist with tradeoffs.

## Request Composer

Purpose:

- Build valid request payloads and runnable examples.

Responsibilities:

- Generate curl and one SDK-style example when requested.
- Ensure Authorization and Content-Type headers are correct.
- Include pagination and retry patterns for production use.

## Failure Analyst

Purpose:

- Diagnose failed Vultr API interactions.

Responsibilities:

- Classify 4xx vs 5xx failures and likely root causes.
- Propose specific request fixes using schema constraints.
- Suggest safe retry behavior for 429 and transient 5xx errors.

## Workflow

1. Endpoint Scout resolves operation(s).
2. Request Composer assembles request sequence.
3. Failure Analyst validates and hardens error handling.
