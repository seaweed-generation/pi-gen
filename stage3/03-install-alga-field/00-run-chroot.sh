#!/bin/bash

set -euo pipefail

git_clone() {
  runuser -l "$FIRST_USER_NAME" \
    -c "GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no -i /home/$FIRST_USER_NAME/.ssh/id_ed25519\" git clone git@github.com:seaweed-generation/$1.git /home/$FIRST_USER_NAME/$1"
}

git_clone "alga-field"

runuser -l "$FIRST_USER_NAME" -c "cd /home/$FIRST_USER_NAME/alga-field && pip install --user -e ."

echo "*/2 * * * * $FIRST_USER_NAME .local/bin/alga wifi check" > /etc/cron.d/wifi-check
echo "* * * * * $FIRST_USER_NAME .local/bin/alga beacon" > /etc/cron.d/alga-beacon
