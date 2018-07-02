#!/usr/bin/env sh

function build() {
	dep ensure || go get -u github.com/golang/dep/cmd/dep && dep ensure
	go vet
	go build
}

function install() {
	go install
}

function test() {
	go test .
}

function all() {
	build && install && test
}

"$@"

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"
