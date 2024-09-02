#!/bin/bash
set -e

curl https://get.volta.sh | bash

if ! grep -qF 'export PATH="$VOLTA_HOME:$PATH"' ~/.bashrc; then
    echo 'export PATH="$VOLTA_HOME:$PATH"' >> ~/.bashrc
fi
