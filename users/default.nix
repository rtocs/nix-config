{ pkgs, ...}:
{
	users.users.nixos = {
		isNormalUser  = true;
		packages = with pkgs; [
				git

				gcc
				zig
				go

				gnumake
				ripgrep
				fd
				unzip
				fzf
				nmap

				lua-language-server
				zls
				gopls

				(import ./pkgs-overrides/nvim/dev.nix { inherit pkgs; })
		];

		home  = "/home/nixos";
		description  = "nix";
		extraGroups  = [ "wheel" "networkmanager" ];
	};
}
