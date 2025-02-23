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
        preload = ["${../../../../resources/wallpapers/cat-blue-eye.png}"];
        wallpaper = [",${../../../../resources/wallpapers/cat-blue-eye.png}"];
      };
    };
  };
}
