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
        settings = {
          # ”signon.rememberSignons” = false;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "signon.rememberSignons" = false;
          "browser.tabs.unloadOnLowMemory" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        userChrome = "
          #tabbrowser-tabs {
            visibility: collapse !important;
          }

          #titlebar {
            appearance: none !important;
            height: 0px;
          }

          #titlebar > #toolbar-menubar {
            margin-top: 0px;
          }

          #TabsToolbar {
            min-width: 0 !important;
            min-height: 0 !important;
          }

          #TabsToolbar > .titlebar-buttonbox-container {
            display: block;
            position: absolute;
            top: 12px;
            left: 0px;
          }
        ";
      };

    };
  };
}
