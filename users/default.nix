{ ... }:
{
  users.users.nixos = {
    isNormalUser = true;
    home = "/home/nixos";
    description = "nix";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
