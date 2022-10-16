
# zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING="$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f "$ZSH_SYNTAX_HIGHLIGHTING" ]; then
  source "$ZSH_SYNTAX_HIGHLIGHTING"
fi

# zsh-autosuggestions
ZSH_AUTOSUGGESTIONS="$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f "$ZSH_AUTOSUGGESTIONS" ]; then
  source "$ZSH_AUTOSUGGESTIONS"
fi


