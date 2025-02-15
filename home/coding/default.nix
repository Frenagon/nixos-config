{pkgs, ...}: {
  home.packages = with pkgs; [
    # compiler
    gnumake
    gcc

    # lsp
    typescript-language-server
    tailwindcss-language-server
    nixd
    lua-language-server
    marksman

    # formatter
    nodePackages.prettier
    alejandra
    stylua
  ];
}
