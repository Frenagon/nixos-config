{...}: {
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--sort=ext"
      "--sort=name"
      "--group-directories-first"
    ];
  };
}
