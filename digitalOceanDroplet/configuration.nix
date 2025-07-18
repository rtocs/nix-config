{
		modulesPath,
		lib,
		pkgs,
		secrets,
		...
}:
{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
			(modulesPath + "/profiles/qemu-guest.nix")
			./disk-config.nix
	];
	boot.loader.grub = {
	# no need to set devices, disko will add all devices that have a EF02 partition to the list already
	# devices = [ ];
		efiSupport = true;
		efiInstallAsRemovable = true;
	};

	environment.systemPackages = map lib.lowPrio [
			pkgs.git
			pkgs.neovim
	];

	environment.variables.EDITOR = "nvim";

	services.openssh.enable = true;
	users.users.root.openssh.authorizedKeys.keys = [
		secrets.wslKeyMain
		secrets.wslKeyLaptop
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "24.05";
}
