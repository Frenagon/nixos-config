{
  pkgs,
  config,
  ...
}: {
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
    libnotify
  ];

  programs = {
    kitty.enable = true;
    firefox.enable = true;
    wofi.enable = true;
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        enable_recursive_icon_lookup = true;
        icon_theme = config.stylix.iconTheme.dark;
      };
    };
  };
}
