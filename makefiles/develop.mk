#
# Makefile - Development Setups

.PHONY: nix_node2nix
nix_node2nix:																															## Run node2nix to update node-packages.nix
	(cd $(HOME)/dotfiles/nixpkgs/node/; \
		nix-shell -p nodePackages.node2nix --command "node2nix -i node-packages.json")

