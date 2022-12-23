# Elastic Search Stuff

## Commands

### Get elastic version

```bash
curl -s http://localhost:9200/
```

### Get cluster health

```bash
curl -s https://localhost:9200/_cluster/health | jq .
```

### List Indices Example

```bash
curl -s http://localhost:9200/_aliases?pretty=true | grep group5 | sort
```

### Shard allocation delay

```bash
curl http://localhost:9200/_all/_settings
```

```bash
curl -X PUT "http://localhost:9200/_all/_settings" -H 'Content-Type: application/json' -d' { "settings": { "index.unassigned.node_left.delayed_timeout": "15m" } }'
```

## Setup

<https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-22-04>
