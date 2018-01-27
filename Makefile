USERNAME=$(DOCKER_USER)
NAME=musl_nix_arm
IMAGE=$(USERNAME)/$(NAME)
TAG=`cat .release`

default: build

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push:
	docker push $(IMAGE)

run:
	docker run --rm -it $(IMAGE) /bin/bash

release: build push

.PHONY: build push run release
