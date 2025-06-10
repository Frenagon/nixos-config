{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "shell-node" = "nix shell nixpkgs#nodejs nixpkgs#pnpm nixpkgs#yarn";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
