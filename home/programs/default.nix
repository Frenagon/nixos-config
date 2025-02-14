{pkgs, ...}: {
  imports = [
    ./bat
    ./dunst
    ./eza
    ./git
    ./kitty
    ./neovim
    ./wofi
  ];

  home.packages = with pkgs; [
    # ui
    pavucontrol
    obsidian

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
  ];

  programs = {
    firefox.enable = true;
    vivaldi.enable = true;
  };
}
