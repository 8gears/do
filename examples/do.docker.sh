#!/usr/bin/env sh

IMAGE_NAME="registry.8gears.com/hello-world"
TAG="${CI_COMMIT_TAG:-latest}"  

function build() {
	docker build -t ${IMAGE_NAME}:TAG .
}

function test() {
	docker build -t ${IMAGE_NAME}:candidate .
}

function deploy() {
	docker push ${IMAGE_NAME}:${TAG}
}

function all() {
	build && test && deploy
}

"$@"

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"
