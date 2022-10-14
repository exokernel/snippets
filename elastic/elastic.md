# Elastic Search Stuff

## Get elastic version

```bash
curl -s http://localhost:9200/
```

## List Indices Example

```bash
curl -s http://localhost:9200/_aliases?pretty=true | grep group5 | sort
```

## Shard allocation delay

```bash
curl -X PUT "http://localhost:9200/_all/_settings" -H 'Content-Type: application/json' -d' { "settings": { "index.unassigned.node_left.delayed_timeout": "15m" } }'
```
