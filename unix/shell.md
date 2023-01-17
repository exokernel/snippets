# Shell tricks

## Calculator

```bash
 echo "scale=2; $(ls -ld /var/tmp/bcloader/* | wc -l)/$(ls -ld /var/tmp/bcdumper/* | grep store_ | wc -l)" | bc -l
```

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

## Column

```bash
printf "Role,Name,UUID\nActive,$active,$active_uuid\nPassive,$passive,$passive_uuid\nRead,$readonly,$readonly_uuid\n" | column -t -s ,
```

### Exit script immediately if any command fails


see `help set | less` for details

```txt
 -e  Exit immediately if a command exits with a non-zero status.
```

```bash
set -e
```

## Cleanup $PATH with python

This actually does preserve the order. TODO: Look into why. aparently `dict.fromkeys` preserves order.

```python3
import os

# grab $PATH
path = os.environ['PATH'].split(':')

# normalize all paths
path = map(os.path.normpath, path)

# remove duplicates via a dictionary
clean = dict.fromkeys(path)

# combine back into one path
clean_path = ':'.join(clean.keys())

# dump to stdout
print(f"PATH=\"{clean_path}\"")
```

Then in your .zshrc (or equivalent)

```zsh
eval $(python3 $HOME/scripts/clean-path.py)
```

## Human readable $PATH

```zsh
echo $PATH | tr ':' '\n' | sort | uniq -c | less
```
