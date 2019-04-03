#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

vault kv put secret/signup DB_USERNAME=foo DB_PASSWORD=bar
