{lib, ...}:
with lib; {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = mkDefault {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
