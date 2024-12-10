{...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    nvidiaPatches = true;
    monitors = [
      "DP-3, highrr, 0x0, 1.25"
      "DP-1, highrr, 2752x-448, 1.25, transform, 3"
      "HDMI-A-1, disable, 3904x0, 1.875"
    ];
  };
}
