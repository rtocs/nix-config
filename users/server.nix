{ pkgs, ...}:
{
	users.users.nixos = {
		isNormalUser  = true;
		packages = with pkgs; [
			neovim
			curl
			git
		];
		home  = "/home/nixos";
		description  = "server default user";
		extraGroups  = [ "wheel" "networkmanager" ];
		openssh.authorizedKeys.keys  = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIz+Me+uWyR8naM4TBp+pLkawigVQkt6KxG+HWrVc0N''];
	};
}
