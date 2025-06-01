{pkgs} :
pkgs.neovim.override {
	configure = {
		packages.myPlugins.start = with pkgs.vimPlugins; [
			nvim-lspconfig
			telescope-nvim
		];

		customRC = ''
			luafile ${./init.lua}
		'';
	};
}
