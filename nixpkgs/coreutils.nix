{ config, lib, pkgs, ...}:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    adrgen
    bat
    fd
    fzf
    gcc
    gh
    git
    htop
    neovim
    openssl
    pstree
    ripgrep
    starship
    tmux
    tree
    vim
    zoxide
    # zsh
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
  ];

  # vim
  home.file.".vimrc".source = symlink ~/dotfiles/vim/vimrc;

  # git
  xdg.configFile."git".source = symlink ~/dotfiles/git;

  # tmux
  home.file.".tmux.conf".source = symlink ~/dotfiles/tmux/tmux.conf;

  # neovim
  xdg.configFile."nvim".source = symlink ~/dotfiles/nvim;

  # zsh
  home.file.".zshrc".source = symlink ~/dotfiles/zsh/zshrc;
  home.file.".zsh".source = symlink ~/dotfiles/zsh/dot-zsh;

  # starship
  xdg.configFile."starship.toml".source = symlink ~/dotfiles/starship/starship.toml;

  # ssh
  home.file.".ssh/config".source = symlink ~/dotfiles/ssh/config;

}
