#
# sway.mk - Setup for Sway
#

.PHONY: sway_setup
sway_setup: ## Setup sway
	sudo dnf install sway
	sudo dnf install light
	sudo dnf install wlsunset
