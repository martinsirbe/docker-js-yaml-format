APP := docker-js-yaml-format
JS_YAML_VERSION := "3.13.1"
GIT_COMMIT_HASH := $(shell git rev-list -1 HEAD)
GIT_SHORT_COMMIT_HASH := $(shell git rev-parse --short $(GIT_COMMIT_HASH))

.PHONY: build
build:
	docker build --build-arg JS_YAML_VERSION=$(JS_YAML_VERSION) \
	    -t $(APP):$(GIT_SHORT_COMMIT_HASH) \
	    -t martinsirbe/$(APP):$(GIT_SHORT_COMMIT_HASH) \
	    -t martinsirbe/$(APP):latest \
	    -t docker.pkg.github.com/martinsirbe/$(APP)/$(APP):$(GIT_SHORT_COMMIT_HASH) \
	    -t docker.pkg.github.com/martinsirbe/$(APP)/$(APP):latest \
	    -f Dockerfile .

.PHONY: run
run:
	docker run --rm -v "$$PWD":/src -w /src $(APP):$(GIT_SHORT_COMMIT_HASH) openapi.yaml > formatted-openapi.yaml
