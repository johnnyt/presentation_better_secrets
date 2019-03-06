#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

TOKEN=$(vault token create -policy=app_runner -ttl=1s -field=token)

curl -s -H "X-Vault-Token: $TOKEN" "$VAULT_ADDR/v1/secret/web_app" | jq '.data'

sleep 1

curl -s -H "X-Vault-Token: $TOKEN" "$VAULT_ADDR/v1/secret/web_app" | jq '.'
