function horizontal {
        printf "%$(tput cols)s\n" | tr ' ' '*'
}

# Standard prompt
PROMPT='
$fg_bold[yellow]$(horizontal)
$fg[black]%* $fg[blue]%n$fg[cyan]@$fg[yellow]%m $fg[green]%~$reset_color
%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%} $ '

# Prompt right aligned
# RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

# git prompt info
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})"

# git prompt status
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%} ≫"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✣"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[black]%} ✱"
