{lib, ...}:
with lib; {
  imports = [
    ../coding
    ../fonts
    ../programs
    ../scripts
    ../shells
    ../ssh
    ../themes
    ../window-managers
  ];

  options = {
    windows.wsl = mkOption {
      default = false;
      description = "Disables unnecesary modules on WSL";
    };
  };

  config = {
    # Let home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.username = "frenagon";
    home.homeDirectory = "/home/frenagon";

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "24.05";
  };
}
