{
  config,
  pkgs,
  ...
}: let
  nvimConfig = "${config.home.homeDirectory}/.nixos-config/home/programs/neovim";
in {
  home = {
    packages = with pkgs; [
      neovim
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfig;

  catppuccin.nvim.enable = false;
}
