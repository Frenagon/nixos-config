{pkgs, ...}: {
  imports = [
    ./git.nix
    ./neovim
  ];

  home.packages = with pkgs; [
    # ui
    firefox
    kitty
    wofi
    pavucontrol
    obsidian

    # cli
    neofetch
    alejandra
    tree
  ];
}
