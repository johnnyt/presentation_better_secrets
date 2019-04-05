path "secret/web_app" {
  capabilities = ["read"]
}

path "transit/encrypt/ssn" {
  policy="write"
}
