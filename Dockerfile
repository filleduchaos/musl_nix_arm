FROM nixos/nix:latest
LABEL maintainer="PJ Essien <princess-jewel.essien@andela.com>"

RUN apk update && apk upgrade
RUN apk add bash

RUN mkdir -p /opt/nixcrpkgs
COPY . /opt/nixcrpkgs
WORKDIR /opt/nixcrpkgs

RUN nix-build -A rpi.hello
RUN nix-build -A rpi2.hello
RUN nix-build -A rpi3.hello

ENV NIX_PATH=$NIX_PATH:nixcrpkgs=/opt/nixcrpkgs
