# For local machine Development Test
.PHONY: build-development
build-development: ## Build the development docker image.
	docker compose -f ./docker-compose.yml build

.PHONY: start-development
start-development: ## Start the development docker container.
	docker compose -f ./docker-compose.yml up -d

.PHONY: stop-development
stop-development: ## Stop the development docker container.
	docker compose -f ./docker-compose.yml stop
	./clean_none_images.sh

.PHONY: delete-development
delete-development: ## Stop and Delete Volumes of development docker container.
	docker compose -f ./docker-compose.yml stop