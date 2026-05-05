{lib, ...}: {
  programs.neovim = with lib; {
    enable = mkDefault true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };
  catppuccin.nvim.enable = false;
  xdg.configFile."nvim".source = ../neovim;
}
