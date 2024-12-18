{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../resources/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  };
}
