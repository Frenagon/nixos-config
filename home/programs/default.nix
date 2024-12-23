{
  pkgs,
  config,
  ...
}: {
  imports = [
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
    alejandra
    tree
    unzip
    pamixer
    jq
    libnotify
    bat
  ];

  programs = {
    firefox.enable = true;
  };
}
