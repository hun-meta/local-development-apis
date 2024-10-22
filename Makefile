# Get HOST_IP for ID generator
export HOST_IP := $(shell ip -4 route get 8.8.8.8 | awk '{print $$7}' | tr -d '\n')

# For local machine Development Test for all services
.PHONY: build-dev-all
build-dev-all: ## Build the development docker image.
	docker compose -f ./docker-compose.yml build

.PHONY: start-dev-all
start-dev-all: ## Start the development docker container.
	docker compose -f ./docker-compose.yml up -d

.PHONY: stop-dev-all
stop-dev-all: ## Stop the development docker container.
	docker compose -f ./docker-compose.yml stop
	./clean_none_images.sh

.PHONY: delete-dev-all
delete-dev-all: ## Stop and Delete Volumes of development docker container.
	docker compose -f ./docker-compose.yml stop