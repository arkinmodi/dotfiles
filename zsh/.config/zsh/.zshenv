export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

[[ -f "$HOME/.config/zsh/.zshenv_secrets" ]] && source "$HOME/.config/zsh/.zshenv_secrets"

# setting EDITOR will change tmux bindings
# export EDITOR="nvim"

export BROWSER=

# Put user managed bin first
export PATH="$HOME/bin:$PATH"

# Java
readlink $(which java) >& /dev/null \
    && export JAVA_HOME="$(dirname $(dirname $(readlink $(which java))))"

# Java LSP Config (jdtls)
# Options: https://github.com/eclipse-jdtls/eclipse.jdt.ls/blob/master/org.eclipse.jdt.ls.core/src/org/eclipse/jdt/ls/core/internal/preferences/Preferences.java
[[ -f "$HOME/opt/java/lombok.jar" ]] \
    && export JDTLS_JVM_ARGS="-javaagent:$HOME/opt/java/lombok.jar"

# GitHub CLI
export GH_HOST=github.com
export GH_CONFIG_DIR="$XDG_CONFIG_HOME/gh"

# AWS
export SAM_CLI_TELEMETRY=0

# Rust
readlink $(which rustup) >& /dev/null \
    && export CARGO_HOME="$(dirname $(dirname $(readlink $(which cargo))))" \
    && export RUSTUP_HOME="$(dirname $CARGO_HOME)/.rustup"
