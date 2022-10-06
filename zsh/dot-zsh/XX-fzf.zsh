#
# XX-fzf.zsh    - Configuration for FZF
#

# Use fd instead of find. Snappiness = happiness
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

