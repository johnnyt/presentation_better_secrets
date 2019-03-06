#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

vault secrets enable transit

vault write -f transit/keys/ssn
