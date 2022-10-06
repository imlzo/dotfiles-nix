#
# 00-config.zsh - base configuration for zsh
#

# environment {{{

export TERM='xterm-256color'
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

path=(
  # $HOME/.cargo/bin
  $HOME/.zsh/scripts
  $path
)

# }}}

# vim mode {{{

## Vi Mode Mapping
bindkey -v

## Consistent Backspace
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

## Snappier <ESC>
export KEYTIMEOUT=1

## Edit command via normal + v
autoload -Uz edit-command-line; zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# }}}

# options {{{

## colors
autoload -Uz colors && colors

## history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY

## directory nav
setopt AUTO_PUSHD		        # `cd` behaves like `pushd`
setopt PUSHD_IGNORE_DUPS		# `pushd` ignores duplicates
setopt PUSHD_SILENT		      # `pushd` is silent
setopt PUSHDMINUS		        # Use minus to specify dir stack

## completion / glob
autoload -Uz compinit && compinit -i        # ignore insecure
setopt GLOB_COMPLETE                        # Glob is useful for finding branches e.g. ls/*-topic
zmodload zsh/complist		                    # For Menu Complete
setopt AUTO_MENU		                        # MENU completion for <TAB> <TAB> in multiple-match situations
unsetopt MENU_COMPLETE		                  # Unset in favor of AUTO_MENU
setopt COMPLETE_IN_WORD		                  # <TAB> completions work in-word
_comp_options+=(globdots)	                  # Show hidden files in completion
zstyle ':completion:*:*:*:*:*' menu select						                              # Show completions in menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'	# Completions are case insensitive
zstyle ':completion:*' list-colors '${LS_COLORS}'					                          # Completion colored by type
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=29=34'

## Completion Navigation via vi keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# }}}
