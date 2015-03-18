# system
alias l='ls -A'
alias a='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias remove-dsstore="find . -name '*.DS_Store' -type f -delete"
alias reload-zsh="source ~/.zshrc"

# custom scripts
alias direxec="~/.zsh/scripts/direxec.sh"
alias marked="~/.zsh/scripts/marked.sh"

# Use sublime text or vi
if [ -f /usr/local/bin/subl ]; then
	EDITOR=/usr/local/bin/subl
else
	EDITOR=/usr/bin/vi
fi

alias edit=$EDITOR
export EDITOR=$EDITOR

# node
alias update-repo='npm install && bower install && grunt compile'

# docker
if hash docker 2>/dev/null; then

	alias docker-rmi='docker rmi $(docker images -q --filter "dangling=true")'
	alias docker-rm='docker rm $(docker ps -q -f status=exited)'

fi

# boot2docker
if hash boot2docker 2>/dev/null; then

	# get boot2docker status
	STATUS="$(boot2docker status)"

	# export environment variables are already set correctly
	if [ "$STATUS" = "running" ]; then
		export DOCKER_CERT_PATH=/Users/${USER}/.boot2docker/certs/boot2docker-vm
		export DOCKER_TLS_VERIFY=1
		export DOCKER_HOST=tcp://$(boot2docker ip):2376
	fi

fi
# git
