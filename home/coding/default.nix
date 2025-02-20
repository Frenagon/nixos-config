{pkgs, ...}: {
  home.packages = with pkgs; [
    # languages
    gnumake
    gcc
    rustup
    (python3.withPackages (py-pkgs:
      with py-pkgs; [
        requests
        datetime
      ]))

    # lsp
    typescript-language-server
    tailwindcss-language-server
    nodePackages.vscode-json-languageserver
    nixd
    lua-language-server
    marksman
    pyright

    # formatter
    nodePackages.prettier
    alejandra
    stylua
    black
  ];
}
