{
  lib,
  config,
  pkgs,
  ...
}:
with config.lib.file; let
  rofiConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/rofi/config";
in {
  home.packages = with pkgs;
    lib.mkIf (!config.windows.wsl) [
      rofi-wayland
      bemoji
      wtype
    ];

  xdg.configFile = lib.mkIf (!config.windows.wsl) {
    "rofi".source = mkOutOfStoreSymlink "${rofiConfig}";
  };

  home.sessionPath = lib.mkIf (!config.windows.wsl) [
    "$HOME/.config/rofi/scripts"
  ];
}
