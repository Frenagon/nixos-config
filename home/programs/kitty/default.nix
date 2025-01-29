{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_margin_width 0 10
    '';
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
    };
  };
}
