{ pkgs, ...}:
{
	users.users.nixos = {
		isNormalUser  = true;
		packages = with pkgs; [
				git
				gcc
				gnumake
				ripgrep
				fd
				unzip
				
				# lsps
				lua-language-server
				zls

				(import ./pkgs-overrides/nvim/dev.nix { inherit pkgs; })
		];

		home  = "/home/nixos";
		description  = "nix";
		extraGroups  = [ "wheel" "networkmanager" ];
		openssh.authorizedKeys.keys  = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIz+Me+uWyR8naM4TBp+pLkawigVQkt6KxG+HWrVc0N''];
	};
}
