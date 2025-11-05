{...}: {
  imports = [./common.nix];

  windows.wsl = true;
  hyprland.enable = false;

  programs.git.settings.user = {
    name = "Francisco-Aceves-Imprivata";
    email = "francisco.aceves@imprivata.com";
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
