#!/bin/bash

set -euo pipefail

# TODO: better to git clone and pip install --user -e ., makes updates easier
runuser -l "$FIRST_USER_NAME" \
  -c "GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no -i /home/$FIRST_USER_NAME/.ssh/id_ed25519\" pip install --user git+ssh://git@github.com/seaweed-generation/alga-field.git#egg=algafield"

echo "*/2 * * * * $FIRST_USER_NAME .local/bin/alga wifi check" > /etc/cron.d/wifi-check
