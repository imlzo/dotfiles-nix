{ config, lib, pkgs, ...}:
{
  home.packages = with pkgs; [
    nvm
    # nodePackages.typescript
    # nodePackages.typescript-language-server
  ];
}
