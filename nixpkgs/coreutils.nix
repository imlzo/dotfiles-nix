{ config, lib, pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fd
    fzf
    git
    neovim
    ripgrep
    tmux
    tree
    vim
    gh
    gcc
  ];

  # vim
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/vim/vimrc;

  # git
  xdg.configFile."git".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/git;

  # tmux
  home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/tmux/tmux.conf;

  # neovim
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/nvim;
}
