{ pkgs, ...}:
let
  nur = import <nur> { inherit pkgs; };
in {
  programs.firefox = {
    enable = true;
    extensions = with nur.repos.rycee.firefox-addons; [
      vimium
      onepassword-password-manager
      rust-search-extension
    ];
    profiles = {
      default = {
        settings = {
          # ”signon.rememberSignons” = false;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "signon.rememberSignons" = false;
          "browser.tabs.unloadOnLowMemory" = true;
        };
      };

    };
  };
}
