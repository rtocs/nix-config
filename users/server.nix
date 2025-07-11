{ pkgs, rtocs-secrets, ...}:
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
		openssh.authorizedKeys.keys  = [
			rtocs-secrets.wslKeyMain
		];
	};
}
