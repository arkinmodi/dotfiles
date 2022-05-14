# Based off of https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/simple.zsh-theme

PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%2~$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
