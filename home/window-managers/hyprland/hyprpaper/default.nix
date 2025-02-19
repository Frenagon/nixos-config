{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = ["${../../../../resources/wallpaper.png}"];
        wallpaper = [",${../../../../resources/wallpaper.png}"];
      };
    };
  };
}
