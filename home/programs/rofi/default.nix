{
  config,
  pkgs,
  ...
}:
with config.lib.file; let
  rofiConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/rofi/config";
in {
  programs.rofi = {
    enable = true;
    configPath = "";
  };

  home.packages = with pkgs; [
    bemoji
    wtype
  ];

  xdg.configFile."rofi".source = mkOutOfStoreSymlink "${rofiConfig}";
}
