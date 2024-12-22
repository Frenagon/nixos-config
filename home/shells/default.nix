{...}: {
  programs.bash.enable = true;

  # Extra directories to add to PATH.
  home.sessionPath = [
    "$HOME/.local/scripts"
  ];
}
