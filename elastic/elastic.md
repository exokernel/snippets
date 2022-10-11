# Elastic Search Stuff

## Get elastic version

```bash
curl -s http://localhost:9200/
```

## List Indices Example

```bash
curl -s http://localhost:9200/_aliases?pretty=true | grep group5 | sort
```
