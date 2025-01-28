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
  ];

  programs = {
    firefox.enable = true;
  };
}
