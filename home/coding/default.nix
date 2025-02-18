{pkgs, ...}: {
  home.packages = with pkgs; [
    # languages
    gnumake
    gcc
    rustup

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
