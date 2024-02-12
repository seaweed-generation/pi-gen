#!/bin/bash -e

if [[ -z "$MENDER_TENANT_TOKEN" || -z "$MENDER_DEVICE_TYPE" ]]; then
  echo "MENDER_TENANT_TOKEN or MENDER_DEVICE_TYPE is not set, will need to manually run mender setup"
else
  echo "Setting up mender config..."

  # the community-maintained deb package symlinks /var/lib/mender to /data/mender,
  # but the setup command tries to also create /var/lib/mender, so it blows up.
  # not sure if that'll all be fixed in the new setup stuff, which should be released
  # for bookworm imminently, but this works for now.
  mender setup \
    --data /data/mender \
    --device-type "$MENDER_DEVICE_TYPE" \
    --hosted-mender \
    --tenant-token "$MENDER_TENANT_TOKEN" \
    --demo-polling
fi
