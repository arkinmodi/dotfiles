export ZDOTDIR="$HOME"
export XDG_CONFIG_HOME="$HOME/.config"
export DOTFILES="$HOME/dev/dotfiles"

source "$HOME/.config/zsh/.secret.env"

# Oh My Zsh
export ZSH_CUSTOM="$HOME/.config/zsh"

# zsh-nvm plugin
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"

# GPG Key (Signing git commits)
export GPG_TTY=$(tty)

# GitHub CLI
export GH_EDITOR=nvim
