{pkgs, ...}: {
  imports = [
    ./git.nix
    ./neovim
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
  ];

  programs = {
    kitty.enable = true;
    firefox.enable = true;
    wofi.enable = true;
  };
}
