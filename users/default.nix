{ pkgs, ... }:
{
  users.users.nixos = {
    isNormalUser = true;
    packages = with pkgs; [
      gnumake
      ripgrep
      fd
      unzip
      fzf
      nmap

      sqlite

      # Compliers
      gcc
      zig
      go
      rustc

      # dev env
      git
      cargo
      lua-language-server
      nil
      zls
      python3

      gopls
      delve
      (import ./pkgs-overrides/nvim/dev.nix { inherit pkgs; })
    ];

    home = "/home/nixos";
    description = "nix";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
