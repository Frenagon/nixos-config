{pkgs, ...}: {
  home.packages = with pkgs; [
    # lsp
    typescript-language-server
    superhtml
    lua-language-server

    # formatter
    alejandra
    stylua
  ];
}
