#!/bin/sh

. ./.profile

# Install brew bundles
brew bundle install

# Configure FZF
$(brew --prefix)/opt/fzf/install --all --no-zsh --no-bash > /dev/null