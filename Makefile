.PHONY: build
build: default.nix
	@ nix-build


default.nix: docker-viz.cabal
	@ nix-shell -p cabal2nix --run "cabal2nix --shell . >$@"
	@ echo "generated $@"


docker-viz.cabal: package.yaml
	@ nix-shell -p haskellPackages.hpack --run hpack
