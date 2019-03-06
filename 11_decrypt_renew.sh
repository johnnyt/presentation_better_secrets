#!/usr/bin/env bash
set -xeuo pipefail
export VAULT_ADDR=http://127.0.0.1:8200

TTL=2m
MAX_TTL=10m

SSN="123-45-6789"
BASE64=$(base64 <<< $SSN)

CIPHERTEXT=$(vault write transit/encrypt/ssn -format=json plaintext=$BASE64 | jq -r '.data.ciphertext')

export VAULT_TOKEN=$(vault token create -policy=backend_service -ttl=$TTL -explicit-max-ttl=$MAX_TTL -field=token)

envconsul -config=envconsul_transit.hcl sleep $TTL; curl -s -H "X-Vault-Token: $VAULT_TOKEN" -X POST --data "{\"ciphertext\":\"$CIPHERTEXT\"}" "$VAULT_ADDR/v1/transit/decrypt/ssn" | jq
