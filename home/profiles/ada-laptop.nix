{...}: {
  imports = [./common.nix];

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
