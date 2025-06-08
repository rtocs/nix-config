{ pkgs, ...}:
{
	users.users.server = {
		isNormalUser  = true;
		packages = with pkgs; [
			neovim
		];

		home  = "/home/server";
		description  = "server";

		extraGroups  = [ "wheel" "networkmanager" ];
		openssh.authorizedKeys.keys  = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIz+Me+uWyR8naM4TBp+pLkawigVQkt6KxG+HWrVc0N''];
	};

}
