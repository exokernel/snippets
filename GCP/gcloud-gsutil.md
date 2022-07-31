# Handy GCloud and GSUtil Tricks

## gcloud

### Filter by name w/ more detailed table output

```gcloud compute instances list --filter="name ~ <node-name>*" --project=<project> --format="table(name, networkInterfaces[0].networkIP, machineType, zone, labels.cluster, labels.cell)"```

### List configs

```bash
gcloud config configurations list
```

### Switch config

```bash
gcloud config configurations activate config-name
```

### Set project

```bash
gcloud config set project $MY_PROJECT_ID
```

## gsutil
