
NIX_CONFIG_TGT_DIR:="$(HOME)/.config/nix"
NIX_CONFIG_SRC_DIR:="$(HOME)/dotfiles/nix"

NIXPKGS_TGT_DIR:="$(HOME)/.config/nixpkgs"
NIXPKGS_SRC_DIR:="$(HOME)/dotfiles/nixpkgs"

# Reference: https://nixos.org/manual/nix/stable/installation/installing-binary.html#linux
.PHONY: nix_install
nix_install:	## Install nix (multi-user)
	test -f /etc/bash.bashrc.backup-before-nix && sudo rm -rf /etc/bash.bashrc.backup-before-nix || true
	test -f /etc/bashrc.backup-before-nix && sudo rm -rf /etc/bashrc.backup-before-nix || true
	test -f /etc/profile.d/nix.sh.backup-before-nix	&& sudo rm -rf /etc/profile.d/nix.sh.backup-before-nix || true
	test -f /etc/zshrc.backup-before-nix	&& sudo rm -rf /etc/zshrc.backup-before-nix || true
	command -v nix >/dev/null || \
		sh <(curl -L https://nixos.org/nix/install) --daemon

.PHONY: nix_setup
nix_setup: 	## setup nix (after installation)
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
	nix-channel --update
	nix-shell '<home-manager>' -A install

	# Setup symlinks
	[ -e $(NIX_CONFIG_TGT_DIR) ] || ln -s $(NIX_CONFIG_SRC_DIR) $(NIX_CONFIG_TGT_DIR) || true
	[ -e $(NIXPKGS_TGT_DIR) ] || ln -s $(NIXPKGS_SRC_DIR) $(NIXPKGS_TGT_DIR) || true
