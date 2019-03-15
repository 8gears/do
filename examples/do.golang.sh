#!/usr/bin/env sh
# Do - The Simplest Build Tool on Earth.
# Documentation and examples see https://github.com/8gears/do

set -e -u # -e "Automatic exit from bash shell script on error"  -u "Treat unset variables and parameters as errors"

build() {
   dep ensure || go get -u github.com/golang/dep/cmd/dep && dep ensure
   go vet
   go build
}

install() {
   go install
}

test() {
   go test .
}

all() {
   build && install && test
}

"$@" # <- execute the task

[ "$#" -gt 0 ] || printf "Usage:\n\t./do.sh %s\n" "($(compgen -A function | grep '^[^_]' | paste -sd '|' -))"
