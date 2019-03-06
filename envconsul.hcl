sanitize = true
upcase = true

secret {
  no_prefix = true
  path = "secret/web_app"
}

vault {
  address = "http://127.0.0.1:8200"
  renew_token = false
}
