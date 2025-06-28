{pkgs} :
pkgs.neovim.override {
	configure = {
		packages.myPlugins.start = with pkgs.vimPlugins; [
			nvim-lspconfig
			telescope-nvim
			oil-nvim


			nvim-treesitter
			nvim-treesitter-parsers.nix
			nvim-treesitter-parsers.lua
			nvim-treesitter-parsers.zig
	];

		customRC = ''
			luafile ${./init.lua}
		'';
	};
}
