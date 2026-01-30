{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [
    ./bat
    ./browsers
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
      usbutils
    ]
    ++ optionals (!config.windows.wsl) [
      # ui
      pavucontrol
      piper
      openrgb
      obsidian
      godot
      ytmdesktop
      lutris
      protonup-qt
      wine
      winetricks

      # cli
      pamixer
      libnotify
      wl-clipboard
      cliphist
      grimblast
      gdk-pixbuf
    ];
}
