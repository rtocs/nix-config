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
      multicursors-nvim
      nvim-surround
      nvim-treesitter
    ];

    customRC = ''
      			luafile ${./init.lua}
      		'';
  };
}
