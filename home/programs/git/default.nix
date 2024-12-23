{lib, ...}:
with lib; {
  programs.git = {
    enable = mkDefault true;
    userName = mkDefault "Francisco Aceves";
    userEmail = mkDefault "frenagon@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    aliases = {
      undo = "reset --soft HEAD^";
    };

    delta = {
      enable = true;
      options.line-numbers = true;
    };
  };
}
