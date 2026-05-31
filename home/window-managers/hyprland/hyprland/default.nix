{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.hyprland;
  hyprConfig = "${config.home.homeDirectory}/.nixos-config/home/window-managers/hyprland/lua/hyprland.lua";
in {
  config = mkIf cfg.enable {
    programs = {
      zsh = {
        profileExtra = ''
          if uwsm check may-start && uwsm select; then
            exec uwsm start default
          fi
        '';
      };
    };

    home.packages = with pkgs; [
      uwsm
      hyprpicker
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
    };

    home.file.".local/share/hypr/stubs".source = "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/share/hypr/stubs";
    xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprConfig;
  };
}
