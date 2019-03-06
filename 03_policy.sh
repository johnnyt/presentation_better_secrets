#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

vault policy write app_runner policy_basic.hcl

vault policy list

vault policy read app_runner
