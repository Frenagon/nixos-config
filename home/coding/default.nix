{pkgs, ...}: {
  home.packages = with pkgs; [
    # lsp
    typescript-language-server
    tailwindcss-language-server
    nixd
    lua-language-server

    # formatter
    alejandra
    stylua
  ];
}
