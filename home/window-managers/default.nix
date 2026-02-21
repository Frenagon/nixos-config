{lib, ...}:
with lib; {
  imports = [
    ./hyprland
  ];

  options.hyprland = {
    enable = mkEnableOption "Enable Hyprland";

    wallpapers = mkOption {
      default = [
        {
          monitor = "";
          path = "${../../resources/wallpapers/cat-blue-eye.png}";
        }
      ];
      description = "Array of wallpaper configurations";
    };

    monitors = mkOption {
      default = [",preferred,auto,auto"];
      description = "Array of monitor configurations";
    };

    nvidiaPatches = mkOption {
      default = false;
      description = "Add Nvidia environment variables";
    };
  };
}
