#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

# Use v1 secret engine for this demo
vault secrets disable secret
vault secrets enable -path=secret -version=1 kv

vault status

vault token lookup
