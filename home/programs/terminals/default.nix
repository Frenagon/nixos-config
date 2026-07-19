{
  lib,
  config,
  ...
}:
with lib; {
  programs.kitty = mkIf (!config.windows.wsl) {
    enable = true;
    extraConfig = ''
      auto_reload_config -1
      window_padding_width 20 10 0 10
    '';
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
    };
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "DejaVu Sans Mono";
      window-padding-x = "10";
      window-padding-y = "20,0";
    };
  };
}
