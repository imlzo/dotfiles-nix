# Makefile - Nvim

.PHONY: nvim_bootstrap
nvim_bootstrap:							## bootstrap nvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

