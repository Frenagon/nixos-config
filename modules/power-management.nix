{pkgs, ...}: {
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  environment.systemPackages = with pkgs; [
    powertop
  ];
}
