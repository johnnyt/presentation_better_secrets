ENV["VAULT_ADDR"] = "http://127.0.0.1:8200"
ENV["VAULT_TOKEN"] = "root"

require "vault"

secret = Vault.logical.read "secret/signup"

Vault.logical.write "secret/signup", db_password: "yup"

secret = Vault.logical.read "secret/signup"

puts "Done"
