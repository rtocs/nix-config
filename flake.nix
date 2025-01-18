{
  description = "config";
  inputs = {
	  nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

	  disko.url = "github:nix-community/disko";
	  disko.inputs.nixpkgs.follows = "nixpkgs";

	  nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations.wsl = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
	modules = [
		./wsl/configuration.nix
	];
      };
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
          }
	  ./digitalOceanDroplet/configuration.nix
        ];
      };
  };
}
