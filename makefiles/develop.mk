#
# Makefile - Development Setups

.PHONY: develop_web
develop_web:																															## Setup web development
	command -v nvm >/dev/null || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	# nvm install node
	npm install --global typescript-language-server typescript
	npm install --global vscode-langservers-extracted
	npm install --global yarn

