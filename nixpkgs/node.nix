{ config, lib, pkgs, ...}:
let
  extraNodePackages = import ./node/default.nix {};
in
{
  home.packages = with pkgs; [
    extraNodePackages.typescript
    extraNodePackages.typescript-language-server
    extraNodePackages.vscode-langservers-extracted
    extraNodePackages.yarn
  ];
}
