{ pkgs }:
with pkgs;
pkgs.mkShell {
  packages = [
    aseprite

    gnumake
    ripgrep
    fd
    unzip
    fzf
    nmap
    sqlite
    tree-sitter

    gcc
    clang-tools

    zig
    go
    dotnet-sdk_10
    rustc
    elixir
    elixir-ls
    git
    cargo
    lua-language-server
    nil
    zls
    python3
    pyright
    gopls
    delve
    racket
    (import ./pkgs-overrides/nvim/dev.nix { inherit pkgs; })

    opencode
    claude-code
  ];
}
