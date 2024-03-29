#!/bin/bash -e

sed -i 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/' /boot/firmware/config.txt

sed /etc/modules -i -e "s/^#[[:space:]]*\(i2c[-_]dev\)/\1/"
if ! grep -q "^i2c[-_]dev" /etc/modules; then
  echo "i2c-dev\n" >> /etc/modules
fi
