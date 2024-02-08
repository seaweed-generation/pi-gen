#!/bin/bash -e

if [[ -z "$MENDER_TENANT_TOKEN" || -z "$MENDER_DEVICE_TYPE" ]]; then
  echo "MENDER_TENANT_TOKEN or MENDER_DEVICE_TYPE is not set, will need to manually run mender setup"
else
  echo "Setting up mender config..."

  mender setup \
    --data /data/mender \
    --device-type "$MENDER_DEVICE_TYPE" \
    --hosted-mender \
    --tenant-token "$MENDER_TENANT_TOKEN" \
    --demo-polling
fi
