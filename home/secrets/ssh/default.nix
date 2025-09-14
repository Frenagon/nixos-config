{lib, ...}:
with lib; {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."*" = {
      forwardAgent = true;
      serverAliveInterval = 60;
      serverAliveCountMax = 3;

      extraOptions = {
        ControlMaster = "auto";
        ControlPersist = "10m";
        ControlPath = "~/.ssh/sockets/%r@%h-%p";
        HashKnownHosts = "yes";
        AddKeysToAgent = "yes";
      };
    };

    matchBlocks = {
      "github.com" = mkDefault {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
