{config, ...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    monitors = [
      "eDP-1, preferred, auto, 1.875"
      "DP-3, 3440x1440@60, auto, 1.25"
    ];
  };

  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", switch:on:Lid Switch, exec, hyprctl keyword monitor 'eDP-1, disable'"
      ", switch:off:Lid Switch, exec, hyprctl keyword monitor '${builtins.elemAt config.hyprland.monitors 0}'"
    ];
  };
}
