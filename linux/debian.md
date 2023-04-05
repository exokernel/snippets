# Debian Stuff

## Apt

### Install package from specific repo when there is the same package in multiple

```bash
apt-get install -o Dir::Etc::sourcelist="sources.list.d/specific.list" prometheus-graphite-exporter
```

## See contents of .deb

```txt
dpkg-deb -c foo.deb
```
