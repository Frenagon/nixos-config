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
    ./tmux
    ./zoxide
  ];

  home.packages = with pkgs;
    [
      # cli
      fastfetch
      tree
      unzip
      jq
      file
      fd
      fzf
      clipse
      procps
      usbutils
      mkcert
      pamtester
      libsecret
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
      bottles
      qalculate-gtk
      seahorse

      # cli
      pamixer
      libnotify
      wl-clipboard
      cliphist
      grimblast
      gdk-pixbuf
    ];
}
