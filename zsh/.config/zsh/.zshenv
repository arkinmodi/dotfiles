export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

source "$HOME/.config/zsh/.zshenv_secrets"

export EDITOR="nvim"
export BROWSER=

# zsh-nvm plugin
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# GitHub CLI
export GH_HOST=github.com
export GH_CONFIG_DIR="$HOME/.config/gh"
