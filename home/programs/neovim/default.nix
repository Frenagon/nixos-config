{
  config,
  lib,
  ...
}:
with config.lib.file; let
  nvimConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/neovim";
in {
  programs.neovim = with lib; {
    enable = mkDefault true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  catppuccin.nvim.enable = false;
  xdg.configFile."nvim".source = mkOutOfStoreSymlink "${nvimConfig}";
}
