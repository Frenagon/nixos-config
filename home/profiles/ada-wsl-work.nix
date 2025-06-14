{...}: {
  imports = [./common.nix];

  windows.wsl = true;
  hyprland.enable = false;

  programs.git = {
    userName = "Francisco-Aceves-Imprivata";
    userEmail = "francisco.aceves@imprivata.com";
  };
}
