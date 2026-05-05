{
  config,
  pkgs,
  ...
}:
with config.lib.file; let
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

    file.".config/nvim".source = mkOutOfStoreSymlink "${nvimConfig}";
  };

  catppuccin.nvim.enable = false;
}
