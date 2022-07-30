# gcloud

Filter by name w/ more detailed table output:

```gcloud compute instances list --filter="name ~ <node-name>*" --project=<project> --format="table(name, networkInterfaces[0].networkIP, machineType, zone, labels.cluster, labels.cell)"```
