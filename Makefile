.PHONY: all build down help run update

.DEFAULT_GOAL := all

DOCKER_DEFAULT_PLATFORM=linux/x86_64
DATE = $(shell date +'%Y%m%d%H%M%S')

export DATE
export DOCKER_DEFAULT_PLATFORM

all: build run

build: 
	@docker compose up --build -d

down: 
	@docker compose down -v

help: 
	@cat docs/HELP.md

prune:
	@docker system prune -f

run: 
	@docker compose run --rm koala

update: 
	@git checkout main && git pull origin main
