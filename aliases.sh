# system
alias l='ls -A'
alias a='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias remove-dsstore="find . -name '*.DS_Store' -type f -delete"

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
alias docker-rmi='docker rmi $(docker images -q --filter "dangling=true")'
alias docker-rm='docker rm $(docker ps -q -f status=exited)'

# boot2docker
export DOCKER_CERT_PATH=/Users/${USER}/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://$(boot2docker ip):2376

# git
