#!/bin/bash

set -e

WORKON_HOME="$HOME/.virtualenvs"
PROJECT_HOME="$HOME/Development"

# Make directories
mkdir -p $WORKON_HOME
mkdir -p $PROJECT_HOME

# Download and install Command Line Tools (fails if installed)
echo "Info   | Install   | xcode"
xcode-select --install

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    brew install ansible
fi

# Provision local machine
ansible-playbook --ask-sudo-pass -i hosts site.yml --connection=local