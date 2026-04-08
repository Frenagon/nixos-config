{...}: {
  nix.settings = {
    download-buffer-size = 838860800;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
