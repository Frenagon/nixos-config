{...}: {
  imports = [
    ./starship
  ];

  programs.bash.enable = true;
  programs.zsh.enable = true;

  # Extra directories to add to PATH.
  home.sessionPath = [
    "$HOME/.local/scripts"
  ];
}
