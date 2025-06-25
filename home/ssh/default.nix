{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com:Frenagon" = {
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
