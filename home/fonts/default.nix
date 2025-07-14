{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    liberation_ttf
    dejavu_fonts
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    (google-fonts.override {fonts = ["Grape Nuts"];})
    icomoon-feather
  ];
}
