export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

[[ -f "$HOME/.config/zsh/.zshenv_secrets" ]] && source "$HOME/.config/zsh/.zshenv_secrets"

# setting EDITOR will change tmux bindings
# export EDITOR="nvim"

export BROWSER=

# pyenv (Simple Python Version Management)
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null && export PATH="$PYENV_ROOT/bin:$PATH"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/ibm-semeru-open-17.jdk/Contents/Home
if [ -d $JAVA_HOME ]; then
  export PATH="$JAVA_HOME/bin:$PATH"
else
  unset JAVA_HOME
fi

# GitHub CLI
export GH_HOST=github.com
export GH_CONFIG_DIR="$XDG_CONFIG_HOME/gh"
