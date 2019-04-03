path "secret/backend" {
  capabilities = ["read"]
}

path "transit/decrypt/ssn" {
  capabilities = ["list","update"]
}
