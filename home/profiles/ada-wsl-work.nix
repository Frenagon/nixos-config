{...}: {
  imports = [./common.nix];

  windows.wsl = true;
  hyprland.enable = false;

  programs.git = {
    userName = "Francisco-Aceves-Imprivata";
    userEmail = "francisco.aceves@imprivata.com";
  };

  programs.ssh = {
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_imprivata";
        identitiesOnly = true;
      };
      "github-frenagon" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
