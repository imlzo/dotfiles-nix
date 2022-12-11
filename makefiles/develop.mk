#
# Makefile - Development Setups
#

SHELL := /bin/bash

.PHONY: develop_web
develop_web:																															## Install web dependencies
	command -v nvm >/dev/null || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	export NVM_DIR="$(HOME)/.nvm"
	[ -s "$(NVM_DIR)/nvm.sh" ] && \. "$(NVM_DIR)/nvm.sh"  # This loads nvm
	[ -s "$(NVM_DIR)/bash_completion" ] && \. "$(NVM_DIR)/bash_completion"  # This loads nvm bash_completion
	nvm install node
	npm install --global typescript-language-server typescript
	npm install --global vscode-langservers-extracted
	npm install --global yarn

