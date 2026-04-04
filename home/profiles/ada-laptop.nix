{
  pkgs,
  config,
  ...
}: let
  fprintd-toggle = pkgs.writeShellScriptBin "fprintd-toggle" ''
    if [ "$1" = "close" ]; then
      # Requires sudo/polkit because fprintd is a system service
      sudo systemctl stop fprintd
      sudo systemctl mask fprintd
    elif [ "$1" = "open" ]; then
      sudo systemctl unmask fprintd
      sudo systemctl start fprintd
    fi
  '';
in {
  imports = [./common.nix];

  home.packages = [fprintd-toggle];

  hyprland = {
    enable = true;
    wallpapers = [
      {
        monitor = "eDP-1";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "DP-1";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "DP-3";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
    ];
    monitors = [
      "eDP-1, preferred, auto, 1.875"
      "DP-1, 3440x1440@60, auto, 1.25"
      "DP-3, 3440x1440@60, auto, 1.25"
    ];
  };

  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", switch:on:Lid Switch, exec, hyprctl keyword monitor 'eDP-1, disable'"
      ", switch:on:Lid Switch, exec, fprintd-toggle close"
      ", switch:off:Lid Switch, exec, hyprctl keyword monitor '${builtins.elemAt config.hyprland.monitors 0}'"
      ", switch:off:Lid Switch, exec, fprintd-toggle open"
    ];
  };
}
