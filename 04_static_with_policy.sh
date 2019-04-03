#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

TOKEN=$(vault token create -policy=app_runner -field=token)

curl -s -H "X-Vault-Token: $TOKEN" "$VAULT_ADDR/v1/secret/web_app" | jq '.data'
