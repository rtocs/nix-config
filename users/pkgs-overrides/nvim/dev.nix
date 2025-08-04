{pkgs} :
pkgs.neovim.override {
	configure = {
		packages.myPlugins.start = with pkgs.vimPlugins; [
			nvim-lspconfig
			
			telescope-nvim
			telescope-ui-select-nvim

			oil-nvim
			
			nvim-treesitter
			nvim-treesitter-parsers.http
			nvim-treesitter-parsers.nix
			nvim-treesitter-parsers.lua
			nvim-treesitter-parsers.zig
			nvim-treesitter-parsers.go
			nvim-treesitter-parsers.html
	];

		customRC = ''
			luafile ${./init.lua}
		'';
	};
}
