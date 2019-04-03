#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

SSN="123-45-6789"
BASE64=$(base64 <<< $SSN)

APP_TOKEN=$(vault token create -policy=app_runner -field=token)
CIPHERTEXT=$(curl -s -H "X-Vault-Token: $APP_TOKEN" -X POST --data "{\"plaintext\":\"$BASE64\"}" "$VAULT_ADDR/v1/transit/encrypt/ssn" | jq -r '.data.ciphertext')

curl -s -H "X-Vault-Token: $APP_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq

BACKEND_TOKEN=$(vault token create -policy=backend_service -field=token)
DECRYPTED_BASE64=$(curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq -r '.data.plaintext')

base64 --decode <<< $DECRYPTED_BASE64
