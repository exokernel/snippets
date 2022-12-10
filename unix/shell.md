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
