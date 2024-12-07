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

    # cli
    neofetch
    alejandra
    tree
  ];
}
