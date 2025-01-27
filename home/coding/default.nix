{pkgs, ...}: {
  home.packages = with pkgs; [
    # lsp
    typescript-language-server
    lua-language-server

    # formatter
    alejandra
    stylua
  ];
}
