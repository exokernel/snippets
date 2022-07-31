# Handy CLI Commands

## Mac OS Netstat with PID

```bash
lsof -Pnl +M -i4 | grep 4000

lsof -nP -iTCP -sTCP:LISTEN | grep <port-number>
```
