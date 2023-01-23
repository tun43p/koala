.PHONY: all build clean help update run

.DEFAULT_GOAL := all

all: build run

build:
	docker compose --verbose up --build -d

clean:
	docker compose down -v

help:
	@echo "koala-v1.0.3"
	@echo ""
	@echo "make all: Build and run a Koala instance"
	@echo "make build: Build Koala"
	@echo "make clean: Clean all Koala images and containers"
	@echo "make help: Show Koala help"
	@echo "make run: Run a Koala instance"

update:
	git checkout main && git pull origin main

run: 
	docker compose run --rm koala