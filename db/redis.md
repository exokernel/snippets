# Redis stuff

## Memory settings

```bash
[root@redis]:/var/log# redis-cli
127.0.0.1:6379> config get *mem*
 1) "replica-ignore-maxmemory"
 2) "yes"
 3) "slave-ignore-maxmemory"
 4) "yes"
 5) "crash-memcheck-enabled"
 6) "yes"
 7) "maxmemory-policy"
 8) "allkeys-lru"
 9) "maxmemory-samples"
10) "3"
11) "maxmemory-eviction-tenacity"
12) "10"
13) "maxmemory"
14) "10240000000"
```
