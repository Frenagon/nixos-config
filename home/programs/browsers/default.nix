{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  flavour = "Macchiato";
  accent = "Sapphire";
  themePath = "${inputs.catppuccin-zen}/themes/${flavour}/${accent}";
  enableGUI = !config.windows.wsl;
in
  with lib; {
    programs = mkIf enableGUI {
      vivaldi.enable = true;
      google-chrome.enable = true;
      zen-browser = {
        enable = true;
        nativeMessagingHosts = with pkgs; [libnotify];
        profiles.default = {
          isDefault = true;
          settings."toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          userChrome = builtins.readFile "${themePath}/userChrome.css";
          userContent = builtins.readFile "${themePath}/userContent.css";
          path = "default";
        };
      };
    };

    home.file.".zen/default/chrome/zen-logo.svg" = mkIf enableGUI {
      source = "${themePath}/zen-logo-${toLower flavour}.svg";
    };
  }
