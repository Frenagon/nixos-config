{...}: {
  imports = [./common.nix];

  hyprland = {
    enable = true;
    nvidiaPatches = true;
  };
}
