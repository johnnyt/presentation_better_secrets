#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

vault kv put secret/web_app db_username=foo db_password=bar

vault kv get secret/web_app
