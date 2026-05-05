{...}: {
  home.file = {
    ".local/scripts".source = ./scripts;
    ".local/data".source = ./data;
  };

  home.sessionPath = [
    "$HOME/.local/scripts"
  ];
}
