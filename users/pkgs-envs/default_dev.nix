{ pkgs }:
with pkgs;
[
  gnumake
  ripgrep
  fd
  unzip
  fzf
  nmap
  sqlite
  tree-sitter
  gcc
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
