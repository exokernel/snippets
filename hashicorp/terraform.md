# Terraform notes

## Update lockfile with hashes for different archs

<https://www.terraform.io/cli/commands/providers/lock#specifying-target-platforms>

```bash
tf providers lock -platform=darwin_amd64 -platform=linux_amd64
```
