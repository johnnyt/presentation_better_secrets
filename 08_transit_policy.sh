#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

vault policy write app_runner policy_app_transit.hcl
vault policy write backend_service policy_backend_transit.hcl

vault kv put secret/backend super_secret=foo

vault policy list

vault policy read app_runner
vault policy read backend_service
