# Nomad Server

## Starting up a nomad server cluster

start up first server

```bash
nomad agent -server -data-dir <somedir> -bootstrap-expect=3
```

then start 2 other servers with

```bash
nomad agent -server -data-dir <somedir> -join=<ip-of-first-server>
```

## Server commands

List server members

```bash
nomad server members
```

### Raft

List raft peers

```bash
nomad operator raft list-peers
```

### Shutdown Nomad Servers and Cleanup Raft

```bash
kill $(pgrep nomad) && rm nomad-data/server/raft/raft.db && ps aux | grep nomad
```
