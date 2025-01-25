{pkgs, ...}: {
  home.packages = with pkgs; [
    # lsp
    lua-language-server

    # formatter
    alejandra
    stylua
  ];
}
