#
# XX-zoxide.zsh - Configuration for zoxide
#

# Initialize zsh with j command prefix
command -v zoxide >/dev/null \
  && eval "$(zoxide init zsh --cmd j)"
