# AGENTS

This file defines suggested specialist roles when using the Vultr API skill in multi-agent workflows.

## Request Validator

Purpose:

- Validate a planned API call against the OpenAPI contract before it is executed.

Responsibilities:

- Run `node ./skills/vultr-api/lint/validate-api-call.js` with the intended method, path, query params, and body.
- Block execution if the linter exits non-zero and report every ERROR line to the user.
- Surface WARN lines as advisory notes.
- Confirm a clean validation result before handing off to the Request Composer for final formatting.

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
2. **Request Validator validates the planned call** (run `validate-api-call.js`; fix errors before continuing).
3. Request Composer assembles request sequence.
4. Failure Analyst validates and hardens error handling.
