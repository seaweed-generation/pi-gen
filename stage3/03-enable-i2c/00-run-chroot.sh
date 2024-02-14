#!/bin/bash -e

sed 's/#dtparam=i2c_arm=on/dtparam=i2c_arm=on/' /boot/config.txt
