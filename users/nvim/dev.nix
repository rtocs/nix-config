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
	];

		customRC = ''
			luafile ${./init.lua}
		'';
	};
}
