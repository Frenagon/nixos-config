{config, ...}:
with config.lib.file; let
  wofiConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/wofi";
in {
  programs.wofi.enable = true;
  stylix.targets.wofi.enable = false;
  xdg.configFile."wofi".source = mkOutOfStoreSymlink "${wofiConfig}";
}
