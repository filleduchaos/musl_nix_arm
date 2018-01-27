# musl_nix_arm

Docker image for building portable C and C++ applications for ARM Linux systems
using musl libc, with the build process managed by [nixcrpkgs](https://github.com/DavidEGrayson/nixcrpkgs) (credit to
[David Grayson](https://github.com/DavidEGrayson)).

The image comes with toolchains for `armv6`, `armv7` (both hard-float) and `aarch64`
pre-built.

## Usage

There's a demonstrative C application in the `example` folder.

Also it would be a great idea to check out nixcrpkgs' README.

(proper documentation coming soon :) )

## Developing

`make` will build and tag an image

`make run` will launch an interactive Bash shell

Make sure to set the DOCKER_USER environment variable for proper namespacing!
