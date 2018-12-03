.DEFAULT_GOAL := help

#
# Help
#

help:
	@grep -E '(^[a-zA-Z_-]+:.*?## .*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[36m##/[33m/'

# Variables
DOCKER_COMPOSE = docker-compose


.PHONY: install start stop uninstall clean build restart help

##
## Setup
##

build: ## build the containers
	@$(DOCKER_COMPOSE) pull --parallel --quiet --ignore-pull-failures 2> /dev/null
	$(DOCKER_COMPOSE) build --pull

clean: kill ## Stop the project and remove generated files
	rm -rf symfony/.env.local symfony/vendor

install: clean build start ## initialize the containers
	make -C symfony install

kill:
	$(DOCKER_COMPOSE) kill
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

reset: kill install ## Stop and start a fresh install of the project

start: ## Starts the docker containers
	$(DOCKER_COMPOSE) up -d --remove-orphans --no-recreate

stop: ## Stops the docker containers
	$(DOCKER_COMPOSE) stop

restart: stop start ## Restarts the docker containers
