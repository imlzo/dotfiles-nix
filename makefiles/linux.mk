#
# linux.mk - Setup for linux
#

.PHONY: remap_capslock
remap_capslock:			## Remap capslock (linux)
	command -v gsettings && gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']" || true
	command -v setxkbmap && setxkbmap -option caps:ctrl_modifier || true



