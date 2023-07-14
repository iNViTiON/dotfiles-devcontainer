#!/bin/bash
set -e

if [[ $(uname -m) == arm* || $(uname -m) == aarch* ]]; then
  mkdir -p ~/.volta
  cd ~/.volta
  curl -L $(curl -sX GET https://api.github.com/repos/MyneTop/volta/releases/latest | grep browser_download_url | cut -d : -f 2,3 | tr -d '"[:blank:]') | tar -xzvf -
  ./volta setup
  cd -
else
  curl https://get.volta.sh | bash
fi

if ! grep -qF 'export PATH="$VOLTA_HOME:$PATH"' ~/.bashrc; then
    echo 'export PATH="$VOLTA_HOME:$PATH"' >> ~/.bashrc
fi
