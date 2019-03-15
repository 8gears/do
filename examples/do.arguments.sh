#!/usr/bin/env sh
# Do - The Simplest Build Tool on Earth.
# Documentation and examples see https://github.com/8gears/do

set -e -u # -e "Automatic exit from bash shell script on error"  -u "Treat unset variables and parameters as errors"

#
# >/do.arguments.sh show a b c
# I am showing with Arg 1=a Arg 2=b and Arg 3=c
show() {
   echo "I am ${FUNCNAME[0]}ing with Arg 1=$1 Arg 2=$2 and Arg 3=$3"
}

"$@" # <- execute the task

[ "$#" -gt 0 ] || printf "Usage:\n\t./do.sh %s\n" "($(compgen -A function | grep '^[^_]' | paste -sd '|' -))"
