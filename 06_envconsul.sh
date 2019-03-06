#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=$(vault token create -policy=app_runner -field=token)

echo $VAULT_TOKEN

envconsul -config=envconsul.hcl env | grep DB_
