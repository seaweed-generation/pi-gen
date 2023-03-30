#!/bin/bash

set -euo pipefail

USER_HOME="/home/$FIRST_USER_NAME"

git_clone() {
  runuser -l "$FIRST_USER_NAME" \
    -c "GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no -i $USER_HOME/.ssh/id_ed25519\" git clone git@github.com:seaweed-generation/$1.git $USER_HOME/$1"
}

git_clone "alga-field"

runuser -l "$FIRST_USER_NAME" -c "cd $USER_HOME/alga-field && pip install --user -e ."

touch /etc/cron.d/alga-field

echo "*/2 * * * * $FIRST_USER_NAME .local/bin/alga wifi check" >> /etc/cron.d/alga-field
echo "* * * * * $FIRST_USER_NAME .local/bin/alga beacon" >> /etc/cron.d/alga-field
