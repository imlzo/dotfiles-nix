{ config, pkgs, ... }:
{
  home.username = "imlzo";
  home.homeDirectory = "/home/imlzo";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;

  imports = [
    ./coreutils.nix
    ./linux.nix
  ];

}
