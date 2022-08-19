# Vault

## Basic Idea

Everything in vault is accessed via filesystem like path (secret/foo/bar)

You authenticate to vault via some *auth method* (password, token, cert)
e.g. vault login ...

Once successfully authenticated you get a token tied to a policy

You use the token for operations against vault (read, create, list a path)

If the attached policy allows it your operation is successful

## Start a dev server with simple key of 'root'

```bash
vault server -dev -dev-root-token-id=root
```

## Policies

Tutorial: <https://learn.hashicorp.com/tutorials/vault/policies>

Example Policy: admin-policy.hcl

```text
# Read system health check
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Create and manage ACL policies broadly across Vault

# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage authentication methods broadly across Vault

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Enable and manage the key/value secrets engine at  path

# List, create, update, and delete key/value secrets
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List existing secrets engines.
path "sys/mounts"
{
  capabilities = ["read"]
}
```

Create a token with the policy

```bash
ADMIN_TOKEN=$(vault token create -format=json -policy="admin" | jq -r ".auth.client_token")
```

Get capabilities of token for a path

```bash
vault token capabilities $ADMIN_TOKEN sys/auth/approle
```

A policy to step down from active?

```text
path "sys/stepdown"
{
   capabilities = ["create", "update", "sudo"]
}
```
