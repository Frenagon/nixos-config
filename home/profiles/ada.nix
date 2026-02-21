{...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    nvidiaPatches = true;
    wallpapers = [
      {
        monitor = "DP-1";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "DP-3";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "HDMI-A-1";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
      {
        monitor = "";
        path = "${../../resources/wallpapers/cat-blue-eye.png}";
      }
    ];
    monitors = [
      "DP-3, highrr, 0x0, 1.25"
      "DP-1, highrr, 2752x-448, 1.25, transform, 3"
      "HDMI-A-1, disable, 3904x0, 1.875"
    ];
  };
}
