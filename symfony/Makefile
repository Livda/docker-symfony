.DEFAULT_GOAL := help

help:
	@grep -E '(^[a-zA-Z_-]+:.*?## .*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[36m##/[33m/'

.PHONY: help cs ssh install

#
# Variable
#
DOCKER_COMPOSE = docker-compose
PHP = $(DOCKER_COMPOSE) exec --user www-data php
SYMFONY = $(PHP) bin/console
COMPOSER = $(PHP) composer

#
# Help
#

install: .env.local vendor  ## Install the projet

.env.local: .env ## create local env
	cp .env .env.local

vendor: composer.json composer.lock ## Install vendors
	$(COMPOSER) install

composer.lock: composer.json
	$(COMPOSER) update --lock --no-scripts --no-interaction

ssh: ## Ssh into php container
	$(PHP) sh

php-cs-fixer: | vendor ## php-cs-fixer (http://cs.sensiolabs.org)
	$(PHP) php vendor/bin/php-cs-fixer fix --dry-run --using-cache=no --verbose --diff

apply-php-cs-fixer: | vendor ## apply php-cs-fixer fixes
	$(PHP) php vendor/bin/php-cs-fixer fix --using-cache=no --verbose --diff
