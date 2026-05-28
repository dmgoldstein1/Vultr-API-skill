#!/usr/bin/env bash
# Lints Vultr OpenAPI definitions with Vultr-specific contract checks.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SPEC_PATH="${1:-$SCRIPT_DIR/../../../openapi.json}"

if [[ ! -f "$SPEC_PATH" ]]; then
  echo "Spec file not found: $SPEC_PATH" >&2
  exit 1
fi

echo "[1/2] Running Vultr hard checks..."
server_url=$(jq -r '.servers[0].url // empty' "$SPEC_PATH")
if [[ "$server_url" != "https://api.vultr.com/v2" ]]; then
  echo "ERROR: Expected first server URL to be https://api.vultr.com/v2, got: ${server_url:-<missing>}" >&2
  exit 1
fi

api_key_type=$(jq -r '.components.securitySchemes["API Key"].type // empty' "$SPEC_PATH")
api_key_scheme=$(jq -r '.components.securitySchemes["API Key"].scheme // empty' "$SPEC_PATH")
if [[ "$api_key_type" != "http" || "$api_key_scheme" != "bearer" ]]; then
  echo "ERROR: components.securitySchemes[\"API Key\"] must be type=http and scheme=bearer." >&2
  exit 1
fi

echo "[2/2] Running Vultr quality warnings..."

missing_operation_id_count=$(jq -r '[.paths | to_entries[] | .value | to_entries[] | select(.key | test("^(get|post|put|patch|delete)$")) | select(.value | type == "object") | select((.value.operationId // "") == "")] | length' "$SPEC_PATH")
missing_tag_count=$(jq -r '[.paths | to_entries[] | .value | to_entries[] | select(.key | test("^(get|post|put|patch|delete)$")) | select(.value | type == "object") | select((.value.tags | type) != "array" or (.value.tags | length) == 0)] | length' "$SPEC_PATH")
missing_security_count=$(jq -r '[.paths | to_entries[] | .value | to_entries[] | select(.key | test("^(get|post|put|patch|delete)$")) | select(.value | type == "object") | select((.value.security | type) != "array" or (.value.security | length) == 0)] | length' "$SPEC_PATH")

if [[ "$missing_operation_id_count" -gt 0 ]]; then
  echo "WARN: Operations missing operationId: $missing_operation_id_count"
fi

if [[ "$missing_tag_count" -gt 0 ]]; then
  echo "WARN: Operations missing tags: $missing_tag_count"
fi

if [[ "$missing_security_count" -gt 0 ]]; then
  echo "WARN: Operations missing explicit security: $missing_security_count"
fi

echo "Vultr OpenAPI lint passed (hard checks) with advisory warnings where applicable."
