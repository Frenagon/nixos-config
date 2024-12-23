{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./dunst
    ./git
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
  ];

  programs = {
    kitty.enable = true;
    firefox.enable = true;
  };
}
