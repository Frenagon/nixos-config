{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 20 10 0 10
    '';
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
    };
  };
}
