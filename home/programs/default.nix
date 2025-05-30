{pkgs, ...}: {
  imports = [
    ./bat
    ./dunst
    ./eza
    ./git
    ./kitty
    ./neovim
    ./rofi
    ./wofi
  ];

  home.packages = with pkgs; [
    # ui
    pavucontrol
    obsidian
    godot

    # cli
    neofetch
    tree
    unzip
    pamixer
    jq
    libnotify
    wl-clipboard
    cliphist
    file
    fd
    grimblast
    clipse
  ];

  programs = {
    vivaldi.enable = true;
    google-chrome.enable = true;
  };
}
