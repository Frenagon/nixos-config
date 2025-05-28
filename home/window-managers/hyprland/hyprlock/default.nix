{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        background = [
          {
            path = "${./background.jpg}";
          }
        ];
      };
    };
  };
}
