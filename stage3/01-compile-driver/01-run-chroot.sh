#!/bin/bash

set -euo pipefail

cd "$HOME"
git clone https://github.com/morrownr/8821cu-20210916.git
cd "8821cu-20210916"
sudo ./install-driver.sh NoPrompt
