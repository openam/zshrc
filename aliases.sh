# system
alias l='ls -A'
alias a='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias fhere="find . -iname "
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

##########################################################
# node
##########################################################
alias update-repo='npm install && bower install && grunt compile'

##########################################################
# docker
##########################################################
if hash docker 2>/dev/null; then

	alias docker-rmi='docker rmi $(docker images -q --filter "dangling=true")'
	alias docker-rm='docker rm $(docker ps -q -f status=exited)'

	# Get latest container ID
	alias dl="docker ps -l -q"

	# Get container process
	alias dps="docker ps"

	# Get process included stop container
	alias dpa="docker ps -a"

	# Get images
	alias di="docker images"

	# Get container IP
	alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

	# Run deamonized container, e.g., $dkd base /bin/echo hello
	alias dkd="docker run -d -P"

	# Execute a command on an existing container, e.g., $dke container-name /bin/bash
	alias dke="docker exec -i -t"

	# Run interactive container, e.g., $dki base /bin/bash
	alias dki="docker run -i -t -P"

	# Stop all containers
	alias dstop='docker stop $(docker ps -a -q);'

	# Remove all exited containers
	alias drm='docker rm'

	# Remove all exited containers
	alias drme='docker rm $(docker ps -q -f status=exited)'

	# Remove all containers
	alias drma='docker rm $(docker ps -a -q)'

	# Stop and Remove all containers
	alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

	# Remove all images
	alias dri='docker rmi $(docker images -q)'

	# Trim all dangling images
	alias dti='docker rmi $(docker images -q --filter "dangling=true")'

	# Dockerfile build, e.g., $dbu repo/test
	dbu() { docker build -t=$1 .; }

	# Show all aliases related docker
	dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

	##########################################################
	# boot2docker
	##########################################################
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

fi


##########################################################
# git
##########################################################

# Show all aliases related git
# there are many aliases added by the zsh git plugin
galias() { alias | grep 'git' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
