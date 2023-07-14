#!/bin/bash
set -e

# Install Volta if it is not installed
if ! command -v volta > /dev/null; then
  /bin/sh ./volta-setup.sh
  ~/.volta/bin/volta install node
fi

# Disable history
echo unset HISTFILE >> ~/.bashrc

# Install GitHub Copilot CLI
if ! command -v github-copilot-cli > /dev/null; then
  ~/.volta/bin/npm i -g @githubnext/github-copilot-cli
  echo 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc
fi

mv ./auth-setup.sh ~
chmod +x ~/auth-setup.sh

cd ..
rm -r dotfiles
