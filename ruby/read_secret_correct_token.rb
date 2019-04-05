ENV["VAULT_ADDR"] = "http://127.0.0.1:8200"
require "vault"

default_token = `vault token create -address=http://127.0.0.1:8200 \
  -policy=default -field=token`

Vault.token = default_token
secret = Vault.logical.read "secret/signup"
# BOOM!
# The Vault server at `http://127.0.0.1:8200' responded with a 403. (Vault::HTTPClientError)
# Any additional information the server supplied is shown below:
#
#   * 1 error occurred:
#   * permission denied
#
# Please refer to the documentation for help.
