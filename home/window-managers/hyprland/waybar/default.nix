{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = builtins.readFile ./style.css;
      settings = {
        mainBar = builtins.fromJSON (builtins.readFile ./settings.jsonc);
      };
    };
  };
}
