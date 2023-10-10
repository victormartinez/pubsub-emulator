PROJECT_NAME = wlab
TEST_FOLDER = tests

.PHONY:default
default: help

.PHONY: help
help:
	@echo "All Commands:"
	@echo "	Env:"
	@echo "		build - Build pubsub emulator image."
	@echo "		run - Execute the API."
	@echo "		down - Stop containers."
	@echo "		up - Start containers."

.PHONY: build
build:
	docker build -t pubsub-emulator:latest .

.PHONY: up
up:
	docker run -p 8085:8085 --rm pubsub-emulator:latest

.PHONY: run
run:
	uvicorn promlab.main:app --reload
