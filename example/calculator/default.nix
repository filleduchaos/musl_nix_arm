rec {
  nixcrpkgs = import <nixcrpkgs>;
  build = env: env.make_derivation rec {
    src_file = ./src/calculator.c;
    builder = ./nix/builder.sh;
  };
  armv6 = build nixcrpkgs.rpi;
  armv7 = build nixcrpkgs.rpi2;
  aarch64 = build nixcrpkgs.rpi3;
}
