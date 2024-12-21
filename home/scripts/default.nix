{config, ...}:
with config.lib.file; let
  scriptsDir = "${config.home.homeDirectory}/.nixos-config/home/scripts";
in {
  home.file = {
    ".local/scripts".source = mkOutOfStoreSymlink "${scriptsDir}/scripts";
    ".local/data".source = mkOutOfStoreSymlink "${scriptsDir}/data";
  };
}
