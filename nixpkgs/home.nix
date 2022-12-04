{ config, pkgs, ... }:
{
  home.username = "imlzo";
  home.homeDirectory = "/home/imlzo";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;

  imports = [
    # Base
    ./coreutils.nix

    # Device
    ./linux.nix

    # Layers
    ./rust.nix
    ./elixir.nix
    ./wasm.nix
  ];

}
