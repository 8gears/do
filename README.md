# Do - The Simplest Build Tool on Earth

**Do** is a Build Tool and Build File in one single Shell script.

No installation, no libraries, no dependencies. Easy to use, easy to understand and simple to extend.
Runs on anything that has a Shell.

## Why Do

There are [many build-tools](https://en.wikipedia.org/wiki/List_of_build_automation_software) that are more powerful, versatile and expressive then **Do**. Usually you should be fine with one of the major Build Tools.

However there are some use cases where major Build Tools aren't the best fit. Here are some cases:

-  You want a Build Tool that interact nicely with the Shell. Use **Do** to have a consistent workflow and Syntax.
-  Golangs `go` already provides some build tool like functionality and most of the major build tools are too much to justify the overhead. A combination of a few Shell commands will **Do** it.
-  Building or Deploying Container Images can get out of hand quickly, **Do** can help by providing a consistent and understandable flow to build, ship and run images.
-  Declarative CI/CD Build files like GitLabCI or TravisCI can become quite complex and are hard to test locally. **Do** can help here by wrapping those commands in **Do** functions and make them locally testable. At the same time it will reduce the Build files making them easy understandable.

## Concept

The concept of **Do** is simple to explain. Functions are Tasks and Tasks can be combined to new Tasks. Tasks also accept parameters or environment variables.
It is important to be disciplined with **Do** and not add too much complexity, which is common in the case of shell scripts. Otherwise it would blur the simple syntax of **Do** and make it harder for others to understand the build file. In doubt [KISS](https://en.wikipedia.org/wiki/KISS_principle).

## Usage

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

## Installation

The simplest way to use `Do` is to copy and paste the `do.sh` code into your project and extend it as needed.

## How To Contribute

You can contribute by improving `do.sh` or by providing examples on how to use **Do** in an elegant or creative way.
Follow the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle). Don't add complexity. Don't make it bigger then needed.

Create an issue describing the problem you a trying to solve to start a discussion. Do the changes and open a merge request.

## Other Known Tools

-  [Bake](https://github.com/kyleburton/bake) a pure bash project automation tool
