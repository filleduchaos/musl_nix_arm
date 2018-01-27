FROM nixos/nix:latest
LABEL maintainer="PJ Essien <princess-jewel.essien@andela.com>"

RUN apk update && apk upgrade
RUN apk add bash file

RUN mkdir /musl_nix_arm
ADD . /musl_nix_arm
WORKDIR /musl_nix_arm

RUN nix-build -A rpi.hello
RUN nix-build -A rpi2.hello
RUN nix-build -A rpi3.hello
