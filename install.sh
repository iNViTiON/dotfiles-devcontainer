#!/bin/bash
set -e

# Install Volta if it is not installed
if ! command -v volta > /dev/null; then
  /bin/sh ./volta-setup.sh
  ~/.volta/bin/volta install node
fi

# Disable history
echo unset HISTFILE >> ~/.bashrc

mv ./auth-setup.sh ~
chmod +x ~/auth-setup.sh

cd ..
rm -r dotfiles
