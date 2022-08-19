# Handy GCloud and GSUtil Tricks

## gcloud

### Filter by name w/ more detailed table output

```bash
gcloud compute instances list --filter="name ~ <node-name>*" --project=<project> --format='table(name, networkInterfaces[0].networkIP, machineType, zone, labels.cell, labels.cluster, labels.node_type)'
```

### Filter with AND NOT

```bash
gcloud compute instances list --filter="name ~ $name-[^-]*$ AND NOT tags.items ~ cell-3|cell-2" --project=$project --format="table(name, networkInterfaces[0].networkIP, tags.items)"
```

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

### Resizing MIG instances

```bash
TF PR adjusting the mig template is applied and merged

# read node (after maint -e)
gcloud compute instance-groups managed update-instances db-store-1001-read --instances db-store-1001-read-jb32 --most-disruptive-allowed-action restart --minimal-action restart --region us-central1 --project bigcommerce-staging
# disable maint

# masters
# inactive first (after maint -e)
gcloud compute instance-groups managed update-instances db-store-1001-master --instances db-store-1001-master-dczv --most-disruptive-allowed-action restart --minimal-action restart --region us-central1 --project bigcommerce-staging
# disable maint

# failover on orchestator node (should automatically move the read node under the new master)

# newly inactive master (after maint -e)
gcloud compute instance-groups managed update-instances db-store-1001-master --instances db-store-1001-master-55b2 --most-disruptive-allowed-action restart --minimal-action restart --region us-central1 --project bigcommerce-staging
# disable maint
```

## gsutil
