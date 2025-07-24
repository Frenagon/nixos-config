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
    ./zoxide
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
      fzf
      clipse
      procps
    ]
    ++ optionals (!config.windows.wsl) [
      # ui
      pavucontrol
      piper
      openrgb
      obsidian
      godot

      # cli
      pamixer
      libnotify
      wl-clipboard
      cliphist
      grimblast
      gdk-pixbuf
    ];

  programs = mkIf (!config.windows.wsl) {
    vivaldi.enable = true;
    google-chrome.enable = true;
  };
}
