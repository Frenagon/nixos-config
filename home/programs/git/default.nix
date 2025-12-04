{lib, ...}:
with lib; {
  programs.git = {
    enable = mkDefault true;

    settings = {
      user = {
        name = mkDefault "Francisco Aceves";
        email = mkDefault "frenagon@gmail.com";
      };

      init.defaultBranch = "main";
      fetch = {
        prune = true;
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      core.editor = "nvim";
      diff.tool = "nvimdiff";
      merge.tool = "nvimdiff";

      alias = {
        undo = "reset --soft HEAD^";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      tabs = 2;
    };
  };

  programs.lazygit.enable = true;
}
