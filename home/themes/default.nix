{
  lib,
  config,
  ...
}:
with lib; {
  gtk = mkIf (!config.windows.wsl) {
    enable = true;
  };

  qt = mkIf (!config.windows.wsl) {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin = mkIf (!config.windows.wsl) {
    enable = true;
    gtk = {
      enable = true;
      icon.enable = true;
    };
    flavor = "macchiato";
    accent = "sapphire";
    cursors = {
      enable = true;
    };
    hyprlock = {
      useDefaultConfig = false;
    };
  };
}
