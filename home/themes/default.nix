{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  gtk = mkIf (!config.windows.wsl) {
    enable = true;

    theme = {
      package = pkgs.magnetic-catppuccin-gtk;
      name = "Catppuccin-GTK-Dark";
    };

    iconTheme = lib.mkDefault {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
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
    cursors = mkIf (!config.windows.wsl) {
      enable = true;
    };
    hyprlock = mkIf (!config.windows.wsl) {
      useDefaultConfig = false;
    };
  };
}
