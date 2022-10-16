#
# nvim.mk - Makefile for nvim
#

.PHONY: nvim_setup
nvim_setup:							## setup nvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2>/dev/null

