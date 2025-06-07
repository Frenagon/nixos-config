{
  lib,
  config,
  ...
}:
with lib; {
  services.dunst = mkIf (!config.windows.wsl) {
    enable = true;
    settings = {
      global = {
        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus-Dark";
      };
    };
  };
}
