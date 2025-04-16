{ pkgs, ...}:
{
	users.users.dev = {
		isNormalUser  = true;
		packages = with pkgs; [
			neovim
			git
			nmap
			lua 
		];

		home  = "/home/dev";
		description  = "dev user";
		extraGroups  = [ "wheel" "networkmanager" ];
		openssh.authorizedKeys.keys  = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIz+Me+uWyR8naM4TBp+pLkawigVQkt6KxG+HWrVc0N''];
	};

}
