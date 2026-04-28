{ pkgs }:
with pkgs;
[
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
  (import pkgs-overrides/nvim/dev.nix { inherit pkgs; })

  # vibe tools
  opencode
  claude-code
]
