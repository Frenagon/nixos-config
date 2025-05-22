{...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    monitors = [
      ", preferred, auto, 1.875"
    ];
  };
}
