{lib, ...}:
with lib; {
  programs.neovim = {
    enable = mkDefault true;
    viAlias = true;
    vimAlias = true;
  };
}
