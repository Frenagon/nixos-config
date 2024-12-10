{...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    monitors = [
      ", highrr, auto, 1.8"
    ];
  };
}
