ENV["VAULT_ADDR"] = "http://127.0.0.1:8200"
require "vault"

app_token = `vault token create -address=http://127.0.0.1:8200 \
  -policy=signup_app -field=token`

Vault.token = app_token
secret = Vault.logical.read "secret/signup"
p secret.data
# {:DB_PASSWORD=>"bar", :DB_USERNAME=>"foo"}
