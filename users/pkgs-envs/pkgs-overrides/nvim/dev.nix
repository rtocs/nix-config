{ pkgs }:
pkgs.neovim.override {
  configure = {
    packages.myPlugins.start = with pkgs.vimPlugins; [
      nvim-lspconfig
      telescope-nvim
      oil-nvim
      blink-cmp
      nvim-dap
      nvim-dap-ui
      nvim-dap-go

      nvim-surround
      (nvim-treesitter.withPlugins (p: [
        p.go
        p.nix
        p.lua
        p.bash
        p.python
        p.html
        p.javascript
        p.elixir
        p.json
        p.zig
        p.cpp
        p.http
        p.racket
      ]))
    ];

    customRC = ''
      			luafile ${./init.lua}
      		'';
  };
}
