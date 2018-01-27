USERNAME=$(DOCKER_USER)
NAME=musl_nix_arm
IMAGE=$(USERNAME)/$(NAME)
TAG=`cat .release`

default: build

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push: build
	docker push $(IMAGE)

run: build
	docker run --rm -it $(IMAGE) /bin/bash

release: build push

.PHONY: build push run release
