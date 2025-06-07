{lib, ...}:
with lib; {
  imports = [
    ./hyprland
  ];

  options.hyprland = {
    enable = mkEnableOption "Enable Hyprland";

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
