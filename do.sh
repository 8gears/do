#!/usr/bin/env sh

IMAGE_NAME="registry.8gears.com/hello-world"

function build() {
	echo "I am ${FUNCNAME[ 0 ]}ing"
}

function test() {
	echo "I am ${FUNCNAME[ 0 ]}ing"
}

function deploy() {
	echo "I am ${FUNCNAME[ 0 ]}ing"
}

function all() {
	build && test && deploy
}

"$@"

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"
