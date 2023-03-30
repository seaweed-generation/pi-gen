#!/bin/bash

set -eu

sudo ./build.sh

source config.base

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFO_FILE="${BASE_DIR}/deploy/${IMG_FILENAME}-lite.info"
ARCHIVE_FILE="${BASE_DIR}/deploy/${ARCHIVE_FILENAME}-lite.img.${DEPLOY_COMPRESSION}"

aws s3 cp $INFO_FILE s3://algos-images
aws s3 cp $ARCHIVE_FILE s3://algos-images

sudo rm -rf work
sudo rm $INFO_FILE
sudo rm $ARCHIVE_FILE
