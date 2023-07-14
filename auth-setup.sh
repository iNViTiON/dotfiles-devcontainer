#!/bin/bash
set +e

source ~/.bashrc

echo 'Run `gh auth token` on host to get GitHub CLI token.'
read -p "Enter GitHub CLI token: " GH_CLI_TOKEN
tput sc && tput cuu1 && tput el && echo 'Enter GitHub CLI token: ×××' && tput rc
gh auth login -p https --with-token < <(echo "$GH_CLI_TOKEN")
unset GH_CLI_TOKEN
gh auth status

github-copilot-cli auth

rm ~/auth-setup.sh
