{...}: {
  imports = [
    ./starship
    ./zsh
  ];

  programs.bash.enable = true;
  programs.direnv.enable = true;
}
