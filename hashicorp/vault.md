# Vault

## Basic Idea

Everything in vault is accessed via filesystem like path (secret/foo/bar)

You authenticate to vault via some *auth method* (password, token, cert)
e.g. vault login ...

Once successfully authenticated you get a token tied to a policy

You use the token for operations against vault (read, create, list a path)

If the attached policy allows it your operation is successful
