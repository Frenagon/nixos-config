{pkgs, ...}: {
  home.packages = with pkgs; [
    # ai
    github-copilot-cli

    # languages
    nodejs
    gnumake
    gcc
    cargo
    rustc
    (python3.withPackages (py-pkgs:
      with py-pkgs; [
        requests
        datetime
      ]))

    # lsp
    vtsls
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
    prettier
    alejandra
    stylua
    black
    shfmt

    # tools
    tree-sitter
  ];
}
