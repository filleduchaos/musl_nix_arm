USERNAME=$(DOCKER_USER)
NAME=calculator_example
IMAGE=$(USERNAME)/$(NAME)
VOLUME=$(PWD)

default: build

build:
	docker build -t $(IMAGE) .
	docker run --name calculator_builder -v $(VOLUME):/app -t $(IMAGE)

clean:
	docker rm calculator_builder

.PHONY: build clean
