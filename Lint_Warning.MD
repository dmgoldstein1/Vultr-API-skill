# Lint Warning Resolution Log

## Summary

- Total warnings addressed: 39
- Missing operationId warnings: 3
- Missing explicit security warnings: 36
- Outcome: all 39 warning causes fixed in `openapi.json`

## Decision Policy Used

- For missing `operationId`: fixed by correcting typoed field name `operationID` -> `operationId`.
- For missing explicit `security`: fixed by adding explicit operation-level security `[{"API Key": []}]`.
- Rationale for security choice: the spec already has top-level security requiring API key; adding explicit operation-level security preserves existing behavior while satisfying lint style warnings.

## Running Log

### Missing operationId (3)

| # | Endpoint | Choice | Change |
| --- | --- | --- | --- |
| 1 | `GET /registry/{registry-id}/robot/{robot-name}` | Fix | Renamed `operationID` to `operationId`. |
| 2 | `GET /registry/{registry-id}/repository/{repository-image}/artifact/{artifact-digest}` | Fix | Renamed `operationID` to `operationId`. |
| 3 | `DELETE /registry/{registry-id}/repository/{repository-image}/artifact/{artifact-digest}` | Fix | Renamed `operationID` to `operationId`. |

### Missing explicit security (36)

| # | Endpoint | Choice | Change |
| --- | --- | --- | --- |
| 4 | `GET /os` | Fix | Added `security: [{"API Key": []}]`. |
| 5 | `GET /applications` | Fix | Added `security: [{"API Key": []}]`. |
| 6 | `GET /iso-public` | Fix | Added `security: [{"API Key": []}]`. |
| 7 | `GET /object-storage/clusters` | Fix | Added `security: [{"API Key": []}]`. |
| 8 | `GET /object-storage/tiers` | Fix | Added `security: [{"API Key": []}]`. |
| 9 | `GET /object-storage/clusters/{cluster-id}/tiers` | Fix | Added `security: [{"API Key": []}]`. |
| 10 | `PUT /domains/{dns-domain}` | Fix | Added `security: [{"API Key": []}]`. |
| 11 | `GET /regions` | Fix | Added `security: [{"API Key": []}]`. |
| 12 | `GET /regions/{region-id}/availability` | Fix | Added `security: [{"API Key": []}]`. |
| 13 | `GET /plans` | Fix | Added `security: [{"API Key": []}]`. |
| 14 | `GET /plans-metal` | Fix | Added `security: [{"API Key": []}]`. |
| 15 | `GET /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/labels` | Fix | Added `security: [{"API Key": []}]`. |
| 16 | `POST /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/labels` | Fix | Added `security: [{"API Key": []}]`. |
| 17 | `GET /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/labels/{label-id}` | Fix | Added `security: [{"API Key": []}]`. |
| 18 | `DELETE /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/labels/{label-id}` | Fix | Added `security: [{"API Key": []}]`. |
| 19 | `GET /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/taints` | Fix | Added `security: [{"API Key": []}]`. |
| 20 | `POST /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/taints` | Fix | Added `security: [{"API Key": []}]`. |
| 21 | `GET /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/taints/{taint-id}` | Fix | Added `security: [{"API Key": []}]`. |
| 22 | `DELETE /kubernetes/clusters/{vke-id}/node-pools/{nodepool-id}/taints/{taint-id}` | Fix | Added `security: [{"API Key": []}]`. |
| 23 | `GET /kubernetes/versions` | Fix | Added `security: [{"API Key": []}]`. |
| 24 | `GET /registry/{registry-id}/retention/rules` | Fix | Added `security: [{"API Key": []}]`. |
| 25 | `GET /vfs/regions` | Fix | Added `security: [{"API Key": []}]`. |
| 26 | `GET /vfs` | Fix | Added `security: [{"API Key": []}]`. |
| 27 | `POST /vfs` | Fix | Added `security: [{"API Key": []}]`. |
| 28 | `GET /vfs/{vfs_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 29 | `PUT /vfs/{vfs_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 30 | `DELETE /vfs/{vfs_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 31 | `GET /vfs/{vfs_id}/attachments` | Fix | Added `security: [{"API Key": []}]`. |
| 32 | `PUT /vfs/{vfs_id}/attachments/{vps_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 33 | `GET /vfs/{vfs_id}/attachments/{vps_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 34 | `DELETE /vfs/{vfs_id}/attachments/{vps_id}` | Fix | Added `security: [{"API Key": []}]`. |
| 35 | `POST /v2/oidc/provider/{provider_id}/token` | Fix | Added `security: [{"API Key": []}]`. |
| 36 | `GET /v2/oidc/provider/{provider_id}/.well-known/openid-configuration` | Fix | Added `security: [{"API Key": []}]`. |
| 37 | `GET /v2/oidc/issuer/{issuer_id}/jwks` | Fix | Added `security: [{"API Key": []}]`. |
| 38 | `GET /v2/oidc/authorize` | Fix | Added `security: [{"API Key": []}]`. |
| 39 | `GET /v2/oidc/jwks` | Fix | Added `security: [{"API Key": []}]`. |
