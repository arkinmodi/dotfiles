#!/usr/bin/env zsh
# shellcheck shell=bash disable=SC1091

bindkey -e # force emacs bindings (ignore $EDITOR env)

# History Configuration
# shellcheck disable=SC2034
HISTFILE=~/.zsh_history
# shellcheck disable=SC2034
HISTSIZE=5000
# shellcheck disable=SC2034
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Prompt
source "$ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
# shellcheck disable=SC1090,SC2296
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "$HOME/.config/zsh/.p10k.zsh" ]] || source "$HOME/.config/zsh/.p10k.zsh"

# Static Completions
autoload -Uz compinit
[[ -d $ZDOTDIR/completions/ ]] && fpath+="$ZDOTDIR/completions/"
compinit

zmodload zsh/complist

setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt MENU_COMPLETE
setopt globdots
setopt nocaseglob

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' squeeze-slashes true

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

autoload edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Executed before each prompt
# https://zsh.sourceforge.io/Doc/Release/Functions.html#Hook-Functions
function precmd() {
    # [ -d FILE ]   True if FILE exists and is a directory.
    # [ -x FILE ]   True if FILE exists and is executable.
    # [ -e FILE ]   True if FILE exists.
    if [ -d .git ] \
        && [ ! -x .git/hooks/pre-commit ] \
        && [ -e .pre-commit-config.yaml ] \
        && command -v pre-commit &> /dev/null
    then
        pre-commit install --hook-type pre-commit
    fi
}

# Homebrew
[ -e "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Runtime Generated Completions
source "$ZDOTDIR/.zsh_completions"

# Plugins
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

source "$ZDOTDIR/.zshenv"
source "$ZDOTDIR/.zsh_aliases"
source "$ZDOTDIR/.zsh_functions"

# shellcheck disable=SC1090
command -v 'direnv' &> /dev/null && source <(direnv hook zsh)

# Work Stuff
[[ -v WORK && -f "$HOME/.dotfiles.work/zsh/.zshrc" ]] \
    && source "$HOME/.dotfiles.work/zsh/.zshrc"

true # reset any error codes
