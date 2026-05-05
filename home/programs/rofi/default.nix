{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    lib.mkIf (!config.windows.wsl) [
      rofi
      bemoji
      wtype
    ];

  xdg.configFile = lib.mkIf (!config.windows.wsl) {
    "rofi".source = ./config;
  };

  home.sessionPath = lib.mkIf (!config.windows.wsl) [
    "$HOME/.config/rofi/scripts"
  ];
}
