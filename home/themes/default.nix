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
    accent = "sapphire";
    cursors = {
      enable = true;
    };
  };
}
