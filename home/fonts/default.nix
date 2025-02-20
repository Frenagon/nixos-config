{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    font-awesome
    liberation_ttf
    dejavu_fonts
    jetbrains-mono
  ];
}
