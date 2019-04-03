#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

vault audit enable file file_path=/var/log/vault_audit.log

# or in a container
vault audit enable file file_path=stdout
