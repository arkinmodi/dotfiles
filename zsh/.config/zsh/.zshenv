#!/usr/bin/env zsh
# shellcheck shell=bash disable=SC1091

export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

[[ -f "$HOME/.config/zsh/.zshenv_secrets" ]] \
    && source "$HOME/.config/zsh/.zshenv_secrets"

export EDITOR="nvim"

# export BROWSER=

# Put user managed bin first
export PATH="$HOME/bin:$PATH"

# Java
[[ -d "$HOME/opt/java/java-21.jdk/Contents/Home" ]] \
    && export JDK21="$HOME/opt/java/java-21.jdk/Contents/Home"

[[ -d "$HOME/opt/java/java-17.jdk/Contents/Home" ]] \
    && export JDK17="$HOME/opt/java/java-17.jdk/Contents/Home"

[[ -d "$HOME/opt/java/java-11.jdk/Contents/Home" ]] \
    && export JDK11="$HOME/opt/java/java-11.jdk/Contents/Home"

[[ -d "$HOME/opt/java/java-8.jdk/Contents/Home" ]] \
    && export JDK8="$HOME/opt/java/java-8.jdk/Contents/Home"

# shellcheck disable=SC2155,SC2046
readlink "$(which java)" >& /dev/null \
    && export JAVA_HOME="$(dirname $(dirname $(readlink $(which java))))"

# AWS
export SAM_CLI_TELEMETRY=0

# Rust
# shellcheck disable=SC2046,SC2086,SC2155
readlink "$(which rustup)" >& /dev/null \
    && export CARGO_HOME="$(dirname $(dirname $(readlink $(which cargo))))" \
    && export RUSTUP_HOME="$(dirname $CARGO_HOME)/.rustup"
