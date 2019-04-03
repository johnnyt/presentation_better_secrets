#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

vault policy write signup_app policy_signup_app.hcl

vault policy write ops policy_ops.hcl
