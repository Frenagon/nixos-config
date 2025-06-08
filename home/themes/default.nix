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

  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "sapphire";
    gtk = mkIf (!config.windows.wsl) {
      enable = true;
      icon.enable = true;
    };
    cursors = mkIf (!config.windows.wsl) {
      enable = true;
    };
    hyprlock = mkIf (!config.windows.wsl) {
      useDefaultConfig = false;
    };
  };
}
