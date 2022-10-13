# Shell tricks

## Split

Split single file into multiple files
```bash
split -d -l 10 rome-instances.txt rome-instances-
```

## Paste

Join lines with comma
```bash
cat some-file | paste -sd, -
```

### Exit script immediately if any command fails


see `help set` for details

```bash
set -e
```
