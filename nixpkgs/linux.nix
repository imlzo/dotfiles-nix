{ config, lib, pkgs, ...}:
{
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    _1password-gui
    firefox
    xclip
  ];


}
