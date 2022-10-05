{ config, lib, pkgs, ...}:
let
  nixgl = import <nixgl> {};
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
       wrapped_bin=$out/bin/$(basename $bin)
       echo "exec ${lib.getExe nixgl.nixGLIntel} $bin \$@" > $wrapped_bin
       chmod +x $wrapped_bin
      done
    '';
in {
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    _1password-gui
    firefox
    xclip
  ];

  # alacritty
  # xdg.configFile.alacritty.source = ~/dotfiles/alacritty;
  programs.alacritty = {
    enable = true;
    package = nixGLWrap pkgs.alacritty;
  };

}
