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
  symlink = config.lib.file.mkOutOfStoreSymlink;
in {
  targets.genericLinux.enable = true;

  home.packages = with pkgs; [
    _1password-gui
    xclip
    powerline-fonts
    fira
    fira-mono
    fira-code-symbols
    perl # needed for cargo-web
    inotify-tools
  ];

  # alacritty
  xdg.configFile.alacritty.source = symlink ~/dotfiles/alacritty;
  programs.alacritty = {
    enable = true;
    package = nixGLWrap pkgs.alacritty;
  };

  # sway
  xdg.configFile.sway.source = symlink ~/dotfiles/sway;

  # env
  xdg.configFile."environment.d/10-user-path.conf".source = symlink ~/dotfiles/env/10-user-path.conf;

}
