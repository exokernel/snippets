# Getting Instance Metadata

## Instance identity

https://cloud.google.com/compute/docs/instances/verifying-instance-identity

Get a JWT identifying the instance
```bash
#!/usr/bin/bash
set -e

ROLE="local-instance"

AUD="http://vault/${ROLE}"
JWT=`curl -s \
  -H "Metadata-Flavor: Google" \
  --data-urlencode "audience=${AUD}" \
  --data-urlencode "format=full" \
  "http://metadata/computeMetadata/v1/instance/service-accounts/default/identity"`
echo $JWT
```

What is a json web token?
https://jwt.io/introduction/

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. JWTs can be signed using a secret (with the HMAC algorithm) or a public/private key pair using RSA or ECDSA.

Although JWTs can be encrypted to also provide secrecy between parties, we will focus on signed tokens. Signed tokens can verify the integrity of the claims contained within it, while encrypted tokens hide those claims from other parties. When tokens are signed using public/private key pairs, the signature also certifies that only the party holding the private key is the one that signed it.

Decode a JWT here: https://jwt.io/
