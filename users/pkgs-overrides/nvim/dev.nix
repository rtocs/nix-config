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

      # TODO
      # multicursors-nvim
      nvim-surround

      nvim-treesitter
      nvim-treesitter-parsers.http
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.zig
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.nix
    ];

    customRC = ''
      			luafile ${./init.lua}
      		'';
  };
}
