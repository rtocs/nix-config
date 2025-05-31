{pkgs} :
pkgs.neovim.override {
	configure = {
		packages.myPlugins.start = with pkgs.vimPlugins; [
			nvim-lspconfig
			plenary-nvim
		];

		customRC = ''
			lua << EOF
			${builtins.readFile ./init.lua}
			EOF
			'';
	};
}
