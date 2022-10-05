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
  ];

  # vim
  home.file.".vimrc".source = ~/dotfiles/vim/vimrc;

  # git
  xdg.configFile."git" = {
    source = ~/dotfiles/git;
  };

  # tmux
  home.file.".tmux.conf" = {
    source = ~/dotfiles/tmux/tmux.conf;
  };
}
