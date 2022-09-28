# Nomad Server

## starting up a nomad server cluster

```bash
nomad agent -server -data-dir <somedir> -bootstrap-expect=3
```

then start 2 other servers with

```bash
nomad agent -server -data-dir <somedir> -join=<ip-of-first-server>
```
