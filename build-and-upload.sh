#!/bin/bash

set -eu

sudo ./build.sh

aws s3 cp "${DEPLOY_DIR}/${IMG_FILENAME}${IMG_SUFFIX}.info" s3://algos-images
aws s3 cp "${DEPLOY_DIR}/${IMG_FILENAME}${IMG_SUFFIX}.img.${DEPLOY_COMPRESSION}" s3://algos-images

sudo rm -rf work
