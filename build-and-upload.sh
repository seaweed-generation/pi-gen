#!/bin/bash

set -eu

rm -f algafield_release.txt
rm -f algafield_*.deb

aws s3 cp s3://alga-field-debs/alga-field/current_release.txt algafield_release.txt

export ALGAFIELD_DEB="$(cat algafield_release.txt)"

aws s3 cp "s3://alga-field-debs/alga-field/$ALGAFIELD_DEB" .

sudo --preserve-env=ALGAFIELD_DEB ./build.sh

source config.base

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFO_FILE="${BASE_DIR}/deploy/${IMG_FILENAME}-lite.info"
ARCHIVE_FILE="${BASE_DIR}/deploy/${ARCHIVE_FILENAME}-lite.zip"

aws s3 cp $INFO_FILE s3://algos-images
aws s3 cp $ARCHIVE_FILE s3://algos-images

sudo rm -rf work
sudo rm $INFO_FILE
sudo rm $ARCHIVE_FILE
