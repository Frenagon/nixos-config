{...}: {
  gtk = {
    enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin = {
    enable = true;
    gtk = {
      enable = true;
      icon.enable = true;
    };
    flavor = "macchiato";
  };
  #  stylix = {
  #    iconTheme = {
  #      enable = true;
  #      package = pkgs.papirus-icon-theme;
  #      dark = "Papirus-Dark";
  #      light = "Papirus-Light";
  #    };
  #  };
}
