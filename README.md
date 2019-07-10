
# Do - The Simplest Build Tool on Earth

**Do** or **do.sh** [dosh] is a **build tool** and a **build file** in the same self-executing shell script.

- No installation
- No libraries
- No dependencies
- Easy to use and understand
- Easy and simple to extend
- Runs on anything with a Shell

## Why Do

There are [many build-tools](https://en.wikipedia.org/wiki/List_of_build_automation_software) that are more powerful, versatile or expressive than Do. If you are already using a well-known build tool, then keep on using it. Do is for use cases where the major build tools aren't the best fit. The second purpose of Do is to tame the complexity of usual Shell build scripts. Do wants to provide a consistent reference, interface, documentation and best practices on how to use and write build scripts. 

> Do scripts should be recognizable and understandable even if they are customized.

Some use cases where **Do** can shine are:

- A Build Tool that interact nicely with the Shell. Use **Do** to apply a consistent workflow and syntax.
- Golang's `go` already provides some build tool like functionality and most of the major build tools are too much to justify the overhead. A combination of a few commands will **Do** it.
- Building or Deploying Container Images can get out of hand quickly, **Do** can help by providing a consistent and understandable flow to build, ship and run images.
- Declarative CI/CD Build files like GitLabCI or TravisCI can become quite complex and are hard to test locally. **Do** can help here by wrapping those commands in **Do** tasks and make them locally testable. At the same time it will reduce the Build files making them easy understandable.

If you have some other use cases where **Do** can shine, open an issue or submit a PR.

## Installation

The simplest way to use `Do` is to copy and paste the content of the [`do.sh`](do.sh) file into your project and extend it as needed.

## Usage

**Do** expects one argument on what to do, If more than one argument is provided, then the following arguments are all passed on to the task. See [do.arguments.sh](examples/do.arguments.sh) in examples directory.

```sh
$ ./do.sh build
I am building
...
```

If no argument is provided **Do** prints out a help message with all the available tasks.

```sh
$ ./do.sh
Usage:
   ./do.sh (all|build|deploy|test)
```

Take also a look into the `Examples` Directory to see different use cases of **Do**.

## Concept

The concept of **Do** is simple to explain. Functions are Tasks and Tasks can be combined to new Tasks. Tasks can also accept parameters and return values.

It is possible to define as many tasks as needed. The **Do** template for defines `build, test, deploy, all` for your convenience.

```sh
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
```

In case no argument was provided the line `let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"` will print out a help message with all the available tasks in this build file.

It is important to be disciplined with **Do** and avoid adding too much complexity, which is common in the case of shell scripts. Otherwise, it would blur the simple syntax of **Do** and make it harder for others to understand the build file. In doubt [KISS](https://en.wikipedia.org/wiki/KISS_principle).

## Convenience

For your convenience you can create an alias in your `~/.zsrc|.bashrc` file

```sh
alias doo='./do.sh'
```

From now on you can type `>doo` instead of `./do.sh` The second `o`is there too not get confused with the reserved looping construct word`do`.

## Examples

The [examples](examples) directory contains a few different usage examples for `do`.

## How To Contribute

You can contribute by improving `do.sh` or by providing examples on how to use **Do** in an elegant or creative way.
Follow the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle). Don't add complexity. Don't make it bigger than needed.

Create an issue describing the problem you a trying to solve to start a discussion. Do the changes and open a merge request.

## Projects using Do

There aren't any public projects yet, If you have one open a PR to add your project here.

## Related Tools

- [Bake](https://github.com/kyleburton/bake) a pure bash project automation tool
- [Taskfile](http://taskfile.org/#/usage) a task runner / simpler Make alternative written in Go
- [Robo](https://github.com/tj/robo) Simple Go / YAML-based task runner for the team.
- [godo](https://github.com/go-godo/godo) godo is a task runner and file watcher for golang in the spirit of rake, gulp. It has kind of same name.
