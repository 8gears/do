#!/usr/bin/env sh
# Do - The Simplest Build Tool on Earth.
# Documentation and examples see https://github.com/8gears/do

set -e -u # -e "Automatic exit from bash shell script on error"  -u "Treat unset variables and parameters as errors"

IMAGE_NAME="registry.8gears.com/hello-world"
TAG="${CI_COMMIT_TAG:-latest}"

build() {
   docker build -t ${IMAGE_NAME}:TAG .
}

test() {
   docker build -t ${IMAGE_NAME}:candidate .
}

deploy() {
   docker push ${IMAGE_NAME}:${TAG}
}

all() {
   build && test && deploy
}

"$@" # <- execute the task

[ "$#" -gt 0 ] || printf "Usage:\n\t./do.sh %s\n" "($(compgen -A function | grep '^[^_]' | paste -sd '|' -))"
