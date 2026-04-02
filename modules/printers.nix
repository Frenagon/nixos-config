{...}: {
  services.printing = {
    enable = true;
    browsing = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  networking.firewall = {
    allowedTCPPorts = [631];
    allowedUDPPorts = [631];
  };
}
