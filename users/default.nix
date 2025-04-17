{ pkgs, ...}:
{
	users.users.nixos = {
		isNormalUser  = true;
		# we only add executables
		packages = with pkgs; [
			neovim
			git
			nmap
			curl
		];

		home  = "/home/nixos";
		description  = "nix";
		extraGroups  = [ "wheel" "networkmanager" ];
		openssh.authorizedKeys.keys  = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIz+Me+uWyR8naM4TBp+pLkawigVQkt6KxG+HWrVc0N''];
	};

}
