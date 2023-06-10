export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

[[ -f "$HOME/.config/zsh/.zshenv_secrets" ]] && source "$HOME/.config/zsh/.zshenv_secrets"

# setting EDITOR will change tmux bindings
# export EDITOR="nvim"

export BROWSER=

export PATH="$HOME/bin:$PATH"

# pyenv (Simple Python Version Management)
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
else
    unset PYENV_ROOT
fi

# Java
command -v java >& /dev/null && export JAVA_HOME="$(dirname $(dirname $(readlink $(which java))))"

# GitHub CLI
export GH_HOST=github.com
export GH_CONFIG_DIR="$XDG_CONFIG_HOME/gh"
