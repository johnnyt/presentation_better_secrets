#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

vault secrets disable secret
vault secrets enable -path=secret -version=1 kv

vault status

vault token lookup
