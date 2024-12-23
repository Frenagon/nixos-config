{config, ...}: {
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
