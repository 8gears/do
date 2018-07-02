#!/usr/bin/env sh
# Do - The Simplest Build Tool on Earth. See https://github.com/8gears/do

function build() {
	echo "I am ${FUNCNAME[0]}ing"
}

#
# >/do.arguments.sh test a b c
# I am testing with Arg 1=a Arg 2=b and Arg 3=c
function test() {
	echo "I am ${FUNCNAME[0]}ing with Arg 1=$1 Arg 2=$2 and Arg 3=$3"
}

function deploy() {
	echo "I am ${FUNCNAME[0]}ing"
}

function all() {
	build && test && deploy
}

"$@"

let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"
