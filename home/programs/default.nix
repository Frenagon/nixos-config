{
  pkgs,
  config,
  ...
}: {
  imports = [
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
