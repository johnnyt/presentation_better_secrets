ENV["VAULT_ADDR"] = "http://127.0.0.1:8200"
ENV["VAULT_TOKEN"] = "root"

require "vault"

secret = Vault.logical.read "secret/signup"
p secret.data
# {:DB_PASSWORD=>"bar", :DB_USERNAME=>"foo"}
