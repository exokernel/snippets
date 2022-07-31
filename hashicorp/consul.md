# Consul Tricks

## Get all nodes with matching name

```bash
curl --get http://127.0.0.1:8500/v1/catalog/nodes --data-urlencode\ 'filter=Node contains "deploy-"' | jq
```
