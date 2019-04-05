path "secret/signup" {
  capabilities = ["read"]
}

path "transit/encrypt/ssn" {
  capabilities = ["create", "update"]
}
