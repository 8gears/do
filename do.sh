#!/usr/bin/env sh -eu
# Do - The Simplest Build Tool on Earth.
# Documentation and examples see https://github.com/8gears/do

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

function _hidden() {
	echo "I am a hidden task and won't appear in the usage desciption because I start with an _ (underscore). If you know me you can still call me directly"
}

"$@" # <- execute the task

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | grep ^[^_] | paste -sd '|' -))"
