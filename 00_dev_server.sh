#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

vault server -dev -dev-root-token-id=root
