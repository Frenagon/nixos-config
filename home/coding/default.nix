{pkgs, ...}: {
  home.packages = with pkgs; [
    # languages
    gnumake
    gcc
    rustup

    # lsp
    typescript-language-server
    tailwindcss-language-server
    nodePackages.vscode-json-languageserver
    nixd
    lua-language-server
    marksman

    # formatter
    nodePackages.prettier
    alejandra
    stylua
  ];
}
