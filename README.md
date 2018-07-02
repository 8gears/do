# Do - The Simplest Build Tool on Earth

**Do** is a Build Tool and Build File in one single self executable Shell script.

-  No installation
-  No libraries
-  No dependencies
-  Easy to use
-  Easy to understand
-  Simple to extend
-  Runs on anything with a Shell

## Why Do

There are [many build-tools](https://en.wikipedia.org/wiki/List_of_build_automation_software) that are more powerful, versatile and expressive then **Do**. Usually you should be fine with one of the major Build Tools. The second purpose of **Do** is to tame the uncontrolled growth and complexity of Shell build scripts. By providing consistent interfaces, documentation, reference and best practices on how to use and build **Do** scripts. It should be possible to make **Do** scripts recognizable and understandable even if they are customized.

In some use cases the major Build Tools aren't the best fit or need some sort of an extension. Here are some use cases where **Do** can shine:

-  You want a Build Tool that interact nicely with the Shell. Use **Do** to apply a consistent workflow and syntax.
-  Golangs `go` already provides some build tool like functionality and most of the major build tools are too much to justify the overhead. A combination of a few Shell commands will **Do** it.
-  Building or Deploying Container Images can get out of hand quickly, **Do** can help by providing a consistent and understandable flow to build, ship and run images.
-  Declarative CI/CD Build files like GitLabCI or TravisCI can become quite complex and are hard to test locally. **Do** can help here by wrapping those commands in **Do** functions and make them locally testable. At the same time it will reduce the Build files making them easy understandable.

If you have some other use cases where **Do** can shine, open an issue or submit a PR.

## Installation

The simplest way to use `Do` is to copy and paste the `do.sh` code into your project and extend it as needed.

## Usage

**Do** expects one argument on what to do. If more then one argument is provided they are passed on to the task.

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
```

In case no argument was provided the line `let $# || echo "Usage:\n\t./do.sh ($(compgen -A function | paste -sd '|' -))"` will prints out a help message with all the available tasks in this build file.

It is important to be disciplined with **Do** and avoid adding too much complexity, which is common in the case of shell scripts. Otherwise it would blur the simple syntax of **Do** and make it harder for others to understand the build file. In doubt [KISS](https://en.wikipedia.org/wiki/KISS_principle).

## How To Contribute

You can contribute by improving `do.sh` or by providing examples on how to use **Do** in an elegant or creative way.
Follow the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle). Don't add complexity. Don't make it bigger then needed.

Create an issue describing the problem you a trying to solve to start a discussion. Do the changes and open a merge request.

## Projects using Do

There aren't any public projects yet, If you have one open a PR to add your project here.

## Other Known Tools

-  [Bake](https://github.com/kyleburton/bake) a pure bash project automation tool
