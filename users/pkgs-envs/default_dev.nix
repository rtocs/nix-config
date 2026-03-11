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

  gcc
  zig
  go
  rustc
  elixir

  # dev env
  git
  cargo
  lua-language-server
  nil
  zls

  python3
  pyright

  gopls
  delve
  (import pkgs-overrides/nvim/dev.nix { inherit pkgs; })
]
