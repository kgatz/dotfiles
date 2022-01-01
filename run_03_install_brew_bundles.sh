#!/bin/sh

. ./.profile

# Install brew bundles
brew bundle install

# Configure FZF
$(brew --prefix)/opt/fzf/install --all --no-zsh --no-bash > /dev/null


# Install fish completions
if [ -d ~/.config/fish/completions ]; then
    if command -v chezmoi &> /dev/null; then
        chezmoi completion fish --output ~/.config/fish/completions/chezmoi.fish
    fi
    if command -v flux &> /dev/null; then
        flux completion fish > ~/.config/fish/completions/flux.fish
    fi
    if command -v helm &> /dev/null; then
        helm completion fish > ~/.config/fish/completions/helm.fish
    fi
    if command -v kustomize &> /dev/null; then
        kustomize completion fish > ~/.config/fish/completions/kustomize.fish
    fi
    if command -v velero &> /dev/null; then
        velero completion fish > ~/.config/fish/completions/velero.fish
    fi
    if command -v kubectl &> /dev/null; then
        kubectl completion fish > ~/.config/fish/completions/kubectl.fish
    fi
fi