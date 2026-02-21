{ pkgs, ... }:
{
  users.users.nixos = {
    isNormalUser = true;
    # we want to extract the dev env
    packages = (import .pkgs-envs/default_dev.nix { inherit pkgs; });
    home = "/home/nixos";
    description = "nix";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
