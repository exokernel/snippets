# Bolt Tricks

## Facter across hosts

```bash
gcloud compute instances list --filter="name ~ $name.*" --project $project --format="get(networkInterfaces[0].networkIP)" |\
bolt --no-host-key-check command run "hostname; facter gce.instance.attributes.cell gce.instance.zone" --targets=-
```
