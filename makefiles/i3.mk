#
# i3.mk - Setup i3
#

.PHONY: i3_setup
i3_setup:					## Setup i3 and dependencies
	sudo dnf install i3
	sudo dnf install dunst
	sudo dnf install picom
	sudo dnf install volumeicon
	sudo dnf install brightnessctl
