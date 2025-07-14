{
  config,
  pkgs,
  ...
}:
with config.lib.file; let
  rofiConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/rofi/config";
in {
  home.packages = with pkgs; [
    rofi-wayland
    bemoji
    wtype
  ];

  xdg.configFile."rofi".source = mkOutOfStoreSymlink "${rofiConfig}";

  home.sessionPath = [
    "$HOME/.config/rofi/scripts"
  ];
}
