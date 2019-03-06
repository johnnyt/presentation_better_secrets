#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

echo 'path "secret/web_app" { capabilities = [ "read" ] }' | vault policy write app_runner -

vault policy list

vault policy read app_runner
