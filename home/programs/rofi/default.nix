{pkgs, ...}: {
  programs.rofi.enable = true;
  home.packages = with pkgs; [
    bemoji
    wtype
  ];
}
