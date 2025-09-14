{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  services.dunst = mkIf (!config.windows.wsl) {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    settings = {
      global = {
        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus-Dark";
      };
    };
  };
}
