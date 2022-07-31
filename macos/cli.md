# Handy CLI Commands

## Netstat with PID

```bash
lsof -Pnl +M -i4 | grep 4000

lsof -nP -iTCP -sTCP:LISTEN | grep <port-number>
```
