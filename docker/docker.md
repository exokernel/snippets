# Docker cli

## Useful tricks

### Copy file out of a running container

<https://stackoverflow.com/questions/22049212/docker-copying-files-from-docker-container-to-host>

```
docker cp <containerId>:/file/path/within/container /host/path/target
```
