{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, language-dockerfile, stdenv, turtle }:
      mkDerivation {
        pname = "docker-viz";
        version = "0.0.0.1";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [ base language-dockerfile turtle ];
        homepage = "https://github.com/yurrriq/docker-viz#readme";
        description = "Dockerfile inheritance visualizer";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
