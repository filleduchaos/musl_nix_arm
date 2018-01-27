#!/bin/bash

build() {
  nix-build -A "$1"
  cp result/bin/calculator "bin/calculator_$1"
  rm -rf result
}

mkdir -p bin

build armv6
build armv7
build aarch64
