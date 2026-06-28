{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar;
      style = builtins.readFile ./style.css;
      settings = {
        mainBar = builtins.fromJSON (builtins.readFile ./settings.jsonc);
      };
    };
  };
}
