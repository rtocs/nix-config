{pkgs} :
pkgs.neovim.override {
	configure = {
		packages.myPlugins.start = with pkgs.vimPlugins; [
			nvim-lspconfig
			telescope-nvim
			blink-cmp
	];

		customRC = ''
			luafile ${./init.lua}
		'';
	};
}
