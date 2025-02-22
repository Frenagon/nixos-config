# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...} @ inputs: {
  imports = [
    ./hardware-configuration.nix
    (import ../../modules/intel.nix (inputs // {device-id = "7dd5";}))
    ../../modules/power-management.nix
    ../../modules/hyprland.nix
    ../../modules/bootloader.nix
    ../../modules/colorscheme.nix
  ];

  nix.nixPath = ["nixpkgs=${inputs.inputs.nixpkgs}"];

  # Embedded controller wake-ups drain battery in s2idle on this device
  # See https://lore.kernel.org/all/ZnFYpWHJ5Ml724Nv@ohnotp/
  boot.kernelParams = ["acpi.ec_no_wakeup=1"];

  # Bootloader
  boot.loader.grub = {
    gfxmodeEfi = "1024x768";
  };

  # Hostname
  networking.hostName = "AdaLaptop";

  # Networking
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Time Zone
  time.timeZone = "America/Mexico_City";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_MX.UTF-8";
    LC_IDENTIFICATION = "es_MX.UTF-8";
    LC_MEASUREMENT = "es_MX.UTF-8";
    LC_MONETARY = "es_MX.UTF-8";
    LC_NAME = "es_MX.UTF-8";
    LC_NUMERIC = "es_MX.UTF-8";
    LC_PAPER = "es_MX.UTF-8";
    LC_TELEPHONE = "es_MX.UTF-8";
    LC_TIME = "es_MX.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.frenagon = {
    isNormalUser = true;
    description = "Frenagon";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
