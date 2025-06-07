{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./bat
    ./dunst
    ./eza
    ./git
    ./kitty
    ./neovim
    ./rofi
  ];

  home.packages = with pkgs;
    [
      # cli
      neofetch
      tree
      unzip
      jq
      file
      fd
      clipse
    ]
    ++ optionals (!config.windows.wsl) [
      # ui
      pavucontrol
      obsidian
      godot

      # cli
      pamixer
      libnotify
      wl-clipboard
      cliphist
      grimblast
    ];

  programs = mkIf (!config.windows.wsl) {
    vivaldi.enable = true;
    google-chrome.enable = true;
  };
}
