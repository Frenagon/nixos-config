{pkgs, ...}: {
  home.packages = with pkgs; [
    # languages
    nodejs
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
    nixd
    lua-language-server
    marksman
    pyright
    emmet-ls
    bash-language-server
    biome
    astro-language-server
    vscode-langservers-extracted

    # formatter
    nodePackages.prettier
    alejandra
    stylua
    black
    shfmt
  ];
}
