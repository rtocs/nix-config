{
	description = "config";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
		nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

	        secrets.url = "git+ssh://git@github.com/you/secrets.git";
	};

	outputs = {
		self,
		nixpkgs,
		disko,
		nixos-wsl,
		...
	} : {
		nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				nixos-wsl.nixosModules.default
				{
					system.stateVersion = "24.05";
					wsl.enable = true;
				}
				./wsl/configuration.nix
				./users/default.nix
			];
		};

		nixosConfigurations.digitalocean = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				disko.nixosModules.disko
				{ disko.devices.disk.disk1.device = "/dev/vda"; }
			{
				# do not use DHCP, as DigitalOcean provisions IPs using cloud-init
				networking.useDHCP = nixpkgs.lib.mkForce false;
				services.cloud-init = {
					enable = true;
					network.enable = true;
				};
				./digitalOceanDroplet/configuration.nix
				./users/server.nix
				./services/game.nix
			];
		};
	};
}
