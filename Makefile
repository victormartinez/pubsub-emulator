PROJECT_NAME = wlab
TEST_FOLDER = tests

.PHONY:default
default: help

.PHONY: help
help:
	@echo "All Commands:"
	@echo "		clean - Remove temp files."
	@echo "		build - Build pubsub emulator image."
	@echo "		down - Stop containers."
	@echo "		up - Start containers."

.PHONY: clean
clean:
	- @find . -name "*.pyc" -exec rm -rf {} \;
	- @find . -name "__pycache__" -delete
	- @find . -name "*.pytest_cache" -exec rm -rf {} \;
	- @find . -name "*.mypy_cache" -exec rm -rf {} \;

.PHONY: build
build:
	docker build --build-arg INSTALL_COMPONENTS="google-cloud-sdk-pubsub-emulator" -t pubsub-emulator:latest .

.PHONY: up
up:
	docker run --name pubsub-emulator -p 8085:8085 -p 8043:8043 -p 8042:8042 --rm pubsub-emulator:latest

.PHONY: create-topic
create-topic:
	PUBSUB_EMULATOR_HOST=127.0.0.1:8085 python -m pubsub_emulator.create_topic

.PHONY: create-subscription
create-subscription:
	PUBSUB_EMULATOR_HOST=127.0.0.1:8085 python -m pubsub_emulator.create_subscription

.PHONY: produce
produce:
	PUBSUB_EMULATOR_HOST=127.0.0.1:8085 python -m pubsub_emulator.produce

.PHONY: consume
consume:
	PUBSUB_EMULATOR_HOST=127.0.0.1:8085 python -m pubsub_emulator.consume