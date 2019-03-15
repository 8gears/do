#!/usr/bin/env sh
# Do - The Simplest Build Tool on Earth.
# Documentation and examples see https://github.com/8gears/do

set -e -u # -e "Automatic exit from bash shell script on error"  -u "Treat unset variables and parameters as errors"

build() {
   echo "I am ${FUNCNAME[0]}ing"
   exit 1
}

test() {
   echo "I am ${FUNCNAME[0]}ing"
}

deploy() {
   echo "I am ${FUNCNAME[0]}ing"
}

all() {
   build && test && deploy
}

_hidden() {
   echo "I am a hidden task and won't appear in the usage desciption because I start with an _ (underscore). If you know me you can still call me directly"
}

"$@" # <- execute the task

[ "$#" -gt 0 ] || printf "Usage:\n\t./do.sh %s\n" "($(compgen -A function | grep '^[^_]' | paste -sd '|' -))"
