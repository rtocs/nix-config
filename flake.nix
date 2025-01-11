{
  description = "config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
	modules = [
		./configuration.nix

		nixos-wsl.nixosModules.default
		{
			system.stateVersion = "24.05";
			wsl.enable = true;
			wsl.defaultUser = "nixos";
		}
	];

      };
    };
  };
}
