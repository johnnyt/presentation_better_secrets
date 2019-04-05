#!/usr/bin/env bash -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root

TTL=5s
MAX_TTL=10s

SSN="123-45-6789"
BASE64=$(base64 <<< $SSN)

CIPHERTEXT=$(vault write transit/encrypt/ssn -format=json plaintext=$BASE64 | jq -r '.data.ciphertext')

BACKEND_TOKEN=$(vault token create -policy=backend_service -ttl=$TTL -explicit-max-ttl=$MAX_TTL -field=token)


curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq

sleep 4
vault token renew $BACKEND_TOKEN
curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq

sleep 4
vault token renew $BACKEND_TOKEN
curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq

sleep 4
vault token renew $BACKEND_TOKEN
curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq

#envconsul -vault-token=$BACKEND_TOKEN -config=envconsul_transit.hcl \
#  curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn"; \
#  sleep 12; \
#  curl -s -H "X-Vault-Token: $BACKEND_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn"
