sanitize = true
upcase = true

secret {
  no_prefix = true
  path = "secret/web_app"
}

vault {
  address = "http://127.0.0.1:8200"

  # This value can also be specified via the environment variable VAULT_TOKEN.
  #token = "s.BcNxm1uioCUggRwYZW8K3dfM"

  # This tells Envconsul that the provided token is actually a wrapped
  # token that should be unwrapped using Vault's cubbyhole response wrapping
  # before being used. Please see Vault's cubbyhole response wrapping
  # documentation for more information.
  #unwrap_token = true

  # This option tells Envconsul to automatically renew the Vault token given.
  # If you are unfamiliar with Vault's architecture, Vault requires tokens be
  # renewed at some regular interval or they will be revoked. Envconsul will
  # automatically renew the token at half the lease duration of the token. The
  # default value is true, but this option can be disabled if you want to renew
  # the Vault token using an out-of-band process.
  #
  # Note that secrets specified as a prefix are always renewed, even if this
  # option is set to false. This option only applies to the top-level Vault
  # token itself.
  renew_token = false

  # This section details the retry options for connecting to Vault. Please see
  # the retry options in the Consul section for more information (they are the
  # same).
  #retry {
  #  # ...
  #}

  # This section details the SSL options for connecting to the Vault server.
  # Please see the SSL options in the Consul section for more information (they
  # are the same).
  #ssl {
  #  # ...
  #}
}
