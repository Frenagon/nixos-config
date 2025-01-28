{pkgs, ...}: {
  home.packages = with pkgs; [
    # compiler
    gcc

    # lsp
    typescript-language-server
    tailwindcss-language-server
    nixd
    lua-language-server

    # formatter
    nodePackages.prettier
    alejandra
    stylua
  ];
}
