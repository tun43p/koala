.PHONY: all build clean help update run

.DEFAULT_GOAL := all

DATE = $(shell date +'%Y%m%d%H%M%S')
export DATE

all: build run

build: 
	@docker compose up --build -d

down: 
	@docker compose down -v

help: 
	@cat docs/HELP.md

update: 
	@git checkout main && git pull origin main

run: 
	@docker compose run --rm koala 
