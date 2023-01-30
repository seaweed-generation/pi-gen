runuser -l "$FIRST_USER_NAME" \
  -c "GIT_SSH_COMMAND=\"ssh -o StrictHostKeyChecking=no\" pip install --user git+ssh://git@github.com/seaweed-generation/algarithms.git#egg=algarithms"

echo "*/2 * * * * $FIRST_USER_NAME .local/bin/alga wifi check" > /etc/cron.d/wifi-check
