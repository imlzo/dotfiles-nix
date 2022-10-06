# Makefile - Bootstrap

.PHONY: bootstrap_nvim
bootstrap_nvim:																														## bootstrap packer
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

