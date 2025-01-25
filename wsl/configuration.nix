{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  users.users.nixos = {
	  isNormalUser = true;
	  extraGroups = [ "networkmanager" "wheel" ];
	  packages = with pkgs; [
		  neovim
		  git
		  nmap
	  ];
  };
}
