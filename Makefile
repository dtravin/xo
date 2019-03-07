REGISTRY := gcr.io/scale-devops
BINARY := xo
TAG := $(shell git describe --abbrev=0 --tags)

BASE_DOCKER_TAG := ${REGISTRY}/${BINARY}

DOCKER_TAG_LATEST := ${BASE_DOCKER_TAG}:latest
DOCKER_TAG := ${BASE_DOCKER_TAG}:${TAG}

build: 
	docker build --rm=true -t ${DOCKER_TAG_LATEST} -t ${BUILD_TIMESTAMP} -f Dockerfile .

push: build
	docker push ${DOCKER_TAG_LATEST}
