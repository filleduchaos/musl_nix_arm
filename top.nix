{ nixpkgs }:

rec {
  inherit nixpkgs;

  # Some native build tools.
  native = import ./native { inherit nixpkgs; };

  # Cross-compiling environments for each target system.
  crossenvs = {
    armv6-linux-musl = import ./linux {
      inherit native;
      arch = "armv6";
      gcc_options = "--with-fpu=vfp --with-float=hard ";
    };
    armv7-linux-musl = import ./linux {
      inherit native;
      arch = "armv7";
      gcc_options = "--with-fpu=neon --with-float=hard ";
    };
    aarch64-linux-musl = import ./linux {
      inherit native;
      arch = "aarch64";
      gcc_options = "--with-fpu=neon --with-float=hard ";
    };
  };

  pkgFun = crossenv: import ./pkgs.nix { inherit crossenv; } // crossenv;

  # Sets of packages for each target system.
  armv6-linux-musl = pkgFun crossenvs.armv6-linux-musl;
  armv7-linux-musl = pkgFun crossenvs.armv6-linux-musl;
  aarch64-linux-musl = pkgFun crossenvs.armv6-linux-musl;

  # Handy aliases.
  rpi = armv6-linux-musl;
  rpi2 = armv7-linux-musl;
  rpi3 = aarch64-linux-musl;

  # filter is a function that can be applied to a local directory to filter out
  # files that are likely to change frequently without affecting the build,
  # causing unneeded rebuilds.
  filter_func = name: type: let bn = baseNameOf (toString name); in !(
    (type == "directory" && bn == ".git") ||
    (type == "symlink" && nixpkgs.lib.hasPrefix "result" bn) ||
    (type == "directory" && bn == "nix") ||
    (type == "directory" && bn == "build") ||
    nixpkgs.lib.hasSuffix ".nix" bn ||
    nixpkgs.lib.hasSuffix "~" bn
  );
  filter = builtins.filterSource filter_func;

  # bundle is a function that can take a set of derivations
  bundle = drvs: native.make_derivation rec {
    name = "bundle";
    builder = ./bundle_builder.sh;
    names = builtins.attrNames drvs;
    dirs = builtins.attrValues drvs;
  };
}
