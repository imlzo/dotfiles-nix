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
      tree-style-tab
    ];
    profiles = {
      default = {

        # See about:config
        settings = {
          # ”signon.rememberSignons” = false;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "signon.rememberSignons" = false;
          "browser.tabs.unloadOnLowMemory" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        # See https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules
        userChrome = "
        ";
      };

    };
  };
}
