{pkgs, ...}: {
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.thermald.enable = true;
  programs.auto-cpufreq.enable = true;
  environment.systemPackages = with pkgs; [
    powertop
  ];
}
