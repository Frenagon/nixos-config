{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # NIX
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      nfu = "nix flake update";
      ndev = "nix develop -c $SHELL";
      shell-node = "nix shell nixpkgs#nodejs nixpkgs#pnpm nixpkgs#yarn";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
