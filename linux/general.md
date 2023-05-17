# General Linux Notes

## Commands

### lsof

```bash
lsof -Pn -p $(pidof mysqld)
```

-Pn will make lsof go faster

-P inhibits the conversion of port numbers to port names for network files.  Inhibiting the conversion may make lsof run a little faster.  It is also useful when port name lookup is not working properly.

-n inhibits the conversion of network numbers to host names for network files.  Inhibiting conversion may make lsof run faster.  It is also useful when host name lookup is not working properly.
## Concepts

### Filesystem Journal

journalctl notes here

### Segfault

<https://www.cyberciti.biz/tips/segmentation-fault-on-linux-unix.html>


### Add user to group

```bash
usermod -a -G groupname username
```

### Running Commands as User who has `nologin`

You can use sudo to launch a shell as that user and then run your commands

```bash
sudo -u www-data bash
```

### Extract unique IPs from tcpdump

```bash
tcpdump -ni any port '(514 or 5140)' and dst host 10.128.2.48 | awk '{ ip = gensub(/([0-9]+.[0-9]+.[0-9]+.[0-9]+)(.*)/,"\\1","g",$3); if(!d[ip]) { print ip; d[ip]=1; fflush(stdout) } }'
```
