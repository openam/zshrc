# Horizontal bar of dashes '--------------'
function horizontal {
    printf "%$(tput cols)s\n" | tr ' ' '-'
}

# Provide information about ahead/behind tracked branch
function git_remote_status {
	if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then

		# check if the branch is tracking against an upstream branch
		if git rev-list --right-only --count HEAD...@'{u}' > /dev/null 2>&1; then
			REMOTE_STATUS="%{$fg[magenta]%} u="

			BEHIND="$(git rev-list --right-only --count HEAD...@'{u}')"
			AHEAD="$(git rev-list --left-only --count HEAD...@'{u}')"

			if [[ "$BEHIND" > 0 ]] || [[ "$AHEAD" > 0 ]]; then
				REMOTE_STATUS="%{$fg[magenta]%} u"

				if [[ "$AHEAD" > 0 ]]; then
					REMOTE_STATUS="${REMOTE_STATUS}${GIT_REMOTE_STATUS_AHEAD}${AHEAD}"
				fi
				if [[ "$BEHIND" > 0 ]]; then
					REMOTE_STATUS="${REMOTE_STATUS}${GIT_REMOTE_STATUS_BEHIND}${BEHIND}"
				fi
			fi
		fi
		# echo 'is git repository'
		echo "$REMOTE_STATUS"
	fi
}

# Standard prompt
PROMPT='
$fg_bold[yellow]$(horizontal)
$fg[black]%w, %* $fg[blue]%n$fg[cyan]@$fg[yellow]%m $fg[green]%~$reset_color
%{$fg[magenta]%}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}$(git_remote_status)%{$reset_color%} $ '

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

# git remote status - custom function
GIT_REMOTE_STATUS_BEHIND="-"
GIT_REMOTE_STATUS_AHEAD="+"
