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

				lua-language-server
				zls

				(import ./pkgs-overrides/nvim/dev.nix { inherit pkgs; })
		];

		home  = "/home/nixos";
		description  = "nix";
		extraGroups  = [ "wheel" "networkmanager" ];
	};
}
