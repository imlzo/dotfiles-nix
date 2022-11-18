#
# XX-adrgen.zsh - ZSH config for adrgen
#

if [ -n "${commands[adrgen]}" ]; then
  source <(adrgen completion zsh)
  compdef _adrgen adrgen
fi

