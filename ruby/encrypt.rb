ENV["VAULT_ADDR"] = "http://127.0.0.1:8200"
ENV["VAULT_TOKEN"] = "root"

require "vault"
require "base64"

key = "ssn"
plaintext = "123-45-6789"
encoded_plaintext = Base64.strict_encode64 plaintext

secret = Vault.logical.write "transit/encrypt/#{key}",
  plaintext: encoded_plaintext

binding.pry

p secret.data[:ciphertext]
# "vault:v1:qgKoVHEYrxwl3BO1qymjZIaOa9mkoO8Qul/MUOeBpFrTvw8HSfCu"
