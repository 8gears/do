#!/usr/bin/env sh -eu
# Do - The Simplest Build Tool on Earth. See https://github.com/8gears/do

function build() {
	echo "I am ${FUNCNAME[0]}ing"
}

function test() {
	echo "I am ${FUNCNAME[0]}ing"
}

function deploy() {
	echo "I am ${FUNCNAME[0]}ing"
}

function all() {
	build && test && deploy
}

"$@"

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"
