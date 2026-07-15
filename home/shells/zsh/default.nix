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

    initContent = ''
      if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
        exec tmux new-session -A -s 0-terminal
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
