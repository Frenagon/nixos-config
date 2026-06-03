{pkgs, ...}: let
  monitor-lid-toggle = pkgs.writeShellScriptBin "monitor-lid-toggle" ''
    # Script to manage monitor based on lid state
    LID_STATE=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')

    if [ "$LID_STATE" == "closed" ]; then
        hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
    else
        hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = "1.875" })'
    fi
  '';
in {
  imports = [./common.nix];

  home.packages = [monitor-lid-toggle];

  # TODO: Find a way to move monitor configuration to a separate file and import it here, so that it can be reused across different profiles

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
  };
}
