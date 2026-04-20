{
  pkgs,
  config,
  ...
}: let
  monitor-lid-toggle = pkgs.writeShellScriptBin "monitor-lid-toggle" ''
    # Script to manage monitor based on lid state
    LID_STATE=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')

    if [ "$LID_STATE" == "closed" ]; then
        hyprctl keyword monitor 'eDP-1, disable'
    else
        hyprctl keyword monitor '${builtins.elemAt config.hyprland.monitors 0}'
    fi
  '';
in {
  imports = [./common.nix];

  home.packages = [monitor-lid-toggle];

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
    exec = ["monitor-lid-toggle"];

    bindl = [", switch:Lid Switch, exec, monitor-lid-toggle"];
  };
}
